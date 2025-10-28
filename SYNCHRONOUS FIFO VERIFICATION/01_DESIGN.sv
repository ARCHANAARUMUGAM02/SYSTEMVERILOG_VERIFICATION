module sync_fifo#(DEPTH=8,DATA_WIDTH=8)
  (input clk,rst,input wr_en,rd_en,input[DATA_WIDTH-1:0]din,
output reg [DATA_WIDTH-1:0]dout,output full,empty);
reg[$clog2(DEPTH)-1:0]wr_ptr,rd_ptr;
reg [DATA_WIDTH-1:0] fifo [0:DEPTH-1];
always @(posedge clk) begin
  if (rst) begin
    rd_ptr <= 0;
    wr_ptr <= 0;
    dout <= 0;
  end
end
always @(posedge clk) begin
    if (!rst) begin
      if (wr_en && !full) begin
        fifo[wr_ptr] <= din;
        wr_ptr <= wr_ptr + 1;
      end
    end
  end
always @(posedge clk) begin
    if (!rst) begin
      if (rd_en && !empty) begin
        dout <= fifo[rd_ptr];
        rd_ptr <= rd_ptr + 1;
      end
    end
  end
assign full = ((wr_ptr+1'b1) == rd_ptr);
assign empty = (wr_ptr == rd_ptr);
endmodule
