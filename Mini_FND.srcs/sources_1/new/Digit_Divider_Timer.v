`timescale 1ns / 1ps

module Digit_Divider_Timer(
    input[5:0] i_hour, i_min, // i_sec,
    output[3:0] o_hour_10, o_hour_1, o_min_10, o_min_1 //, o_sec_10, o_sec_1
    );

    assign o_hour_10 = i_hour / 10 % 10;
    assign o_hour_1  = i_hour % 10;
    
    assign o_min_10 = i_min / 10 % 10;
    assign o_min_1  = i_min % 10;

    // assign o_sec_10 = i_sec / 10 % 10;
    // assign o_sec_1  = i_sec % 10;
    
    /*ab:cd 12:34                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           

    i_sec_10 = i_a = 12 / 10 = 1, 1 % 10 = 1
    i_sec_1  = i_b = 12 % 10 = 2
    i_msec_10  = i_c = 34 / 10 = 3, 3 % 10 = 3
    i_msec_1   = i_d = 34 % 10 = 4
    12 : 34 출력. 
    */
endmodule
