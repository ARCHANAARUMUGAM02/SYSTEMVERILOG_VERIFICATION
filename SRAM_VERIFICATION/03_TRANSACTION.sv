class transaction;
  rand bit we;
  rand bit [3:0] addr;
  rand  bit [7:0] din;
  bit[7:0]dout;
  constraint enequal{ we dist{1:=10,0:=10};}
  function void display(string d);
    $display("%s",d);
$display("time=%0t,we=%0b,addr=%0d,din=%0d,dout=%0d",$time,we,addr,din,dout);
endfunction
endclass
