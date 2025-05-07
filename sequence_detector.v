module sequence_detector(
    input clk,
    input reset,
    input data_in,
    output reg detected
);

localparam 
    S0 = 3'd0,
    S1 = 3'd1,
    S2 = 3'd2,
    S3 = 3'd3,
    S4 = 3'd4,
    S5 = 3'd5;

reg [2:0] current_state, next_state;

always @(posedge clk or posedge reset) begin
    if(reset) current_state <= S0;
    else current_state <= next_state;
end

always @(*) begin
    case(current_state)
        S0: next_state = data_in ? S1 : S0;
        S1: next_state = data_in ? S1 : S2;
        S2: next_state = data_in ? S3 : S0;
        S3: next_state = data_in ? S1 : S4;
        S4: next_state = data_in ? S5 : S0;
        S5: next_state = data_in ? S1 : S2;
        default: next_state = S0;
    endcase
end

always @(*) begin
    detected = (current_state == S5);
end

endmodule
