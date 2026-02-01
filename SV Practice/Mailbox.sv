class transaction;  
  rand bit [7:0] data;
  
  function display();
    $display("[%0t] Data = %0d", $time, data);
  endfunction
  
endclass

class generator;
  mailbox mbx;
  
  function new (mailbox mbx);
    this.mbx = mbx;
  endfunction
  
  task genData();
    transaction tr = new();
    tr.randomize();
    tr.display();
    $display("[%0t] [Generator] Going to pack the data for sending", $time);
    mbx.put(tr);
    $display("[%0t] [Generator] Data packed into mailbox", $time);
  endtask
endclass

class driver;
  mailbox mbx;
  
  function new (mailbox mbx);
    this.mbx = mbx;
  endfunction
  
  task drvData();
    transaction dtr = new();
    $display("[%0t] [Driver] Waiting to Retrieve the data", $time);
    mbx.get(dtr);
    $display("[%0t] [Driver] Data Retrieved!", $time);
    dtr.display();
  endtask
endclass

module tb;
  mailbox mbx;
  generator gen;
  driver drv;
  
  initial begin
    mailbox mbx = new();
    generator gen = new(mbx);
    driver drv = new(mbx);
    
    fork
      #10 gen.genData();
      drv.drvData();
    join_none
  end
endmodule
    