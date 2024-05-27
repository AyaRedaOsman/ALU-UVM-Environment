`include "uvm_macros.svh"
import uvm_pkg::*;
`include "interface.sv"
`include "test.sv"

module tbench_top;
   
  //clock and reset signal declaration
  bit clk;
  bit rst;
 
  //clock generation
  always #5 clk = ~clk;
   
  //reset Generation
  initial begin
    rst = 1;
    #5 rst =0;
  end
  
  alu_inf intf(clk,rst);
  
      oc8051_alu DUT (
   		.clk(intf.clk),
    	.rst(intf.rst),
        .src1(intf.src1),
        .src2(intf.src2),
        .src3(intf.src3),
        .srcCy(intf.srcCy),
        .srcAc(intf.srcAc),
        .bit_in(intf.bit_in),
        .des1(intf.des1),
        .des2(intf.des2),
        .des_acc(intf.des_acc),
        .desCy(intf.desCy),
        .desAc(intf.desAc),
        .desOv(intf.desOv),
        .sub_result(intf.sub_result),
        .op_code(intf.op_code));
  
  initial begin
    uvm_config_db#(virtual alu_inf)::set(null,"*","vif",intf);
    $dumpfile("dump.vcd");
    $dumpvars;
  end
   
  initial begin
    run_test("test");
  end
endmodule