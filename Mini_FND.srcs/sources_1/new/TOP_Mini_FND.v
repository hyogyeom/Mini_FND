`timescale 1ns / 1ps

module TOP_Mini_FND(
    input i_clk,
    input i_reset,
    output[3:0] o_digit,
    output[7:0] o_font
    );

    wire w_FNDClockDivider_to_FNDCounter;
    FND_Clock_Divider FND_Clock_Divider(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .o_clk(w_FNDClockDivider_to_FNDCounter)
    );

    wire[1:0] w_FNDCounter_to_FNDDecoder;
    FND_Counter FND_Counter(
    .i_clk(w_FNDClockDivider_to_FNDCounter),
    .i_reset(i_reset),
    .o_counter(w_FNDCounter_to_FNDDecoder)
    );

    FND_Decoder FND_Decoder(
    .i_select(w_FNDCounter_to_FNDDecoder),
    .o_digit(o_digit)
    );

    wire[5:0] w_hour, w_min, w_sec;
    wire[6:0] w_msec;
    Time_Clock_Counter Time_Clock_Counter(
    .i_clk(w_FNDClockDivider_to_FNDCounter),
    .i_reset(i_reset),
    .o_hour(w_hour),
    .o_min(w_min),
    .o_sec(w_sec),
    .o_msec(w_msec)
    );

    wire[3:0] w_hour_10, w_hour_1, w_min_10, w_min_1;
    Digit_Divider_Timer Digit_Divider_Timer(
    .i_hour(w_hour),
    .i_min(w_min),

    .o_hour_10(w_hour_10),
    .o_hour_1(w_hour_1),
    .o_min_10(w_min_10),
    .o_min_1(w_min_1)
    );

    wire[3:0] w_y;
    MUX_4x1 MUX_4x1(
    .i_min_1(w_min_1),
    .i_min_10(w_min_10),
    .i_hour_1(w_hour_1),
    .i_hour_10(w_hour_10),
    .i_sel(w_FNDCounter_to_FNDDecoder),
    .o_y(w_y)
    );

    BCD_to_FND_Decoder BCD_to_FND_Decoder(
    .i_value(w_y),
    .o_font(o_font)
    );
endmodule
