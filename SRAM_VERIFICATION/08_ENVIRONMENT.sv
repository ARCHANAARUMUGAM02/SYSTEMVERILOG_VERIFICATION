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
  
  virtual inter interf;
  mailbox gen_drv;
  mailbox mon_score;
  event triggerinng;
   
  function new(virtual inter interf);
    this.interf=interf;
    gen_drv=new();
    mon_score=new();
    
    gen=new(gen_drv);
    drv=new(interf,gen_drv);
    mon=new(interf,mon_score);
    score=new(mon_score);
     gen.trigger=this.triggerinng;
     score.trriger=this.triggerinng;
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
    
    
