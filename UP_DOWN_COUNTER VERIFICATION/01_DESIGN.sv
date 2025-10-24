module counter(input clk,reset,counter,
               output reg [6:0]count);
  
  always @ (posedge clk)begin
    if (!reset)
      count<=0;
    else if(counter)
      count<=count+1;
    else
      count<=count-1;
  end
endmodule
  
  
