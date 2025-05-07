`timescale 1ns/1ps

module tb_sequence_detector;
    reg clk, reset, data_in;
    wire detected;
    
    sequence_detector dut (
          .clk(clk),
          .reset(reset),
          .data_in(data_in),
          .detected(detected));

    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        reset = 1;
        data_in = 0;
        
        #20 reset = 0;
        
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 1;
        #10 data_in = 0;
        
        
        #50 $finish;
    end
endmodule
