class monitor;
  transaction trans;
  mailbox mon_score;
  virtual inter interf;
  function new(virtual inter interf,mailbox mon_score);
    this.interf=interf;
    this.mon_score=mon_score;
  endfunction
  task run();
    trans=new();
    repeat(10)begin
        @(posedge interf.clk);      
      trans.din=interf.din;
      trans.we=interf.we;
      trans.addr=interf.addr;
      trans.we=interf.we;
      trans.dout=interf.dout;
      mon_score.put(trans);
      trans.display("MONITOR");
    end
  endtask
endclass
