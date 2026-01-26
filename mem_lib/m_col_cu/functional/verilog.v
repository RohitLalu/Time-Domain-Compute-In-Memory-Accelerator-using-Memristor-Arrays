//Verilog HDL for "mem_lib", "m_col_cu" "functional"

//`include "disciplines.vams"

module m_col_cu (
    output rst_ctrl,
    output write1_ctrl,
    output write2_ctrl,
    output read1_ctrl,
    output read2_ctrl,
    output gnd_ctrl,
    output pre_charge_ctrl
);

    // Logic signals to hold states
    reg rst, w1, w2, r1, r2, gnd, pre_n;

    // Assign logic to electrical outputs for Cadence AMS
    // These will be converted to voltages (e.g., 0V to 1.8V) by Connect Modules
    assign rst_ctrl        = rst;
    assign write1_ctrl     = w1;
    assign write2_ctrl     = w2;
    assign read1_ctrl      = r1;
    assign read2_ctrl      = r2;
    assign gnd_ctrl        = gnd;
    assign pre_charge_ctrl = pre_n;

    initial begin
        // --- Default States ---
        rst   = 0;
        w1    = 0; w2 = 0;
        r1    = 0; r2 = 0;
        gnd   = 1;          // Starts High (0 to 370ns)
        pre_n = 1;          // Active Low, default High

        // --- Sequence Logic ---
        
        // RST: High for 250ns
        rst = 1;
        #250 rst = 0;

        // WRITE: 260ns to 360ns
        #10;                // 250 + 10 = 260ns
        w1 = 1; w2 = 1;
        #100;               // 260 + 100 = 360ns
        w1 = 0; w2 = 0;

        // GND: High from 0 to 370ns
        #10;                // 360 + 10 = 370ns
        gnd = 0;

        // PRE-CHARGE & READ Phase 1
        // pre_charge_ctrl (active low) goes low at 370ns
        pre_n = 0; 
        #10;                // Pulse low for 10ns (370 to 380ns)
        pre_n = 1;          
        
        // READ1/2: 380ns to 530ns
        r1 = 1; r2 = 1;
        #150;               // 380 + 150 = 530ns
        r1 = 0; r2 = 0;

        // PRE-CHARGE & READ Phase 2
        #140;               // 530 + 140 = 670ns
        pre_n = 0;
        #10;                // Pulse low for 10ns (670 to 680ns)
        pre_n = 1;

        // READ1/2: 680ns to 830ns
        r1 = 1; r2 = 1;
        #150;               // 680 + 150 = 830ns
        r1 = 0; r2 = 0;

        #100;
        $display("Control Sequence Finished");
        $finish;
    end

endmodule
