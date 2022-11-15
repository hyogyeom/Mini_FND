`timescale 1ns / 1ps

module MUX_4x1(
    input[3:0] i_min_1, i_min_10, i_hour_1, i_hour_10,
    input[1:0] i_sel,
    output[3:0] o_y
    );

    reg[3:0] r_y;
    assign o_y = r_y;

    always @(*) begin
        case(i_sel)
            2'b00 : r_y <= i_min_1;
            2'b01 : r_y <= i_min_10;
            2'b10 : r_y <= i_hour_1;
            2'b11 : r_y <= i_hour_10;
            
           
        endcase
    end
endmodule
