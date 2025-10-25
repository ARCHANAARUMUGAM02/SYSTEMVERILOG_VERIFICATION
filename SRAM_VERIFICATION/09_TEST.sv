`include "environment.sv"
program test(inter interf);
  environment env;
  initial begin
    env=new(interf);
    env.run();
  end
endprogram
