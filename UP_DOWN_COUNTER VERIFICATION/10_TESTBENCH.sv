

`include "interface.sv"
`include "test.sv"
module testbench;
  inter interf();
  test tst(interf);
  
  counter ca (.clk(interf.clk),.reset(interf.reset),.counter(interf.counter),.count(interf.count));
  
  initial begin
    interf.clk=0;
   forever #5 interf.clk=~interf.clk;
     end
  initial begin
     interf.reset=0;
    #15;interf.reset=1;
    
//     interf.counter=0;    
  end
   
  initial begin
    $dumpfile("dumpvars.vcd");
    $dumpvars();
      #1000;
    $finish;
  end
endmodule
