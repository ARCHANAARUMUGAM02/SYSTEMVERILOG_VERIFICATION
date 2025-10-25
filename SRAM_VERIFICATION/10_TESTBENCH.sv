`include "interface.sv"
`include "test.sv"

module testbench_tb;
   inter interf();
  test tst(interf);
  sram ram(.clk(interf.clk),.din(interf.din),.addr(interf.addr),.we(interf.we),.dout(interf.dout));
  initial begin
    interf.clk=0;
   forever #5 interf.clk=~interf.clk;
  end
  initial begin
     #700;
  $finish;
  end 
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars();
  end
  
 
  
endmodule
