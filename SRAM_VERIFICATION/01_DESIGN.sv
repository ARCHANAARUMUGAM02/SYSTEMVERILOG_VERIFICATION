module sram(
  input  logic        clk,
  input  logic        we,
  input  logic [3:0]  addr,
  input  logic [7:0]  din,
  output logic [7:0]  dout
);
  logic [3:0] mem [15:0];
always @(posedge clk) begin
  if (we)
    mem[addr] <= din;      
  else
    dout <= mem[addr];      
end
endmodule
