//Verilog HDL for "mem_lib", "control_unit" "functional"


module control_unit (
    input  wire clk,
    input  wire rst_n,
    // Opcode: [3:2] = Main Op (00=Idle, 01=Write, 10=Read, 11=Idle)
    //         [1:0] = Sub Op (User defined, e.g., Read type)
    input  wire [3:0] opcode,
    input  wire [9:0] pixel_data, // PWM input value

    // Control Signals
    output reg weight_ctrl,
    output reg compute_sig,
    output reg input_ctrl,
    output reg pre_charge_ctrl, // Active Low
    output wire wl_ctrl,        // Gated PWM
    output wire level_shifted_input,
    
    // Debug output
    output reg [2:0] state_debug
);

    //  State Encoding
    localparam S_IDLE  = 3'd0;
    localparam S_WRITE = 3'd1;
    localparam S_READ  = 3'd2; // The computing/reading phase
    localparam S_RESET = 3'd3; // The discharge phase

    reg [2:0] current_state, next_state;

    // Timers & Counters 
    reg [9:0] main_timer;      // Counts ticks (up to 720)
    reg [3:0] read_iter_count; // Counts 10 cycles for Read Mode

    // Parameters 
    localparam T_WRITE_MAX = 720;
    localparam T_FAST_CYC  = 54;
    localparam T_RESET_CYC = 54;
    localparam READ_LOOPS  = 10; // Refresh every 10 cycles

    // PWM Generation (Internal Instance) 
    wire pwm_raw;
    pwm #(.WIDTH(10)) u_pwm (
        .clk_1Mhz(clk), .reset_n(rst_n), .word(pixel_data), .pwm(pwm_raw)
    );
    assign level_shifted_input = pwm_raw;

    // 1. State Transition Logic (Sequential)

    always @(posedge clk or negedge rst_n) 
    begin
        if (!rst_n) 
        begin
            current_state   <= S_IDLE;
            main_timer      <= 0;
            read_iter_count <= 0;
        end 
        else 
        begin
            // Default Timer increment
            main_timer <= main_timer + 1;

            if (current_state != next_state) 
            begin
                // State Change Detected: Reset timers
                current_state   <= next_state;
                main_timer      <= 0;
                read_iter_count <= 0;
            end 
            // Logic for Looping inside READ state
            else if (current_state == S_READ) 
            begin
                if (main_timer >= T_FAST_CYC - 1) 
                begin
                    main_timer <= 0;
                    read_iter_count <= read_iter_count + 1;
                end
            end
        end
    end

    // 2. Next State Logic (Combinational)

    always @(*) 
    begin
        // Default: stay in current state
        next_state = current_state;

        // defaults
        weight_ctrl     = 0;
        compute_sig     = 0;
        input_ctrl      = 0;
        pre_charge_ctrl = 1; // Active Low default High
        state_debug     = current_state;

        case (current_state)
            S_IDLE: 
                    begin
                        // Check Main Opcode [3:2]
                        case (opcode[3:2])
                            2'b01: next_state = S_WRITE;
                            2'b10: next_state = S_READ;
                            default: next_state = S_IDLE;
                        endcase
                    end

            S_WRITE: 
                    begin
                        // Stay for 720 ticks, then go to IDLE (or auto-read if needed)
                        if (main_timer >= T_WRITE_MAX - 1)
                            next_state = S_IDLE;

                        // Pulse Weight High for 30 ticks
                        if (main_timer < 30) weight_ctrl = 1;  // output    
                    end

            S_READ: 
                    begin
                        // Perform 10 loops of the 54-tick cycle
                        if (read_iter_count >= READ_LOOPS)
                            next_state = S_RESET; // Go to Reset state after 10 reads

                        // 1. Compute stays HIGH for the whole operation
                        compute_sig = 1;

                        // 2. Input pulses High (0-30) every 54-tick loop
                        if (main_timer < 30) input_ctrl = 1;

                        // 3. Precharge dips Low (42-54) every 54-tick loop
                        if (main_timer >= 42 && main_timer < 54) pre_charge_ctrl = 0;
                    end

            S_RESET: 
                    begin
                        // Perform one 54-tick cleanup cycle
                        if (main_timer >= T_RESET_CYC - 1)
                            next_state = S_IDLE;

                        // Just Precharge (discharge lines)
                        if (main_timer >= 42 && main_timer < 54) pre_charge_ctrl = 0;
                    end
            
            default: next_state = S_IDLE;
        endcase
    end


    // Gated WL_Ctrl Logic
    assign wl_ctrl = compute_sig & pwm_raw;

endmodule

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
