import uvm_pkg::*;
`include "uvm_macros.svh"

class coverage extends uvm_subscriber #(seq_item);

`uvm_component_utils(coverage)

  
 	bit       srcCy, srcAc, bit_in;
	bit [3:0] op_code;
	bit [7:0] src1, src2, src3;
	bit       desCy, desAc, desOv;
	bit [7:0] des1, des2, des_acc, sub_result;



    covergroup cg;
    c_src1: coverpoint src1;
    c_src2: coverpoint src2;
    c_src3: coverpoint src3;
    c_srcCy: coverpoint srcCy;
    c_srcAc: coverpoint srcAc; 
    c_des1: coverpoint des1;
    c_des2: coverpoint des2;
    c_des_acc: coverpoint des_acc;
	c_desCy: coverpoint desCy;
    c_desAc: coverpoint desAc;
    c_desOv: coverpoint desOv;

    c_bit_in: coverpoint bit_in {
                                bins enabled = {1};
                                bins disabled = {0};
                            }

    endgroup

	function new (string name = "coverage", uvm_component parent=null);
		super.new(name,parent);
		cg=new();
	endfunction
    
	function void write (seq_item t);
        src1=t.src1;
        src2=t.src2;
        src3=t.src3;
        des1=t.des1;
        des2=t.des2;
        srcAc=t.srcAc;
        srcCy=t.srcCy;
		desAc=t.desAc;
        desCy=t.desCy;
       	des_acc=t.des_acc;
      	desOv=t.desOv;        
        cg.sample();
	endfunction
	

endclass