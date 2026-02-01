module tb_top;
  semaphore key;
  
  initial begin
    key = new(1);
    fork
      personA();
      personB();
      #25 personA();
    join_none
  end
  
  task getKey(bit id);
    $display("[%0t] Trying to get the key for ID [%0d]", $time, id);
    key.get(1);
    $display("[%0t] Got the key for ID [%0d]", $time, id);
  endtask
  
  task putKey(bit id);
    $display("[%0t] Leaving the room by ID [%0d]", $time, id);
    key.put(1);
    $display("[%0t] Put the key back by ID [%0d]", $time, id);
  endtask
  
  task personA();
    getKey(0);
    #20 putKey(0);
  endtask
  
  task personB();
    #5 getKey(1);
    #25 putKey(1);
  endtask
  
endmodule