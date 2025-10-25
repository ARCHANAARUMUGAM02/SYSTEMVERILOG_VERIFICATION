class driver;
  transaction trans;
  mailbox gen_drv;
  virtual inter interf;
  function new(virtual inter interf,mailbox gen_drv);
    this.interf=interf;
    this.gen_drv=gen_drv;
  endfunction
  task run();
    trans=new();
    repeat(10)begin
      gen_drv.get(trans);
      trans.display("DRIVER");
      interf.din<=trans.din;
      interf.we<=trans.we;
      interf.addr<=trans.addr;
    end
  endtask 
endclass
    
