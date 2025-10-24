class transaction;
  bit rst;
  rand bit d;
  bit q;
function void display(string flipflop);
    $display("%s",flipflop);
  $display("Time=%0t rst=%b d=%b q=%b",$time,rst,d,q);
  endfunction
endclass
