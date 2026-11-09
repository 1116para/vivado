`timescale 1ns / 1ps

module seg7_controller (
    input            clk,
    input            rst,
    input      [7:0] data_in,      // DAC 디지털 입력 데이터
    output reg [7:0] seg_data,     // AR_SEG_A ~ DP (Active-Low)
    output reg [7:0] seg_sel       // AR_SEG_S0 ~ S7 (Active-Low)
);
    // 약 1kHz 주사(Scan)를 위한 카운터 분주
    reg [16:0] scan_cnt;
    wire [3:0] hex_val;
    reg  [7:0] seg_dec;

    always @(posedge clk or negedge rst) begin
        if (!rst) scan_cnt <= 17'd0;
        else      scan_cnt <= scan_cnt + 17'd1;
    end

    // scan_cnt[16]을 기준으로 오른쪽 2자리(S7, S6)에 각각 LSB 4비트, MSB 4비트 표기
    assign hex_val = (scan_cnt[16]) ? data_in[7:4] : data_in[3:0];

    // 16진수 BCD 디코더 (Cathode/Anode 보드 극성에 맞춘 기본 테이블)
    always @(*) begin
        case (hex_val)
            4'h0: seg_dec = 8'b1111_1100; // 0
            4'h1: seg_dec = 8'b0110_0000; // 1
            4'h2: seg_dec = 8'b1101_1010; // 2
            4'h3: seg_dec = 8'b1111_0010; // 3
            4'h4: seg_dec = 8'b0110_0110; // 4
            4'h5: seg_dec = 8'b1011_0110; // 5
            4'h6: seg_dec = 8'b1011_1110; // 6
            4'h7: seg_dec = 8'b1110_0000; // 7
            4'h8: seg_dec = 8'b1111_1110; // 8
            4'h9: seg_dec = 8'b1111_0110; // 9
            4'hA: seg_dec = 8'b1110_1110; // A
            4'hB: seg_dec = 8'b0011_1110; // b
            4'hC: seg_dec = 8'b1001_1100; // C
            4'hD: seg_dec = 8'b0111_1010; // d
            4'hE: seg_dec = 8'b1001_1110; // E
            4'hF: seg_dec = 8'b1000_1110; // F
            default: seg_dec = 8'b0000_0000;
        endcase
    end

    always @(posedge clk) begin
        seg_data <= seg_dec;
        // AR_SEG_S7(맨 오른쪽), AR_SEG_S6에 순차 점등 (Active-Low)
        seg_sel  <= (scan_cnt[16]) ? 8'b1011_1111 : 8'b0111_1111;
    end
endmodule