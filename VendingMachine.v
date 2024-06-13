module VendingMachine(
  input        clock,
  input        reset,
  input  [4:0] io_price,
  input        io_coin2,
  input        io_coin5,
  input        io_buy,
  output       io_releaseCan,
  output       io_alarm,
  output [6:0] io_seg
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] stateReg; // @[VendingMachine.scala 21:31]
  reg [3:0] nextStage; // @[VendingMachine.scala 22:32]
  reg [4:0] money; // @[VendingMachine.scala 36:28]
  reg  enoughMoney; // @[VendingMachine.scala 37:34]
  reg [4:0] two; // @[VendingMachine.scala 38:22]
  reg [4:0] five; // @[VendingMachine.scala 39:23]
  reg  sub_money_flag; // @[VendingMachine.scala 40:37]
  wire  _T_2 = 4'h0 == stateReg; // @[VendingMachine.scala 49:25]
  wire  _T_5 = 4'h1 == stateReg; // @[VendingMachine.scala 49:25]
  wire [2:0] _GEN_0 = io_buy ? 3'h6 : 3'h1; // @[VendingMachine.scala 57:43 58:43 60:43]
  wire [2:0] _GEN_1 = io_coin5 ? 3'h3 : _GEN_0; // @[VendingMachine.scala 55:45 56:43]
  wire [2:0] _GEN_2 = io_coin2 ? 3'h2 : _GEN_1; // @[VendingMachine.scala 53:38 54:43]
  wire  _T_8 = 4'h2 == stateReg; // @[VendingMachine.scala 49:25]
  wire  _T_11 = 4'h3 == stateReg; // @[VendingMachine.scala 49:25]
  wire  _T_14 = 4'h4 == stateReg; // @[VendingMachine.scala 49:25]
  wire [2:0] _GEN_3 = io_coin2 ? 3'h4 : 3'h1; // @[VendingMachine.scala 69:38 70:35 71:49]
  wire  _T_17 = 4'h5 == stateReg; // @[VendingMachine.scala 49:25]
  wire [2:0] _GEN_4 = io_coin5 ? 3'h5 : 3'h1; // @[VendingMachine.scala 75:54 76:51 77:65]
  wire  _T_20 = 4'h6 == stateReg; // @[VendingMachine.scala 49:25]
  wire  _T_23 = 4'h7 == stateReg; // @[VendingMachine.scala 49:25]
  wire [3:0] _GEN_5 = enoughMoney ? 4'h9 : 4'h8; // @[VendingMachine.scala 83:52 84:43 85:49]
  wire  _T_27 = 4'h8 == stateReg; // @[VendingMachine.scala 49:25]
  wire [3:0] _GEN_6 = io_buy ? 4'h8 : 4'h1; // @[VendingMachine.scala 89:36 90:43 91:49]
  wire  _T_30 = 4'h9 == stateReg; // @[VendingMachine.scala 49:25]
  wire [3:0] _GEN_7 = 4'h9 == stateReg ? 4'h0 : nextStage; // @[VendingMachine.scala 49:25 22:32 94:38]
  wire [3:0] _GEN_8 = 4'h8 == stateReg ? _GEN_6 : _GEN_7; // @[VendingMachine.scala 49:25]
  wire [3:0] _GEN_9 = 4'h7 == stateReg ? _GEN_5 : _GEN_8; // @[VendingMachine.scala 49:25]
  wire [3:0] _GEN_10 = 4'h6 == stateReg ? 4'h7 : _GEN_9; // @[VendingMachine.scala 49:25 80:39]
  wire [3:0] _GEN_11 = 4'h5 == stateReg ? {{1'd0}, _GEN_4} : _GEN_10; // @[VendingMachine.scala 49:25]
  wire [3:0] _GEN_12 = 4'h4 == stateReg ? {{1'd0}, _GEN_3} : _GEN_11; // @[VendingMachine.scala 49:25]
  wire [3:0] _GEN_13 = 4'h3 == stateReg ? 4'h5 : _GEN_12; // @[VendingMachine.scala 49:25 66:38]
  wire [4:0] _money_T_1 = money + two; // @[VendingMachine.scala 113:40]
  wire [4:0] _money_T_3 = money + five; // @[VendingMachine.scala 118:40]
  wire  _GEN_17 = money < io_price ? 1'h0 : 1'h1; // @[VendingMachine.scala 131:46 132:45 133:51]
  wire  _T_62 = ~sub_money_flag; // @[VendingMachine.scala 145:46]
  wire [4:0] _money_T_5 = money - io_price; // @[VendingMachine.scala 146:48]
  wire [4:0] _GEN_18 = ~sub_money_flag ? _money_T_5 : money; // @[VendingMachine.scala 145:55 146:39 36:28]
  wire  _GEN_20 = ~sub_money_flag | sub_money_flag; // @[VendingMachine.scala 145:55 148:48 40:37]
  wire [4:0] _GEN_21 = _T_30 ? _GEN_18 : money; // @[VendingMachine.scala 101:25 36:28]
  wire  _GEN_23 = _T_30 ? _GEN_20 : sub_money_flag; // @[VendingMachine.scala 101:25 40:37]
  wire [4:0] _GEN_25 = _T_27 ? money : _GEN_21; // @[VendingMachine.scala 101:25 36:28]
  wire  _GEN_26 = _T_27 ? 1'h0 : _T_30 & _T_62; // @[VendingMachine.scala 101:25 32:19]
  wire  _GEN_27 = _T_27 ? sub_money_flag : _GEN_23; // @[VendingMachine.scala 101:25 40:37]
  wire  _GEN_28 = _T_23 ? 1'h0 : _T_27; // @[VendingMachine.scala 101:25 33:14]
  wire [4:0] _GEN_29 = _T_23 ? money : _GEN_25; // @[VendingMachine.scala 101:25 36:28]
  wire  _GEN_30 = _T_23 ? 1'h0 : _GEN_26; // @[VendingMachine.scala 101:25 32:19]
  wire  _GEN_31 = _T_23 ? sub_money_flag : _GEN_27; // @[VendingMachine.scala 101:25 40:37]
  wire  _GEN_32 = _T_20 ? _GEN_17 : enoughMoney; // @[VendingMachine.scala 101:25 37:34]
  wire  _GEN_33 = _T_20 ? 1'h0 : _GEN_28; // @[VendingMachine.scala 101:25 33:14]
  wire [4:0] _GEN_34 = _T_20 ? money : _GEN_29; // @[VendingMachine.scala 101:25 36:28]
  wire  _GEN_35 = _T_20 ? 1'h0 : _GEN_30; // @[VendingMachine.scala 101:25 32:19]
  wire  _GEN_36 = _T_20 ? sub_money_flag : _GEN_31; // @[VendingMachine.scala 101:25 40:37]
  wire [4:0] _GEN_37 = _T_17 ? 5'h5 : five; // @[VendingMachine.scala 101:25 127:46 39:23]
  wire  _GEN_38 = _T_17 ? enoughMoney : _GEN_32; // @[VendingMachine.scala 101:25 37:34]
  wire  _GEN_39 = _T_17 ? 1'h0 : _GEN_33; // @[VendingMachine.scala 101:25 33:14]
  wire [4:0] _GEN_40 = _T_17 ? money : _GEN_34; // @[VendingMachine.scala 101:25 36:28]
  wire  _GEN_41 = _T_17 ? 1'h0 : _GEN_35; // @[VendingMachine.scala 101:25 32:19]
  wire  _GEN_42 = _T_17 ? sub_money_flag : _GEN_36; // @[VendingMachine.scala 101:25 40:37]
  wire [4:0] _GEN_43 = _T_14 ? 5'h2 : two; // @[VendingMachine.scala 101:25 123:37 38:22]
  wire [4:0] _GEN_44 = _T_14 ? five : _GEN_37; // @[VendingMachine.scala 101:25 39:23]
  wire  _GEN_45 = _T_14 ? enoughMoney : _GEN_38; // @[VendingMachine.scala 101:25 37:34]
  wire  _GEN_46 = _T_14 ? 1'h0 : _GEN_39; // @[VendingMachine.scala 101:25 33:14]
  wire [4:0] _GEN_47 = _T_14 ? money : _GEN_40; // @[VendingMachine.scala 101:25 36:28]
  wire  _GEN_48 = _T_14 ? 1'h0 : _GEN_41; // @[VendingMachine.scala 101:25 32:19]
  wire  _GEN_49 = _T_14 ? sub_money_flag : _GEN_42; // @[VendingMachine.scala 101:25 40:37]
  wire [4:0] _GEN_50 = _T_11 ? _money_T_3 : _GEN_47; // @[VendingMachine.scala 101:25 118:31]
  wire [4:0] _GEN_51 = _T_11 ? 5'h0 : _GEN_44; // @[VendingMachine.scala 101:25 119:30]
  wire [4:0] _GEN_52 = _T_11 ? two : _GEN_43; // @[VendingMachine.scala 101:25 38:22]
  wire  _GEN_53 = _T_11 ? enoughMoney : _GEN_45; // @[VendingMachine.scala 101:25 37:34]
  wire  _GEN_54 = _T_11 ? 1'h0 : _GEN_46; // @[VendingMachine.scala 101:25 33:14]
  wire  _GEN_55 = _T_11 ? 1'h0 : _GEN_48; // @[VendingMachine.scala 101:25 32:19]
  wire  _GEN_56 = _T_11 ? sub_money_flag : _GEN_49; // @[VendingMachine.scala 101:25 40:37]
  wire  _GEN_61 = _T_8 ? 1'h0 : _GEN_54; // @[VendingMachine.scala 101:25 33:14]
  wire  _GEN_62 = _T_8 ? 1'h0 : _GEN_55; // @[VendingMachine.scala 101:25 32:19]
  wire  _GEN_64 = _T_5 ? 1'h0 : _GEN_61; // @[VendingMachine.scala 101:25 109:34]
  wire  _GEN_69 = _T_5 ? 1'h0 : _GEN_62; // @[VendingMachine.scala 101:25 32:19]
  wire [6:0] _GEN_78 = 5'h9 == money ? 7'h6f : 7'h0; // @[VendingMachine.scala 157:22 167:33 25:33]
  wire [6:0] _GEN_79 = 5'h8 == money ? 7'h7f : _GEN_78; // @[VendingMachine.scala 157:22 166:33]
  wire [6:0] _GEN_80 = 5'h7 == money ? 7'h7 : _GEN_79; // @[VendingMachine.scala 157:22 165:33]
  wire [6:0] _GEN_81 = 5'h6 == money ? 7'h7d : _GEN_80; // @[VendingMachine.scala 157:22 164:33]
  wire [6:0] _GEN_82 = 5'h5 == money ? 7'h6d : _GEN_81; // @[VendingMachine.scala 157:22 163:33]
  wire [6:0] _GEN_83 = 5'h4 == money ? 7'h66 : _GEN_82; // @[VendingMachine.scala 157:22 162:33]
  wire [6:0] _GEN_84 = 5'h3 == money ? 7'h4f : _GEN_83; // @[VendingMachine.scala 157:22 161:33]
  wire [6:0] _GEN_85 = 5'h2 == money ? 7'h5b : _GEN_84; // @[VendingMachine.scala 157:22 160:33]
  wire [6:0] _GEN_86 = 5'h1 == money ? 7'h6 : _GEN_85; // @[VendingMachine.scala 157:22 159:33]
  wire [6:0] sevSeg = 5'h0 == money ? 7'h3f : _GEN_86; // @[VendingMachine.scala 157:22 158:33]
  assign io_releaseCan = _T_2 ? 1'h0 : _GEN_69; // @[VendingMachine.scala 101:25 104:39]
  assign io_alarm = _T_2 ? 1'h0 : _GEN_64; // @[VendingMachine.scala 101:25 33:14]
  assign io_seg = ~sevSeg; // @[VendingMachine.scala 172:13]
  always @(posedge clock) begin
    if (reset) begin // @[VendingMachine.scala 21:31]
      stateReg <= 4'h0; // @[VendingMachine.scala 21:31]
    end else begin
      stateReg <= nextStage; // @[VendingMachine.scala 42:18]
    end
    if (reset) begin // @[VendingMachine.scala 22:32]
      nextStage <= 4'h0; // @[VendingMachine.scala 22:32]
    end else if (4'h0 == stateReg) begin // @[VendingMachine.scala 49:25]
      nextStage <= 4'h1; // @[VendingMachine.scala 50:39]
    end else if (4'h1 == stateReg) begin // @[VendingMachine.scala 49:25]
      nextStage <= {{1'd0}, _GEN_2};
    end else if (4'h2 == stateReg) begin // @[VendingMachine.scala 49:25]
      nextStage <= 4'h4; // @[VendingMachine.scala 64:38]
    end else begin
      nextStage <= _GEN_13;
    end
    if (reset) begin // @[VendingMachine.scala 36:28]
      money <= 5'h0; // @[VendingMachine.scala 36:28]
    end else if (!(_T_2)) begin // @[VendingMachine.scala 101:25]
      if (!(_T_5)) begin // @[VendingMachine.scala 101:25]
        if (_T_8) begin // @[VendingMachine.scala 101:25]
          money <= _money_T_1; // @[VendingMachine.scala 113:31]
        end else begin
          money <= _GEN_50;
        end
      end
    end
    if (reset) begin // @[VendingMachine.scala 37:34]
      enoughMoney <= 1'h0; // @[VendingMachine.scala 37:34]
    end else if (_T_2) begin // @[VendingMachine.scala 101:25]
      enoughMoney <= 1'h0; // @[VendingMachine.scala 103:37]
    end else if (!(_T_5)) begin // @[VendingMachine.scala 101:25]
      if (!(_T_8)) begin // @[VendingMachine.scala 101:25]
        enoughMoney <= _GEN_53;
      end
    end
    if (reset) begin // @[VendingMachine.scala 38:22]
      two <= 5'h2; // @[VendingMachine.scala 38:22]
    end else if (!(_T_2)) begin // @[VendingMachine.scala 101:25]
      if (!(_T_5)) begin // @[VendingMachine.scala 101:25]
        if (_T_8) begin // @[VendingMachine.scala 101:25]
          two <= 5'h0; // @[VendingMachine.scala 114:29]
        end else begin
          two <= _GEN_52;
        end
      end
    end
    if (reset) begin // @[VendingMachine.scala 39:23]
      five <= 5'h5; // @[VendingMachine.scala 39:23]
    end else if (!(_T_2)) begin // @[VendingMachine.scala 101:25]
      if (!(_T_5)) begin // @[VendingMachine.scala 101:25]
        if (!(_T_8)) begin // @[VendingMachine.scala 101:25]
          five <= _GEN_51;
        end
      end
    end
    if (reset) begin // @[VendingMachine.scala 40:37]
      sub_money_flag <= 1'h0; // @[VendingMachine.scala 40:37]
    end else if (_T_2) begin // @[VendingMachine.scala 101:25]
      sub_money_flag <= 1'h0; // @[VendingMachine.scala 105:40]
    end else if (!(_T_5)) begin // @[VendingMachine.scala 101:25]
      if (!(_T_8)) begin // @[VendingMachine.scala 101:25]
        sub_money_flag <= _GEN_56;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  nextStage = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  money = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  enoughMoney = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  two = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  five = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  sub_money_flag = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
