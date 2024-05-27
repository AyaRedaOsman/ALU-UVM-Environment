`define MON_IF vif.monitor_cb

class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  virtual alu_inf vif;
  uvm_analysis_port#(seq_item) item_collected_port;
  seq_item seq_collected;
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
    item_collected_port=new("item_collected_port",this);
    seq_collected=new();
  endfunction: new
  
    //////////////   BUILD PHASE   //////////////////////////////
    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual alu_inf)::get(this,"", "vif",vif))
      `uvm_fatal("No vif found", {"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase
    
  //////////////   RUN PHASE   //////////////////////////////
    virtual task run_phase(uvm_phase phase);
       seq_item item_collected;
      
      forever begin
        @(negedge vif.clk);
        seq_collected.src1=vif.src1;
    	seq_collected.src2=vif.src2;
    	seq_collected.src3=vif.src3;
    	seq_collected.srcAc=vif.srcAc;
    	seq_collected.srcCy=vif.srcCy;
    	seq_collected.bit_in=vif.bit_in;
    	seq_collected.op_code=vif.op_code;

        seq_collected.des1=vif.des1;
        seq_collected.des2=vif.des2;
        seq_collected.des_acc=vif.des_acc;
        seq_collected.sub_result=vif.sub_result;
        seq_collected.desCy=vif.desCy;
        seq_collected.desAc=vif.desAc;
        seq_collected.desOv=vif.desOv;
        
       
        $cast(item_collected, seq_collected.clone());
        item_collected_port.write(item_collected);
 
      end
  endtask: run_phase
  
endclass: monitor
        