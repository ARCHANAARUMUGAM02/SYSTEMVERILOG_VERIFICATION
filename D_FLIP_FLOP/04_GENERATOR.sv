class generator;
  transaction trans;
  mailbox gen_to_drv;
  event trigger;
  function new(mailbox gen_to_drv);
    this.trans=trans;
    this.gen_to_drv=gen_to_drv;
  endfunction
  task run();
    trans=new();
    repeat(50)begin
      void'(trans.randomize());
      trans.display("GENERATOR");
      gen_to_drv.put(trans);
      @trigger;
    end
  endtask
endclass
