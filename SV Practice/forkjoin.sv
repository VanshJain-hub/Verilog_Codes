module tb;
  initial begin
    $display("[%0t] Main Thread to be continued.", $time);
    fork
      //Thread 1
      #20 $display("[%0t] Thread 1.", $time);
      
      //Thread 2
      begin
        #5 $display("[%0t] Thread 2...", $time);
        #10 $display("[%0t] Thread 2 finished.", $time);
      end
      
      //Thread 3
      #10 $display("[%0t] Thread 3.", $time);
    join
    $display ("[%0t] Main Thread: Fork join has finished", $time);
  end
endmodule