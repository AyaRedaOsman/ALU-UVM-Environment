`define DRIV_IF vif.DRIVER.driver_cb

class driver extends uvm_driver#(seq_item);
  `uvm_component_utils(driver)
  
  virtual alu_inf vif;
 
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  //////////////   BUILD PHASE   //////////////////////////////
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual alu_inf)::get(this,"", "vif",vif))
      `uvm_fatal("No vif found", {"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase
  
  //////////////   RUN PHASE   //////////////////////////////
  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive();
      seq_item_port.item_done();
    end
  endtask: run_phase
 
  //////////////   DRIVE() TASK   //////////////////////////////
  
  virtual task drive();
    @(negedge vif.clk);
    vif.src1<=req.src1;
    vif.src2<=req.src2;
    vif.src3<=req.src3;
    vif.srcAc<=req.srcAc;
    vif.srcCy<=req.srcCy;
    vif.bit_in<=req.bit_in;
    vif.op_code<=req.op_code;
    
    @(negedge vif.DRIVER.clk);
    req.des1<=vif.des1;
    req.des2<=vif.des2;
    req.des_acc<=vif.des_acc;
    req.sub_result<=vif.sub_result;
    req.desCy<=vif.desCy;
    req.desAc<=vif.desAc;
    req.desOv<=vif.desOv;
  endtask: drive
  
endclass: driver
    