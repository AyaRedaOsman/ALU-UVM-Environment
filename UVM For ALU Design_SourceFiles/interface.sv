interface alu_inf( input logic clk, rst);

 	logic [7:0] src1;
    logic [7:0] src2;
    logic [7:0] src3;
  	logic       srcCy;
    logic       srcAc;
    logic       bit_in;
	logic [3:0] op_code;
	logic       desCy;
    logic       desAc;
    logic       desOv;
    logic [7:0] des1;
    logic [7:0] des2;
    logic [7:0] des_acc;
    logic [7:0] sub_result;
    
  clocking driver_cb @(posedge clk);
    default input #1 output #1;
  output  src1;
  output  src2;
  output  src3;
  output  srcCy;
  output  srcAc;
  output  bit_in;
  output  op_code;
  input   des1;
  input   des2;
  input   des_acc;
  input   sub_result;
  input   desCy;
  input   desAc;
  input   desOv;
  endclocking
  
  clocking monitor_cb @(negedge clk);
    default input #1 output #1;
  input  src1;
  input  src2;
  input  src3;
  input  srcCy;
  input  srcAc;
  input  bit_in;
  input  op_code;
  input  des1;
  input  des2;
  input  des_acc;
  input  sub_result;
  input  desCy;
  input  desAc;
  input  desOv;
  endclocking 
  
  modport DRIVER (clocking driver_cb, input clk,rst);
  modport MONITOR (clocking monitor_cb, input clk,rst);
      
      endinterface
      