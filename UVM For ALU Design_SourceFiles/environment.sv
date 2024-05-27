
`include "agent.sv"
`include "scoreboard.sv"
`include "coverage.sv"

class environment extends uvm_env;
  `uvm_component_utils(environment)
   agent agnt;
  scoreboard scb;
  coverage cov;
  
  
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction:new
 
  //////////////////BUILD PHASE////////////////////
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    agnt=agent::type_id::create("agnt",this);
    scb=scoreboard::type_id::create("scb",this);
    cov=coverage::type_id::create("cov",this);
  endfunction: build_phase
  
  //////////////CONNECT PHASE///////////////////////
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agnt.alu_mon.item_collected_port.connect(scb.sb_fifo.analysis_export);
	agnt.alu_mon.item_collected_port.connect(cov.analysis_export);

  
  endfunction: connect_phase
    
 endclass:environment
    
    