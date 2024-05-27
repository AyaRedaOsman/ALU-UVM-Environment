class seq_item extends uvm_sequence_item;
  	rand  bit [7:0] src1;
  	rand  bit [7:0] src2;
  	rand  bit [7:0] src3;
  	randc  bit	    srcCy;
  	randc  bit	    srcAc;
  	randc bit [3:0] op_code;
  		  bit	    bit_in;
		  bit       desCy;
  		  bit	    desAc;
    	  bit	    desOv;
  		  bit [7:0] des1;
  		  bit [7:0] des2;
  		  bit [7:0] des_acc;
  		  bit [7:0] sub_result;
  
  `uvm_object_utils_begin(seq_item)
  `uvm_field_int(src1,UVM_ALL_ON)
  `uvm_field_int(src2,UVM_ALL_ON)
  `uvm_field_int(src3,UVM_ALL_ON)
  `uvm_field_int(srcCy,UVM_ALL_ON)
  `uvm_field_int(srcAc,UVM_ALL_ON)
  `uvm_field_int(des1,UVM_ALL_ON)
  `uvm_field_int(des2,UVM_ALL_ON)
  `uvm_field_int(des_acc,UVM_ALL_ON)
  `uvm_field_int(desCy,UVM_ALL_ON)
  `uvm_field_int(desAc,UVM_ALL_ON)
  `uvm_field_int(desOv,UVM_ALL_ON)
  `uvm_field_int(bit_in,UVM_ALL_ON)
  `uvm_field_int(op_code,UVM_ALL_ON)
  `uvm_field_int(sub_result,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name= "seq_item");
    super.new(name);
  endfunction
  	
  //constraint cons{src2<src1;};
  
  
endclass