
class monitor;
  transaction trans;
  mailbox moni_to_score;
  virtual inter interf;
  
  function new(virtual inter interf,mailbox moni_to_score);
    this.interf=interf;
    this.moni_to_score = moni_to_score;
  endfunction
  
  task run();
    trans=new();
    repeat(100)begin
     
       #1;
      @(posedge interf.clk)
      trans.reset=interf.reset;
      trans.counter=interf.counter;
      trans.count=interf.count;
      
      moni_to_score.put(trans);
      trans.display("MONITOR");
    end
  endtask
endclass
