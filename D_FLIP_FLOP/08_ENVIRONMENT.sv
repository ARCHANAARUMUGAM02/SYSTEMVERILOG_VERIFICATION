`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator gen;
  driver driv;
  monitor moni;
  scoreboard score;
  transaction trans;
  
  mailbox gen_to_drv;
  mailbox moni_to_score;
  
  virtual inter interf;
  event triger;
  
  function new (virtual inter interf);
    this.interf=interf;
   
    gen_to_drv=new();
    moni_to_score=new();
    gen=new(gen_to_drv);
    driv=new(interf,gen_to_drv);
    moni=new(interf,moni_to_score);
    score=new(moni_to_score);
    
    gen.trigger=this.triger;
    score.triggering=this.triger;
    
   endfunction
  
  task test();
    fork
      gen.run();
      driv.run();
      moni.run();
      score.run();
    join
  endtask 
endclass
