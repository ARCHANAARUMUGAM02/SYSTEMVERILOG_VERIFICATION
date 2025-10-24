
class transaction;
       bit reset;
      rand bit counter;
       bit  [6:0]count;
  
  function void display (string d);
    $display("%0s",d);
    $display("Time=%0t reset=%0b  counter=%0b count=%0d ",$time,reset,counter,count);
  endfunction
endclass
