`timescale 1ns / 1ps

module DAC_Top_Integrated (
    input        clk,
    input        rst,
    input  [5:0] btn,       // {SM_1, SM_3, SM_4, SM_6, SM_7, SM_9}
    input        add_sel,   // SW1 (0: DAC A, 1: DAC B)
    // DAC IC (AD7302) 핀
    output       dac_csn,
    output       dac_ldacn,
    output       dac_wrn,
    output       dac_a_b,
    output [7:0] dac_d,
    output [7:0] led_out,
    // 7-Segment Array 핀
    output [7:0] seg_data,  // AR_SEG_A ~ DP
    output [7:0] seg_sel,   // AR_SEG_S0 ~ S7
    // Text LCD 핀
    output       lcd_rs,
    output       lcd_rw,
    output       lcd_e,
    output [7:0] lcd_data
);
    wire [7:0] w_dac_d;

    // 1. DAC 제어 코어
    DAC u_dac_core (
        .clk       (clk),
        .rst       (rst),
        .btn       (btn),
        .add_sel   (add_sel),
        .dac_csn   (dac_csn),
        .dac_ldacn (dac_ldacn),
        .dac_wrn   (dac_wrn),
        .dac_a_b   (dac_a_b),
        .dac_d     (w_dac_d),
        .led_out   (led_out)
    );
    assign dac_d = w_dac_d;

    // 2. 7-Segment 컨트롤러
    seg7_controller u_seg7 (
        .clk      (clk),
        .rst      (rst),
        .data_in  (w_dac_d),
        .seg_data (seg_data),
        .seg_sel  (seg_sel)
    );

    // 3. Text LCD 컨트롤러
    text_lcd_controller u_lcd (
        .clk      (clk),
        .rst      (rst),
        .dac_val  (w_dac_d),
        .lcd_rs   (lcd_rs),
        .lcd_rw   (lcd_rw),
        .lcd_e    (lcd_e),
        .lcd_data (lcd_data)
    );
endmodule