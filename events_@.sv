
module events_ex;
  event ev_1; //declaring event ev_1
  bit a,b,c;
  
  initial begin
    fork
      //process-1, triggers the event
      begin
       #10;
        $display($time,"\tTriggering The Event");
        ->ev_1;
      end
      
      //process-2, wait for the event to trigger
      begin
        $display("\twaiting for the event to get triggered");
       
        @(ev_1.triggered);
        
        a= 1'b0;
        b= 1'b1;             
        c=a+b;
        $display("\tresults= %d", c);
        $display($time,"\t event trigered");
      end
    
    join
  end
endmodule
