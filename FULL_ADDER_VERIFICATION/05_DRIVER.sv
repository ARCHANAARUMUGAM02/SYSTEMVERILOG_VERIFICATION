class driver;
  virtual inter interf;
  transaction trans;
  mailbox gen_to_driv;
  
  function new(virtual inter interf,mailbox gen_to_driv);
    this.interf =  interf;
    this.gen_to_driv = gen_to_driv;
    endfunction
  
  task driv();
    trans=new();
    
    repeat(5)begin
      #1;
      gen_to_driv.get(trans);
      interf.a = trans.a;
      interf.b = trans.b;
      interf.c = trans.c;
      trans.display("DRIVER");
      #2;
      
    end
  endtask
  
  
endclass
