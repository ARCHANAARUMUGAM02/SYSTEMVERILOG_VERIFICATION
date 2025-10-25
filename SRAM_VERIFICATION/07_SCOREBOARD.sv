class scoreboard;
  transaction trans;
  mailbox mon_score;
  bit [7:0]ref_mem[15:0];
  event trriger;
  function new(mailbox mon_score);
    this.mon_score=mon_score;
  endfunction
  task run();
    transaction trans;
    forever begin
      mon_score.get(trans);
      if (trans.we) begin
        ref_mem[trans.addr] = trans.din;
        $display("[SCOREBOARD] WRITE PASS addr=%0h data=%0h", trans.addr, trans.din);
      end else begin
        if (trans.dout !== ref_mem[trans.addr])
          $error("[SCOREBOARD] READ FAIL addr=%0h: expected=%0h, got=%0h", trans.addr, ref_mem[trans.addr], trans.dout);
        else
          $display("[SCOREBOARD] READ PASS addr=%0h data=%0h", trans.addr, trans.dout);
      end
       ->trriger;
    end
  endtask
endclass
    
