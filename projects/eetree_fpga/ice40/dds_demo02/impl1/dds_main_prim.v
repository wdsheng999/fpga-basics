// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.10.0.111.2
// Netlist written on Thu Feb 24 17:02:56 2022
//
// Verilog Description of module dds_main
//

module dds_main (clk, rst_n, key, enc_a, enc_b, enc_ok, dac_data, 
            dac_clk, led_out) /* synthesis syn_module_defined=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(1[8:16])
    input clk;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(3[8:11])
    input rst_n;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(4[8:13])
    input [1:0]key;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(5[21:24])
    input enc_a;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(6[19:24])
    input enc_b;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(7[19:24])
    input enc_ok;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(8[19:25])
    output [9:0]dac_data;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    output dac_clk;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(11[13:20])
    output [5:0]led_out;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(12[21:28])
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(3[8:11])
    
    wire GND_net, VCC_net, rst_n_c, key_c_1, key_c_0, enc_ok_c, 
        led_out_c_4, led_out_c_3, led_out_c_2, led_out_c_1, led_out_c_0;
    wire [2:0]curr_wave_st;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(24[12:24])
    wire [2:0]next_wave_st;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(25[12:24])
    wire [2:0]curr_enc_st;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(29[12:23])
    wire [2:0]next_enc_st;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(30[12:23])
    
    wire n824, n834, led_out_2__N_6, led_out_1__N_8, led_out_0__N_10, 
        n226, led_out_4__N_5;
    wire [1:0]key_sec_pre;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(43[19:30])
    wire [1:0]key_sec;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(44[19:26])
    
    wire n827, n166, n802, n801, n838, n837, n831, n889, n829, 
        n835, n828, n788;
    
    VHI i2 (.Z(VCC_net));
    FD1S3AX curr_enc_st_i1 (.D(n827), .CK(clk_c), .Q(curr_enc_st[0]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(111[4:31])
    defparam curr_enc_st_i1.GSR = "ENABLED";
    FD1S3AY led_out_2__62 (.D(led_out_2__N_6), .CK(clk_c), .Q(led_out_c_2));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(84[8] 102[6])
    defparam led_out_2__62.GSR = "ENABLED";
    FD1S3AY led_out_1__63 (.D(led_out_1__N_8), .CK(clk_c), .Q(led_out_c_1));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(84[8] 102[6])
    defparam led_out_1__63.GSR = "ENABLED";
    FD1S3AX led_out_0__64 (.D(led_out_0__N_10), .CK(clk_c), .Q(led_out_c_0));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(84[8] 102[6])
    defparam led_out_0__64.GSR = "ENABLED";
    FD1S3AX curr_wave_st_i0 (.D(next_wave_st[0]), .CK(clk_c), .Q(curr_wave_st[0]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(37[4:33])
    defparam curr_wave_st_i0.GSR = "ENABLED";
    FD1S3AY led_out_4__67 (.D(next_enc_st[1]), .CK(clk_c), .Q(led_out_c_4));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(145[8] 159[6])
    defparam led_out_4__67.GSR = "ENABLED";
    FD1S3AX led_out_3__68 (.D(led_out_4__N_5), .CK(clk_c), .Q(led_out_c_3));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(145[8] 159[6])
    defparam led_out_3__68.GSR = "ENABLED";
    OB dac_data_pad_8 (.I(GND_net), .O(dac_data[8]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    GSR GSR_INST (.GSR(rst_n_c));
    OB dac_data_pad_9 (.I(GND_net), .O(dac_data[9]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    TSALL TSALL_INST (.TSALL(GND_net));
    LUT4 n802_bdd_4_lut (.A(n802), .B(n801), .C(n834), .D(rst_n_c), 
         .Z(led_out_0__N_10)) /* synthesis lut_function=(A (B (D)+!B !(C+!(D)))+!A (B (C (D)))) */ ;
    defparam n802_bdd_4_lut.init = 16'hca00;
    LUT4 i145_2_lut_rep_21 (.A(curr_wave_st[2]), .B(curr_wave_st[1]), .C(curr_wave_st[0]), 
         .D(rst_n_c), .Z(n889)) /* synthesis lut_function=(!(A (B (C+!(D))+!B !(C (D)))+!A !(B (C (D))))) */ ;
    defparam i145_2_lut_rep_21.init = 16'h6800;
    LUT4 i695_3_lut_4_lut_else_4_lut_4_lut (.A(curr_wave_st[2]), .B(curr_wave_st[1]), 
         .C(curr_wave_st[0]), .D(rst_n_c), .Z(n837)) /* synthesis lut_function=(((C+!(D))+!B)+!A) */ ;
    defparam i695_3_lut_4_lut_else_4_lut_4_lut.init = 16'hf7ff;
    LUT4 i466_2_lut_4_lut (.A(n824), .B(n829), .C(curr_wave_st[2]), .D(n889), 
         .Z(next_wave_st[2])) /* synthesis lut_function=(A (B+!(C (D)))+!A (B (C+!(D))+!B !(D))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(46[4] 75[11])
    defparam i466_2_lut_4_lut.init = 16'hcaff;
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    OB dac_data_pad_7 (.I(GND_net), .O(dac_data[7]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    LUT4 n215_bdd_4_lut (.A(n834), .B(curr_wave_st[2]), .C(n835), .D(curr_wave_st[0]), 
         .Z(n788)) /* synthesis lut_function=(A ((C (D)+!C !(D))+!B)+!A (B)) */ ;
    defparam n215_bdd_4_lut.init = 16'he66e;
    LUT4 i467_2_lut_4_lut (.A(n834), .B(n828), .C(curr_wave_st[2]), .D(n889), 
         .Z(next_wave_st[1])) /* synthesis lut_function=(A (B+!(C (D)))+!A (B (C+!(D))+!B !(D))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(46[4] 75[11])
    defparam i467_2_lut_4_lut.init = 16'hcaff;
    LUT4 curr_wave_st_2__bdd_4_lut_707 (.A(curr_wave_st[2]), .B(n834), .C(curr_wave_st[0]), 
         .D(n835), .Z(n166)) /* synthesis lut_function=(A (B (C+(D))+!B !(C))+!A !(B (D))) */ ;
    defparam curr_wave_st_2__bdd_4_lut_707.init = 16'h9bd7;
    LUT4 led_out_c_bdd_2_lut_3_lut (.A(n831), .B(rst_n_c), .C(n788), .Z(led_out_1__N_8)) /* synthesis lut_function=(((C)+!B)+!A) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(45[8] 76[6])
    defparam led_out_c_bdd_2_lut_3_lut.init = 16'hf7f7;
    LUT4 i437_2_lut_3_lut (.A(n831), .B(rst_n_c), .C(n166), .Z(next_wave_st[0])) /* synthesis lut_function=(A (B (C))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(45[8] 76[6])
    defparam i437_2_lut_3_lut.init = 16'h8080;
    FD1S3AY curr_wave_st_i2 (.D(next_wave_st[2]), .CK(clk_c), .Q(curr_wave_st[2]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(37[4:33])
    defparam curr_wave_st_i2.GSR = "ENABLED";
    FD1S3AY curr_wave_st_i1 (.D(next_wave_st[1]), .CK(clk_c), .Q(curr_wave_st[1]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(37[4:33])
    defparam curr_wave_st_i1.GSR = "ENABLED";
    encoder u_encoder (.GND_net(GND_net), .clk_c(clk_c), .enc_ok_c(enc_ok_c), 
            .n226(n226), .\curr_enc_st[0] (curr_enc_st[0]), .led_out_4__N_5(led_out_4__N_5), 
            .n827(n827), .\next_enc_st[1] (next_enc_st[1])) /* synthesis syn_module_defined=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(174[11] 183[8])
    LUT4 key_pulse_0__bdd_4_lut_710 (.A(curr_wave_st[2]), .B(curr_wave_st[0]), 
         .C(n835), .D(curr_wave_st[1]), .Z(n801)) /* synthesis lut_function=(!(A (B (D)+!B !(C (D)))+!A ((C+!(D))+!B))) */ ;
    defparam key_pulse_0__bdd_4_lut_710.init = 16'h2488;
    LUT4 i695_3_lut_4_lut_then_4_lut (.A(n835), .B(n889), .C(curr_wave_st[0]), 
         .D(curr_wave_st[2]), .Z(n838)) /* synthesis lut_function=(!(A (B (C (D)))+!A !((D)+!B))) */ ;
    defparam i695_3_lut_4_lut_then_4_lut.init = 16'h7fbb;
    LUT4 i21_3_lut_rep_15_4_lut_3_lut (.A(curr_wave_st[2]), .B(curr_wave_st[1]), 
         .C(curr_wave_st[0]), .Z(n831)) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(B (C)))) */ ;
    defparam i21_3_lut_rep_15_4_lut_3_lut.init = 16'h6868;
    OB dac_data_pad_6 (.I(GND_net), .O(dac_data[6]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    OB dac_data_pad_5 (.I(GND_net), .O(dac_data[5]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    OB dac_data_pad_4 (.I(GND_net), .O(dac_data[4]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    OB dac_data_pad_3 (.I(GND_net), .O(dac_data[3]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    OB dac_data_pad_2 (.I(GND_net), .O(dac_data[2]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    OB dac_data_pad_1 (.I(GND_net), .O(dac_data[1]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    OB dac_data_pad_0 (.I(GND_net), .O(dac_data[0]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    OB dac_clk_pad (.I(GND_net), .O(dac_clk));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(11[13:20])
    OB led_out_pad_5 (.I(VCC_net), .O(led_out[5]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(12[21:28])
    OB led_out_pad_4 (.I(led_out_c_4), .O(led_out[4]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(12[21:28])
    OB led_out_pad_3 (.I(led_out_c_3), .O(led_out[3]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(12[21:28])
    OB led_out_pad_2 (.I(led_out_c_2), .O(led_out[2]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(12[21:28])
    OB led_out_pad_1 (.I(led_out_c_1), .O(led_out[1]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(12[21:28])
    OB led_out_pad_0 (.I(led_out_c_0), .O(led_out[0]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(12[21:28])
    IB clk_pad (.I(clk), .O(clk_c));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(3[8:11])
    IB rst_n_pad (.I(rst_n), .O(rst_n_c));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(4[8:13])
    IB key_pad_1 (.I(key[1]), .O(key_c_1));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(5[21:24])
    IB key_pad_0 (.I(key[0]), .O(key_c_0));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(5[21:24])
    IB enc_ok_pad (.I(enc_ok), .O(enc_ok_c));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(8[19:25])
    LUT4 i689_2_lut_rep_18 (.A(key_sec_pre[0]), .B(key_sec[0]), .Z(n834)) /* synthesis lut_function=((B)+!A) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(68[11] 71[37])
    defparam i689_2_lut_rep_18.init = 16'hdddd;
    LUT4 i463_3_lut_rep_12_4_lut (.A(key_sec_pre[0]), .B(key_sec[0]), .C(curr_wave_st[0]), 
         .D(n835), .Z(n828)) /* synthesis lut_function=(A ((C (D)+!C !(D))+!B)+!A (C (D)+!C !(D))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(68[11] 71[37])
    defparam i463_3_lut_rep_12_4_lut.init = 16'hf22f;
    LUT4 i156_3_lut (.A(curr_enc_st[0]), .B(rst_n_c), .C(led_out_c_4), 
         .Z(n226)) /* synthesis lut_function=(!(A ((C)+!B)+!A !(B (C)))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(119[8] 137[6])
    defparam i156_3_lut.init = 16'h4848;
    LUT4 mux_106_i3_3_lut_4_lut_3_lut_rep_13_4_lut (.A(key_sec_pre[0]), .B(key_sec[0]), 
         .C(n835), .D(curr_wave_st[0]), .Z(n829)) /* synthesis lut_function=(!(A (B (C (D))+!B !(D))+!A (C (D)))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(68[11] 71[37])
    defparam mux_106_i3_3_lut_4_lut_3_lut_rep_13_4_lut.init = 16'h2fdd;
    LUT4 key_pulse_0__bdd_3_lut_711 (.A(curr_wave_st[2]), .B(curr_wave_st[0]), 
         .C(curr_wave_st[1]), .Z(n802)) /* synthesis lut_function=(!(A (B+!(C))+!A !(B (C)))) */ ;
    defparam key_pulse_0__bdd_3_lut_711.init = 16'h6060;
    PFUMX i715 (.BLUT(n837), .ALUT(n838), .C0(n834), .Z(led_out_2__N_6));
    VLO i1 (.Z(GND_net));
    \button(N=2'b10)  u_button (.GND_net(GND_net), .clk_c(clk_c), .key_sec_pre({Open_0, 
            key_sec_pre[0]}), .key_sec({Open_1, key_sec[0]}), .key_c_0(key_c_0), 
            .key_c_1(key_c_1), .n835(n835), .n824(n824)) /* synthesis syn_module_defined=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(166[3] 171[6])
    
endmodule
//
// Verilog Description of module TSALL
// module not written out since it is a black-box. 
//

//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

//
// Verilog Description of module encoder
//

module encoder (GND_net, clk_c, enc_ok_c, n226, \curr_enc_st[0] , 
            led_out_4__N_5, n827, \next_enc_st[1] ) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input clk_c;
    input enc_ok_c;
    input n226;
    input \curr_enc_st[0] ;
    output led_out_4__N_5;
    output n827;
    output \next_enc_st[1] ;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(3[8:11])
    wire [5:0]cnt_20ms;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(23[14:22])
    
    wire n830, n673;
    wire [12:0]cnt;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(15[15:18])
    wire [12:0]n1;
    
    wire n672, n670, n671;
    wire [5:0]n20;
    
    wire key_ok_r, clk_c_enable_2, key_ok_r1, cnt_12__N_122;
    wire [5:0]n53;
    
    wire n753, n755, n759, cnt_20ms_5__N_129, n836, n684, n4, 
        n5, n6, n669, n668;
    
    LUT4 i182_2_lut_rep_14_3_lut (.A(cnt_20ms[1]), .B(cnt_20ms[0]), .C(cnt_20ms[2]), 
         .Z(n830)) /* synthesis lut_function=(A (B (C))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(48[16:31])
    defparam i182_2_lut_rep_14_3_lut.init = 16'h8080;
    CCU2D cnt_158_add_4_13 (.A0(cnt[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt[12]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n673), .S0(n1[11]), .S1(n1[12]));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158_add_4_13.INIT0 = 16'hfaaa;
    defparam cnt_158_add_4_13.INIT1 = 16'hfaaa;
    defparam cnt_158_add_4_13.INJECT1_0 = "NO";
    defparam cnt_158_add_4_13.INJECT1_1 = "NO";
    CCU2D cnt_158_add_4_11 (.A0(cnt[9]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n672), 
          .COUT(n673), .S0(n1[9]), .S1(n1[10]));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158_add_4_11.INIT0 = 16'hfaaa;
    defparam cnt_158_add_4_11.INIT1 = 16'hfaaa;
    defparam cnt_158_add_4_11.INJECT1_0 = "NO";
    defparam cnt_158_add_4_11.INJECT1_1 = "NO";
    CCU2D cnt_158_add_4_7 (.A0(cnt[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n670), 
          .COUT(n671), .S0(n1[5]), .S1(n1[6]));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158_add_4_7.INIT0 = 16'hfaaa;
    defparam cnt_158_add_4_7.INIT1 = 16'hfaaa;
    defparam cnt_158_add_4_7.INJECT1_0 = "NO";
    defparam cnt_158_add_4_7.INJECT1_1 = "NO";
    FD1S3AY cnt_20ms__i0 (.D(n20[0]), .CK(clk_c), .Q(cnt_20ms[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=8, LSE_LLINE=174, LSE_RLINE=183 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam cnt_20ms__i0.GSR = "ENABLED";
    FD1P3AY key_ok_r_61 (.D(enc_ok_c), .SP(clk_c_enable_2), .CK(clk_c), 
            .Q(key_ok_r));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam key_ok_r_61.GSR = "ENABLED";
    FD1S3AY key_ok_r1_62 (.D(key_ok_r), .CK(clk_c), .Q(key_ok_r1)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=8, LSE_LLINE=174, LSE_RLINE=183 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(58[7:29])
    defparam key_ok_r1_62.GSR = "ENABLED";
    FD1S3IX cnt_158__i0 (.D(n1[0]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[0])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158__i0.GSR = "ENABLED";
    LUT4 i180_2_lut_3_lut (.A(cnt_20ms[1]), .B(cnt_20ms[0]), .C(cnt_20ms[2]), 
         .Z(n53[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(48[16:31])
    defparam i180_2_lut_3_lut.init = 16'h7878;
    LUT4 i187_2_lut_3_lut_4_lut (.A(cnt_20ms[1]), .B(cnt_20ms[0]), .C(cnt_20ms[3]), 
         .D(cnt_20ms[2]), .Z(n53[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(48[16:31])
    defparam i187_2_lut_3_lut_4_lut.init = 16'h78f0;
    LUT4 i670_4_lut (.A(n753), .B(cnt[6]), .C(n755), .D(cnt[1]), .Z(n759)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i670_4_lut.init = 16'h8000;
    LUT4 i664_4_lut (.A(cnt[0]), .B(cnt[8]), .C(cnt[12]), .D(cnt[3]), 
         .Z(n753)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i664_4_lut.init = 16'h8000;
    LUT4 i2_4_lut (.A(cnt_20ms[3]), .B(cnt_20ms[5]), .C(cnt_20ms[4]), 
         .D(cnt_20ms_5__N_129), .Z(clk_c_enable_2)) /* synthesis lut_function=(A (B (D))+!A (B (C (D)))) */ ;
    defparam i2_4_lut.init = 16'hc800;
    LUT4 i666_4_lut (.A(cnt[9]), .B(cnt[10]), .C(cnt[5]), .D(cnt[2]), 
         .Z(n755)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i666_4_lut.init = 16'h8000;
    LUT4 i201_3_lut_4_lut (.A(cnt_20ms[3]), .B(n830), .C(cnt_20ms[4]), 
         .D(cnt_20ms[5]), .Z(n53[5])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(48[16:31])
    defparam i201_3_lut_4_lut.init = 16'h7f80;
    FD1S3IX cnt_158__i12 (.D(n1[12]), .CK(clk_c), .CD(cnt_12__N_122), 
            .Q(cnt[12])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158__i12.GSR = "ENABLED";
    LUT4 i194_2_lut_3_lut_4_lut (.A(cnt_20ms[2]), .B(n836), .C(cnt_20ms[4]), 
         .D(cnt_20ms[3]), .Z(n53[4])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(48[16:31])
    defparam i194_2_lut_3_lut_4_lut.init = 16'h78f0;
    LUT4 i173_2_lut (.A(cnt_20ms[1]), .B(cnt_20ms[0]), .Z(n53[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(48[16:31])
    defparam i173_2_lut.init = 16'h6666;
    LUT4 equal_131_i4_1_lut_3_lut_4_lut_3_lut_4_lut (.A(key_ok_r1), .B(key_ok_r), 
         .C(n226), .D(\curr_enc_st[0] ), .Z(led_out_4__N_5)) /* synthesis lut_function=(A (B (C (D))+!B !((D)+!C))+!A (C (D))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(63[19:43])
    defparam equal_131_i4_1_lut_3_lut_4_lut_3_lut_4_lut.init = 16'hd020;
    FD1S3IX cnt_158__i11 (.D(n1[11]), .CK(clk_c), .CD(cnt_12__N_122), 
            .Q(cnt[11])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158__i11.GSR = "ENABLED";
    FD1S3IX cnt_158__i10 (.D(n1[10]), .CK(clk_c), .CD(cnt_12__N_122), 
            .Q(cnt[10])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158__i10.GSR = "ENABLED";
    FD1S3IX cnt_158__i9 (.D(n1[9]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[9])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158__i9.GSR = "ENABLED";
    FD1S3IX cnt_158__i8 (.D(n1[8]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[8])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158__i8.GSR = "ENABLED";
    FD1S3IX cnt_158__i7 (.D(n1[7]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[7])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158__i7.GSR = "ENABLED";
    FD1S3IX cnt_158__i6 (.D(n1[6]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[6])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158__i6.GSR = "ENABLED";
    FD1S3IX cnt_158__i5 (.D(n1[5]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[5])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158__i5.GSR = "ENABLED";
    FD1S3IX cnt_158__i4 (.D(n1[4]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[4])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158__i4.GSR = "ENABLED";
    FD1S3IX cnt_158__i3 (.D(n1[3]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[3])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158__i3.GSR = "ENABLED";
    FD1S3IX cnt_158__i2 (.D(n1[2]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[2])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158__i2.GSR = "ENABLED";
    FD1S3IX cnt_158__i1 (.D(n1[1]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[1])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158__i1.GSR = "ENABLED";
    CCU2D cnt_158_add_4_9 (.A0(cnt[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n671), 
          .COUT(n672), .S0(n1[7]), .S1(n1[8]));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158_add_4_9.INIT0 = 16'hfaaa;
    defparam cnt_158_add_4_9.INIT1 = 16'hfaaa;
    defparam cnt_158_add_4_9.INJECT1_0 = "NO";
    defparam cnt_158_add_4_9.INJECT1_1 = "NO";
    LUT4 i436_3_lut_rep_11_4_lut (.A(key_ok_r1), .B(key_ok_r), .C(\curr_enc_st[0] ), 
         .D(n226), .Z(n827)) /* synthesis lut_function=(A (B (C (D))+!B !(C+!(D)))+!A (C (D))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(63[19:43])
    defparam i436_3_lut_rep_11_4_lut.init = 16'hd200;
    LUT4 i2_3_lut_rep_7_4_lut_3_lut_4_lut (.A(key_ok_r1), .B(key_ok_r), 
         .C(n226), .D(\curr_enc_st[0] ), .Z(\next_enc_st[1] )) /* synthesis lut_function=(!(A (B (C (D))+!B !((D)+!C))+!A (C (D)))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(63[19:43])
    defparam i2_3_lut_rep_7_4_lut_3_lut_4_lut.init = 16'h2fdf;
    LUT4 i1_3_lut (.A(cnt[5]), .B(n684), .C(cnt[4]), .Z(n4)) /* synthesis lut_function=(A (B+(C))) */ ;
    defparam i1_3_lut.init = 16'ha8a8;
    FD1P3IX cnt_20ms__i5 (.D(n53[5]), .SP(cnt_20ms_5__N_129), .CD(clk_c_enable_2), 
            .CK(clk_c), .Q(cnt_20ms[5])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=8, LSE_LLINE=174, LSE_RLINE=183 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam cnt_20ms__i5.GSR = "ENABLED";
    FD1P3IX cnt_20ms__i4 (.D(n53[4]), .SP(cnt_20ms_5__N_129), .CD(clk_c_enable_2), 
            .CK(clk_c), .Q(cnt_20ms[4])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=8, LSE_LLINE=174, LSE_RLINE=183 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam cnt_20ms__i4.GSR = "ENABLED";
    FD1P3IX cnt_20ms__i3 (.D(n53[3]), .SP(cnt_20ms_5__N_129), .CD(clk_c_enable_2), 
            .CK(clk_c), .Q(cnt_20ms[3])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=8, LSE_LLINE=174, LSE_RLINE=183 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam cnt_20ms__i3.GSR = "ENABLED";
    FD1P3IX cnt_20ms__i2 (.D(n53[2]), .SP(cnt_20ms_5__N_129), .CD(clk_c_enable_2), 
            .CK(clk_c), .Q(cnt_20ms[2])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=8, LSE_LLINE=174, LSE_RLINE=183 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam cnt_20ms__i2.GSR = "ENABLED";
    FD1P3IX cnt_20ms__i1 (.D(n53[1]), .SP(cnt_20ms_5__N_129), .CD(clk_c_enable_2), 
            .CK(clk_c), .Q(cnt_20ms[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=8, LSE_LLINE=174, LSE_RLINE=183 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam cnt_20ms__i1.GSR = "ENABLED";
    LUT4 i250_4_lut (.A(n5), .B(cnt[12]), .C(cnt[11]), .D(n6), .Z(cnt_12__N_122)) /* synthesis lut_function=(A (B (C+(D)))+!A (B (C))) */ ;
    defparam i250_4_lut.init = 16'hc8c0;
    LUT4 i1_4_lut (.A(cnt[6]), .B(cnt[9]), .C(cnt[7]), .D(n4), .Z(n5)) /* synthesis lut_function=(A (B (C+(D)))+!A (B (C))) */ ;
    defparam i1_4_lut.init = 16'hc8c0;
    LUT4 i433_3_lut (.A(cnt_20ms[0]), .B(clk_c_enable_2), .C(cnt_20ms_5__N_129), 
         .Z(n20[0])) /* synthesis lut_function=(!(A (B+(C))+!A (B+!(C)))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam i433_3_lut.init = 16'h1212;
    LUT4 i683_4_lut (.A(cnt[7]), .B(cnt[4]), .C(cnt[11]), .D(n759), 
         .Z(cnt_20ms_5__N_129)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[14:32])
    defparam i683_4_lut.init = 16'h0100;
    LUT4 i2_2_lut (.A(cnt[10]), .B(cnt[8]), .Z(n6)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2_2_lut.init = 16'h8888;
    LUT4 i3_4_lut (.A(cnt[0]), .B(cnt[3]), .C(cnt[2]), .D(cnt[1]), .Z(n684)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i3_4_lut.init = 16'h8000;
    LUT4 i175_2_lut_rep_20 (.A(cnt_20ms[1]), .B(cnt_20ms[0]), .Z(n836)) /* synthesis lut_function=(A (B)) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(48[16:31])
    defparam i175_2_lut_rep_20.init = 16'h8888;
    CCU2D cnt_158_add_4_5 (.A0(cnt[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n669), 
          .COUT(n670), .S0(n1[3]), .S1(n1[4]));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158_add_4_5.INIT0 = 16'hfaaa;
    defparam cnt_158_add_4_5.INIT1 = 16'hfaaa;
    defparam cnt_158_add_4_5.INJECT1_0 = "NO";
    defparam cnt_158_add_4_5.INJECT1_1 = "NO";
    CCU2D cnt_158_add_4_3 (.A0(cnt[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n668), 
          .COUT(n669), .S0(n1[1]), .S1(n1[2]));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158_add_4_3.INIT0 = 16'hfaaa;
    defparam cnt_158_add_4_3.INIT1 = 16'hfaaa;
    defparam cnt_158_add_4_3.INJECT1_0 = "NO";
    defparam cnt_158_add_4_3.INJECT1_1 = "NO";
    CCU2D cnt_158_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n668), 
          .S1(n1[0]));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_158_add_4_1.INIT0 = 16'hF000;
    defparam cnt_158_add_4_1.INIT1 = 16'h0555;
    defparam cnt_158_add_4_1.INJECT1_0 = "NO";
    defparam cnt_158_add_4_1.INJECT1_1 = "NO";
    
endmodule
//
// Verilog Description of module \button(N=2'b10) 
//

module \button(N=2'b10)  (GND_net, clk_c, key_sec_pre, key_sec, key_c_0, 
            key_c_1, n835, n824) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input clk_c;
    output [1:0]key_sec_pre;
    output [1:0]key_sec;
    input key_c_0;
    input key_c_1;
    output n835;
    output n824;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(3[8:11])
    
    wire n681;
    wire [17:0]cnt;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(30[14:17])
    wire [17:0]n77;
    
    wire n682;
    wire [1:0]key_rst_pre;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(10[19:30])
    wire [1:0]key_rst;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(11[19:26])
    
    wire clk_c_enable_3, cnt_17__N_86, n680, n21, n34, n30, n22;
    wire [1:0]key_sec_c;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(44[19:26])
    
    wire n31, n28, n677, n678, n679, n676;
    wire [1:0]key_sec_pre_c;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(43[19:30])
    
    wire n675, n683;
    
    CCU2D cnt_157_add_4_15 (.A0(cnt[13]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt[14]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n681), .COUT(n682), .S0(n77[13]), .S1(n77[14]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157_add_4_15.INIT0 = 16'hfaaa;
    defparam cnt_157_add_4_15.INIT1 = 16'hfaaa;
    defparam cnt_157_add_4_15.INJECT1_0 = "NO";
    defparam cnt_157_add_4_15.INJECT1_1 = "NO";
    FD1S3AY key_rst_pre_i0 (.D(key_rst[0]), .CK(clk_c), .Q(key_rst_pre[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=3, LSE_RCOL=6, LSE_LLINE=166, LSE_RLINE=171 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(22[8] 25[6])
    defparam key_rst_pre_i0.GSR = "ENABLED";
    FD1S3AY key_sec_pre_i0 (.D(key_sec[0]), .CK(clk_c), .Q(key_sec_pre[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=3, LSE_RCOL=6, LSE_LLINE=166, LSE_RLINE=171 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(60[4:27])
    defparam key_sec_pre_i0.GSR = "ENABLED";
    FD1S3AY key_rst_i0 (.D(key_c_0), .CK(clk_c), .Q(key_rst[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=3, LSE_RCOL=6, LSE_LLINE=166, LSE_RLINE=171 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(22[8] 25[6])
    defparam key_rst_i0.GSR = "ENABLED";
    FD1P3AY key_sec_i0_i0 (.D(key_c_0), .SP(clk_c_enable_3), .CK(clk_c), 
            .Q(key_sec[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=3, LSE_RCOL=6, LSE_LLINE=166, LSE_RLINE=171 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(52[8] 53[19])
    defparam key_sec_i0_i0.GSR = "ENABLED";
    LUT4 key_edge_1__I_0_i1_4_lut (.A(key_rst_pre[0]), .B(key_rst_pre[1]), 
         .C(key_rst[0]), .D(key_rst[1]), .Z(cnt_17__N_86)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A ((D)+!B))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(37[11:19])
    defparam key_edge_1__I_0_i1_4_lut.init = 16'h0ace;
    FD1S3IX cnt_157__i0 (.D(n77[0]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[0])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i0.GSR = "ENABLED";
    FD1S3IX cnt_157__i17 (.D(n77[17]), .CK(clk_c), .CD(cnt_17__N_86), 
            .Q(cnt[17])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i17.GSR = "ENABLED";
    CCU2D cnt_157_add_4_13 (.A0(cnt[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt[12]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n680), .COUT(n681), .S0(n77[11]), .S1(n77[12]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157_add_4_13.INIT0 = 16'hfaaa;
    defparam cnt_157_add_4_13.INIT1 = 16'hfaaa;
    defparam cnt_157_add_4_13.INJECT1_0 = "NO";
    defparam cnt_157_add_4_13.INJECT1_1 = "NO";
    LUT4 i17_4_lut (.A(n21), .B(n34), .C(n30), .D(n22), .Z(clk_c_enable_3)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i17_4_lut.init = 16'h8000;
    FD1S3IX cnt_157__i16 (.D(n77[16]), .CK(clk_c), .CD(cnt_17__N_86), 
            .Q(cnt[16])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i16.GSR = "ENABLED";
    FD1S3IX cnt_157__i15 (.D(n77[15]), .CK(clk_c), .CD(cnt_17__N_86), 
            .Q(cnt[15])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i15.GSR = "ENABLED";
    FD1S3IX cnt_157__i14 (.D(n77[14]), .CK(clk_c), .CD(cnt_17__N_86), 
            .Q(cnt[14])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i14.GSR = "ENABLED";
    FD1S3IX cnt_157__i13 (.D(n77[13]), .CK(clk_c), .CD(cnt_17__N_86), 
            .Q(cnt[13])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i13.GSR = "ENABLED";
    FD1S3IX cnt_157__i12 (.D(n77[12]), .CK(clk_c), .CD(cnt_17__N_86), 
            .Q(cnt[12])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i12.GSR = "ENABLED";
    FD1S3IX cnt_157__i11 (.D(n77[11]), .CK(clk_c), .CD(cnt_17__N_86), 
            .Q(cnt[11])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i11.GSR = "ENABLED";
    FD1S3IX cnt_157__i10 (.D(n77[10]), .CK(clk_c), .CD(cnt_17__N_86), 
            .Q(cnt[10])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i10.GSR = "ENABLED";
    FD1S3IX cnt_157__i9 (.D(n77[9]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[9])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i9.GSR = "ENABLED";
    FD1S3IX cnt_157__i8 (.D(n77[8]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[8])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i8.GSR = "ENABLED";
    FD1S3IX cnt_157__i7 (.D(n77[7]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[7])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i7.GSR = "ENABLED";
    FD1S3IX cnt_157__i6 (.D(n77[6]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[6])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i6.GSR = "ENABLED";
    FD1S3IX cnt_157__i5 (.D(n77[5]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[5])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i5.GSR = "ENABLED";
    FD1S3IX cnt_157__i4 (.D(n77[4]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[4])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i4.GSR = "ENABLED";
    FD1S3IX cnt_157__i3 (.D(n77[3]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[3])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i3.GSR = "ENABLED";
    FD1S3IX cnt_157__i2 (.D(n77[2]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[2])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i2.GSR = "ENABLED";
    FD1S3IX cnt_157__i1 (.D(n77[1]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[1])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157__i1.GSR = "ENABLED";
    LUT4 i3_2_lut (.A(cnt[13]), .B(cnt[8]), .Z(n21)) /* synthesis lut_function=(A (B)) */ ;
    defparam i3_2_lut.init = 16'h8888;
    FD1P3AY key_sec_i0_i1 (.D(key_c_1), .SP(clk_c_enable_3), .CK(clk_c), 
            .Q(key_sec_c[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=3, LSE_RCOL=6, LSE_LLINE=166, LSE_RLINE=171 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(52[8] 53[19])
    defparam key_sec_i0_i1.GSR = "ENABLED";
    LUT4 i16_4_lut (.A(n31), .B(cnt[9]), .C(n28), .D(cnt[2]), .Z(n34)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i16_4_lut.init = 16'h8000;
    CCU2D cnt_157_add_4_7 (.A0(cnt[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n677), 
          .COUT(n678), .S0(n77[5]), .S1(n77[6]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157_add_4_7.INIT0 = 16'hfaaa;
    defparam cnt_157_add_4_7.INIT1 = 16'hfaaa;
    defparam cnt_157_add_4_7.INJECT1_0 = "NO";
    defparam cnt_157_add_4_7.INJECT1_1 = "NO";
    FD1S3AY key_rst_i1 (.D(key_c_1), .CK(clk_c), .Q(key_rst[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=3, LSE_RCOL=6, LSE_LLINE=166, LSE_RLINE=171 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(22[8] 25[6])
    defparam key_rst_i1.GSR = "ENABLED";
    LUT4 i12_4_lut (.A(cnt[3]), .B(cnt[10]), .C(cnt[5]), .D(cnt[0]), 
         .Z(n30)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i12_4_lut.init = 16'h8000;
    LUT4 i4_2_lut (.A(cnt[7]), .B(cnt[12]), .Z(n22)) /* synthesis lut_function=(A (B)) */ ;
    defparam i4_2_lut.init = 16'h8888;
    CCU2D cnt_157_add_4_11 (.A0(cnt[9]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n679), 
          .COUT(n680), .S0(n77[9]), .S1(n77[10]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157_add_4_11.INIT0 = 16'hfaaa;
    defparam cnt_157_add_4_11.INIT1 = 16'hfaaa;
    defparam cnt_157_add_4_11.INJECT1_0 = "NO";
    defparam cnt_157_add_4_11.INJECT1_1 = "NO";
    CCU2D cnt_157_add_4_5 (.A0(cnt[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n676), 
          .COUT(n677), .S0(n77[3]), .S1(n77[4]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157_add_4_5.INIT0 = 16'hfaaa;
    defparam cnt_157_add_4_5.INIT1 = 16'hfaaa;
    defparam cnt_157_add_4_5.INJECT1_0 = "NO";
    defparam cnt_157_add_4_5.INJECT1_1 = "NO";
    FD1S3AY key_sec_pre_i1 (.D(key_sec_c[1]), .CK(clk_c), .Q(key_sec_pre_c[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=3, LSE_RCOL=6, LSE_LLINE=166, LSE_RLINE=171 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(60[4:27])
    defparam key_sec_pre_i1.GSR = "ENABLED";
    FD1S3AY key_rst_pre_i1 (.D(key_rst[1]), .CK(clk_c), .Q(key_rst_pre[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=3, LSE_RCOL=6, LSE_LLINE=166, LSE_RLINE=171 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(22[8] 25[6])
    defparam key_rst_pre_i1.GSR = "ENABLED";
    CCU2D cnt_157_add_4_9 (.A0(cnt[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n678), 
          .COUT(n679), .S0(n77[7]), .S1(n77[8]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157_add_4_9.INIT0 = 16'hfaaa;
    defparam cnt_157_add_4_9.INIT1 = 16'hfaaa;
    defparam cnt_157_add_4_9.INJECT1_0 = "NO";
    defparam cnt_157_add_4_9.INJECT1_1 = "NO";
    LUT4 i13_4_lut (.A(cnt[17]), .B(cnt[15]), .C(cnt[16]), .D(cnt[4]), 
         .Z(n31)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i13_4_lut.init = 16'h8000;
    LUT4 i10_4_lut (.A(cnt[1]), .B(cnt[6]), .C(cnt[14]), .D(cnt[11]), 
         .Z(n28)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i10_4_lut.init = 16'h8000;
    LUT4 key_sec_pre_1__I_0_i2_2_lut_rep_19 (.A(key_sec_pre_c[1]), .B(key_sec_c[1]), 
         .Z(n835)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(62[21:45])
    defparam key_sec_pre_1__I_0_i2_2_lut_rep_19.init = 16'h2222;
    LUT4 i462_2_lut_rep_8_2_lut_3_lut_4_lut (.A(key_sec_pre_c[1]), .B(key_sec_c[1]), 
         .C(key_sec[0]), .D(key_sec_pre[0]), .Z(n824)) /* synthesis lut_function=(!(A (B (C+!(D)))+!A (C+!(D)))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(62[21:45])
    defparam i462_2_lut_rep_8_2_lut_3_lut_4_lut.init = 16'h2f22;
    CCU2D cnt_157_add_4_3 (.A0(cnt[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n675), 
          .COUT(n676), .S0(n77[1]), .S1(n77[2]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157_add_4_3.INIT0 = 16'hfaaa;
    defparam cnt_157_add_4_3.INIT1 = 16'hfaaa;
    defparam cnt_157_add_4_3.INJECT1_0 = "NO";
    defparam cnt_157_add_4_3.INJECT1_1 = "NO";
    CCU2D cnt_157_add_4_19 (.A0(cnt[17]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n683), .S0(n77[17]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157_add_4_19.INIT0 = 16'hfaaa;
    defparam cnt_157_add_4_19.INIT1 = 16'h0000;
    defparam cnt_157_add_4_19.INJECT1_0 = "NO";
    defparam cnt_157_add_4_19.INJECT1_1 = "NO";
    CCU2D cnt_157_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n675), 
          .S1(n77[0]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157_add_4_1.INIT0 = 16'hF000;
    defparam cnt_157_add_4_1.INIT1 = 16'h0555;
    defparam cnt_157_add_4_1.INJECT1_0 = "NO";
    defparam cnt_157_add_4_1.INJECT1_1 = "NO";
    CCU2D cnt_157_add_4_17 (.A0(cnt[15]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt[16]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n682), .COUT(n683), .S0(n77[15]), .S1(n77[16]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_157_add_4_17.INIT0 = 16'hfaaa;
    defparam cnt_157_add_4_17.INIT1 = 16'hfaaa;
    defparam cnt_157_add_4_17.INJECT1_0 = "NO";
    defparam cnt_157_add_4_17.INJECT1_1 = "NO";
    
endmodule
