class scoreboard;
  transaction trans;
  mailbox moni_to_score;
  event triggering;
  bit [6:0] prev_counter;
  function new(mailbox moni_to_score);
    
    this.moni_to_score=moni_to_score;
  endfunction
  
  task run();
    trans=new();
    repeat(50)begin
      moni_to_score.get(trans);
      trans.display("SCOREBOARD");
      
      if((trans.reset==0)&&(trans.count==0))begin
        $display("COUNTER IS RESETED"); end
      else if (trans.counter==1)begin
        if (trans.count<=prev_counter+1)
           $display("UPCOUNTER IS PASSED ");
          else 
            $display("UPCOUNTER IS FAILED");
        end
           
        else if(trans.counter==0)begin
          if (trans.count<=prev_counter-1)
            $display("DOWNCOUNTER IS PASSED ");
          else 
            $display("DOWNCOUNTER IS FAILED ");
        end
       prev_counter=trans.count;
       ->triggering;
      
    end
  endtask
endclass
