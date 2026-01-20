module pwm #(
    parameter WIDTH = 10
)(
    input clk_1Mhz,
    input reset_n,
    input [WIDTH-1:0] word,
    output reg pwm
);
    reg [6:0] counter;
    
    reg [6:0] active_duty;

    always @(posedge clk_1Mhz or negedge reset_n) begin
        if(!reset_n) begin
            counter     <= 7'd0;
            active_duty <= 7'd0;
            pwm         <= 1'b0;
        end
        else begin
            counter <= counter + 1;

            if(counter == 7'd0) begin
                active_duty <= word[9:3]; 
            end

            if(counter < active_duty) begin
                pwm <= 1'b1;
            end
            else begin
                pwm <= 1'b0;
            end
        end
    end

endmodule