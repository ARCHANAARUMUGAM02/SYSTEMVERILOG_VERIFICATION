class driver;
  mailbox gen_to_drv;
  transaction trans;
  virtual inter interf;
  function new(virtual inter interf ,mailbox gen_to_drv);
    this.interf=interf;
    this.gen_to_drv=gen_to_drv;
  endfunction
  task run();
    trans=new();
    repeat(50)begin
      gen_to_drv.get(trans);
      @(posedge interf.clk);
      interf.d<=trans.d;
      trans.display("DRIVER");
      $display("rst=%0b",interf.rst);
    end
  endtask
endclass
