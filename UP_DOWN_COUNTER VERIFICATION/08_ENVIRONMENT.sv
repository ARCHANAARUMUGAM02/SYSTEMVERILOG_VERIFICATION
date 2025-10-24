
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
 
    transaction trans;
    generator gen;
    driver drv;
    monitor mon;
    scoreboard score;
      
  mailbox gen_to_drv;
  mailbox moni_to_score;
  virtual inter interf;
   event triggerinng;
  
  function new(virtual inter interf);
    this.interf=interf;
    gen_to_drv=new();
    moni_to_score=new();
    
    gen=new(gen_to_drv);
    drv=new(interf,gen_to_drv);
    mon=new(interf,moni_to_score);
    score=new(moni_to_score);
    
    gen.trigger=triggerinng;
    score.triggering=triggerinng;
  endfunction
  task run();
    fork 
      gen.run();
      drv.run();
      mon.run();
      score.run();
    join
  endtask
endclass
    
