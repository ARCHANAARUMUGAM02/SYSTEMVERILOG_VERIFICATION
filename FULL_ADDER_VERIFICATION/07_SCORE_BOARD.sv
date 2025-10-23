class scoreboard;
  transaction trans;
  mailbox moni_to_score;
  
  function new(mailbox moni_to_score);
    this.moni_to_score = moni_to_score;
  endfunction
  
  task score();
    trans=new();
    
    repeat(5)begin
      
      moni_to_score.get(trans);
      trans.display("SCOREBOARD");
      if((trans.a^trans.b^trans.c==trans.sum)&&((trans.a&trans.b)|(trans.b&trans.c)|(trans.c&trans.a)==trans.carry))
        $display("PASS");
         else
           $display("FAIL");
       trans.display("SCOREBOARD");
end   
  endtask
endclass
