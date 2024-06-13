import chisel3._
import chisel3.util.{switch, is}
import chisel3.stage.ChiselStage

class VendingMachine(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val price = Input(UInt(5.W))
    val coin2 = Input(Bool())
    val coin5 = Input(Bool())
    val buy = Input(Bool())
    val releaseCan = Output(Bool())
    val alarm = Output(Bool())
    val seg = Output(UInt(7.W))
    //val an = Output(UInt(4.W))
  })
	//States of FSM
	object Stage extends ChiselEnum {
		val start, poll, add2, add5, wait2, wait5, S_buy, check, S_alarm, drop = Value
	}
	import Stage._
	val stateReg = RegInit(start)
	val nextStage = RegInit(start)
	
	//Initialize variables
  	val sevSeg = WireDefault(0.U)
  	val price = io.price
  	val coin2 = io.coin2
	val coin5 = io.coin5
    val buy = io.buy
    
    //Initialize IO value
    io.releaseCan := 0.B
    io.alarm := 0.B
    
	//Initialize register
	val money = RegInit(0.U(5.W))
	val enoughMoney = RegInit(0.B)
    val two = RegInit(2.U((5.W)))
    val five = RegInit(5.U((5.W)))
	val sub_money_flag = RegInit(0.B)
	//State switch
	stateReg := nextStage
/*============================================*/

/*          	STATES TRANSITION      	      */
 
/*============================================*/
	//State transition condition
	switch(stateReg){
		is (start) {nextStage := poll}
	/*============================================*/
		is (poll) {
			when (coin2) {
				nextStage := add2
			} .elsewhen (coin5) {
				nextStage := add5
			} .elsewhen (buy) {
				nextStage := S_buy
			} .otherwise {
				nextStage := poll
			}
		}
	/*============================================*/		
		is (add2) {nextStage := wait2}
	/*============================================*/		
		is (add5) {nextStage := wait5}
	/*============================================*/		
		is (wait2) {
			when (coin2) {
			nextStage := wait2
			} .otherwise {nextStage := poll}
		}
	/*============================================*/		
		is (wait5) {
					when (coin5) {
					nextStage := wait5
					} .otherwise {nextStage := poll}
				}
	/*============================================*/		
		is (S_buy) {nextStage := check}
	/*============================================*/		
		is (check) {
			when (enoughMoney === 1.B) {
				nextStage := drop
			} .otherwise {nextStage := S_alarm}
		}
	/*============================================*/		
		is (S_alarm) {
			when (buy) {
				nextStage := S_alarm
			} .otherwise {nextStage := poll}
		}
	/*============================================*/		
		is (drop) {nextStage := start}
	}
/*============================================*/

/*          	 STATES OUTPUT           	  */
 
/*============================================*/
	switch(stateReg){
		is (start) {
			enoughMoney := 0.B
			io.releaseCan := 0.B
			sub_money_flag := 0.B
		}
	/*============================================*/
		is (poll) {
			io.alarm := 0.B		
		}
	/*============================================*/
		is (add2) {
			money := money + two
			two := 0.U
		}
	/*============================================*/
		is (add5) {
			money := money + five
			five := 0.U
		}
	/*============================================*/
		is (wait2) {
				two := 2.U
			}
	/*============================================*/
		is (wait5) {
					five := 5.U
				}
	/*============================================*/
		is (S_buy) {
			when (money < price) {
				enoughMoney := 0.B
			} .otherwise {enoughMoney := 1.B}
		}
	/*============================================*/
		is (check) {
			//idk what to add here
		}
	/*============================================*/
		is (S_alarm) {
			io.alarm := 1.B
		}
	/*============================================*/
		is (drop) {
			when (sub_money_flag === 0.B) {
				money := money - price
				io.releaseCan := 1.B
				sub_money_flag := 1.B
			} 
		}
	}
/*============================================*/

/*           7-SEGMENT LED DECODER         	  */
 
/*============================================*/
       switch(money) {
      	 is ("b0000".U) {sevSeg := "b0111111".U}
         is ("b0001".U) {sevSeg := "b0000110".U}
         is ("b0010".U) {sevSeg := "b1011011".U}
         is ("b0011".U) {sevSeg := "b1001111".U}
         is ("b0100".U) {sevSeg := "b1100110".U}
         is ("b0101".U) {sevSeg := "b1101101".U}
         is ("b0110".U) {sevSeg := "b1111101".U}
         is ("b0111".U) {sevSeg := "b0000111".U}
         is ("b1000".U) {sevSeg := "b1111111".U}
         is ("b1001".U) {sevSeg := "b1101111".U}
          //  default: {sevReg := "b0000110" }
          }

  // ***** connections *****
  io.seg := ~sevSeg
}

// generate Verilog
object VendingMachine extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new VendingMachine(100000))
}


