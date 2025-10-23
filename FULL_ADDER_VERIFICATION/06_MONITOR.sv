class monitor;
  transaction trans;
  virtual inter interf;
  mailbox moni_to_score;
  
  function new(virtual inter interf,mailbox moni_to_score);
    this.interf = interf;
    this.moni_to_score = moni_to_score;
  endfunction
  
  task monitor();
    trans=new();
    repeat(5)begin
#2;
      trans.a=interf.a;
      trans.b=interf.b;
      trans.c=interf.c;
      trans.sum=interf.sum;
      trans.carry=interf.carry;
      
      moni_to_score.put(trans);
      trans.display("MONITOR");
      #1;

    end
  endtask
endclass
