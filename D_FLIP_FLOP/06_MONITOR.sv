class monitor;
  transaction trans;
  mailbox moni_to_score;
  virtual inter interf; 
  function new (virtual inter interf,mailbox moni_to_score);
    this.interf =interf;
    this.moni_to_score=moni_to_score;   
  endfunction
   task run();
    trans=new();
    repeat(50) begin
    @(posedge interf.clk);
      trans.rst=interf.rst;
      trans.d=interf.d;
      trans.q=interf.q;
      moni_to_score.put(trans);
      trans.display("MONITOR");
      
    end
  endtask
  
endclass
