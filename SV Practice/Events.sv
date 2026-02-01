module tb_top;
  event eventA;
  
  task run(event eventA);
    $display("Waiting for triggering the event at %0t", $time);
    @eventA;
    $display("EventA triggered! at %0t", $time);
  endtask
  
    initial begin
    fork
      run(eventA);
      #5 ->eventA;
    join
  end
  
endmodule