class transaction;
  rand bit [7:0] data;
  rand bit [3:0] addr;
  
  function display();
    $display("[%0t] Data = 0x%0h | Address = 0x%0h", $time, data, addr);
  endfunction
endclass

class generator;
  transaction gtr;
  mailbox #(transaction) mbx_ref;
  
  function new (mailbox #(transaction) mbx_in);
    this.mbx_ref = mbx_in;
  endfunction
  
  task genData();
    repeat(3) begin
      gtr = new();
      gtr.randomize();
      gtr.display();
      $display("[%0t] [Generator] Data Generated.", $time);
      mbx_ref.put(gtr);
      $display("[%0t] [Generator] Data packed!", $time);
    end
  endtask
endclass

class driver;
  transaction dtr;
  mailbox #(transaction) mbx_ref;
  
  function new (mailbox #(transaction) mbx_in);
    this.mbx_ref = mbx_in;
  endfunction
  
  task drvData();
    repeat(3) begin
      dtr = new();
      $display("[%0t] [Driver] Waiting for retrieving data", $time);
      mbx_ref.get(dtr);
      dtr.display();
      $display("[%0t] [Driver] Data Retrieved!", $time);
    end
  endtask
endclass

module tb;
  generator gen;
  driver drv;
  mailbox #(transaction) mbx;
  
  initial begin
    mbx = new();
    gen = new(mbx);
    drv = new(mbx);
    
    fork
      gen.genData();
      drv.drvData();
    join
  end
  
endmodule