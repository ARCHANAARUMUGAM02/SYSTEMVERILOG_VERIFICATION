class scoreboard;
  transaction trans;
  mailbox moni_to_score;
  event triggering;
   function new(mailbox moni_to_score);
    this.moni_to_score=moni_to_score;
  endfunction 
  task run();
     trans=new();
    repeat(50)begin
    moni_to_score.get(trans);
    trans.display("SCOREBOARD");
      if ((trans.rst==1)&&(trans.q==0)||(trans.rst==0)&&(trans.q==trans.d))
      $display("PASS");
    else
      $display("FAIL");
    ->triggering;
    end
  endtask
endclass
