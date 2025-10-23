`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "Scoreboard.sv"

class environment;
  transaction trans;
  generator gen;
  driver driv;
  monitor moni;
  scoreboard score;
  
  mailbox gen_to_driv;
  mailbox moni_to_score;
  virtual inter interf;
  
  function new(virtual inter interf);
    
    this.interf=interf;
    gen_to_driv=new();
    moni_to_score=new();
    
    gen=new(gen_to_driv);
    driv=new(interf,gen_to_driv);
    moni=new(interf,moni_to_score);
    score=new(moni_to_score);
    
  endfunction
  task test();
    fork
    gen.gen();
    driv.driv();
    moni.monitor();
    score.score();
    join
  endtask
  
endclass
