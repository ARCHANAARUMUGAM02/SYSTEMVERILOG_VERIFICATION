`include "interface.sv"
`include "test.sv"

module testbench;
  inter interf();
  test tst(interf);
  
  full_adder FA(.a(interf.a),
                 .b(interf.b),
                 .c(interf.c),
                 .sum(interf.sum),
                 .carry(interf.carry));
  
endmodule
