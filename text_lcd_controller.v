`timescale 1ns / 1ps

module text_lcd_controller (
    input            clk,
    input            rst,
    input      [7:0] dac_val,      // DAC 디지털 입력 데이터
    output reg       lcd_rs,
    output reg       lcd_rw,
    output reg       lcd_e,
    output reg [7:0] lcd_data
);
    // 100MHz 클럭 기준 1ms 지연 카운터
    reg [19:0] clk_cnt;
    reg [5:0]  step;

    // 4비트 Hex 값을 ASCII 문자로 변환
    function [7:0] to_ascii;
        input [3:0] nibble;
        begin
            to_ascii = (nibble < 4'hA) ? (8'h30 + nibble) : (8'h41 + (nibble - 4'hA));
        end
    endfunction

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            clk_cnt  <= 20'd0;
            step     <= 6'd0;
            lcd_rs   <= 1'b0;
            lcd_rw   <= 1'b0;
            lcd_e    <= 1'b0;
            lcd_data <= 8'h00;
        end else begin
            if (clk_cnt >= 20'd100_000) begin // 1ms마다 상태 전진
                clk_cnt <= 20'd0;
                step    <= step + 6'd1;

                case (step)
                    // LCD 초기화
                    6'd0:  begin lcd_rs <= 0; lcd_rw <= 0; lcd_data <= 8'h38; lcd_e <= 1; end // 8bit 2line
                    6'd1:  begin lcd_e  <= 0; end
                    6'd2:  begin lcd_rs <= 0; lcd_rw <= 0; lcd_data <= 8'h0C; lcd_e <= 1; end // Display ON
                    6'd3:  begin lcd_e  <= 0; end
                    6'd4:  begin lcd_rs <= 0; lcd_rw <= 0; lcd_data <= 8'h06; lcd_e <= 1; end // Entry Mode
                    6'd5:  begin lcd_e  <= 0; end
                    6'd6:  begin lcd_rs <= 0; lcd_rw <= 0; lcd_data <= 8'h01; lcd_e <= 1; end // Screen Clear
                    6'd7:  begin lcd_e  <= 0; end

                    // Line 2 시작 주소(0xC0) 이동
                    6'd8:  begin lcd_rs <= 0; lcd_rw <= 0; lcd_data <= 8'hC0; lcd_e <= 1; end
                    6'd9:  begin lcd_e  <= 0; end

                    // '0' 출력
                    6'd10: begin lcd_rs <= 1; lcd_rw <= 0; lcd_data <= "0"; lcd_e <= 1; end
                    6'd11: begin lcd_e  <= 0; end

                    // 'x' 출력
                    6'd12: begin lcd_rs <= 1; lcd_rw <= 0; lcd_data <= "x"; lcd_e <= 1; end
                    6'd13: begin lcd_e  <= 0; end

                    // MSB 4비트 출력
                    6'd14: begin lcd_rs <= 1; lcd_rw <= 0; lcd_data <= to_ascii(dac_val[7:4]); lcd_e <= 1; end
                    6'd15: begin lcd_e  <= 0; end

                    // LSB 4비트 출력
                    6'd16: begin lcd_rs <= 1; lcd_rw <= 0; lcd_data <= to_ascii(dac_val[3:0]); lcd_e <= 1; end
                    6'd17: begin lcd_e  <= 0; end

                    // 값 갱신을 위해 Line 2 시작 위치로 루프
                    6'd18: begin step <= 6'd8; end

                    default: begin lcd_e <= 0; end
                endcase
            end else begin
                clk_cnt <= clk_cnt + 20'd1;
            end
        end
    end
endmodule