class generator;
  transaction trans;
  mailbox gen_drv;
  event trigger;
  function new(mailbox gen_drv);
    this.trans=trans;
    this.gen_drv=gen_drv;
  endfunction
  task run();
    trans=new();
    repeat(10)begin
    trans.randomize();
    trans.display("GENERATOR");
    gen_drv.put(trans);
    @trigger;
    end
  endtask
endclass
