class generator;
  transaction trans;
  mailbox gen_to_driv;
  
  function new (mailbox gen_to_driv);
      this.gen_to_driv = gen_to_driv;
  endfunction

task gen();
  trans= new();
  
  repeat(5)begin
    
    trans.randomize();
     gen_to_driv.put(trans);
      trans.display("GENERATOR");

    #3;
  end
  
endtask
endclass
