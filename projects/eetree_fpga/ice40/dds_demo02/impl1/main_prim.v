// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.10.0.111.2
// Netlist written on Fri Feb 25 14:07:15 2022
//
// Verilog Description of module main
//

module main (clk, rst_n, key, enc_a, enc_b, enc_ok, dac_data, 
            dac_clk, led_out) /* synthesis syn_module_defined=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(1[8:12])
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
    wire dac_clk_c /* synthesis SET_AS_NETWORK=dac_clk_c, is_clock=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(11[13:20])
    
    wire GND_net, VCC_net, rst_n_c, key_c_1, key_c_0, enc_a_c, enc_b_c, 
        enc_ok_c, dac_data_c_9, dac_data_c_8, dac_data_c_7, dac_data_c_6, 
        dac_data_c_5, dac_data_c_4, dac_data_c_3, dac_data_c_2, dac_data_c_1, 
        dac_data_c_0, led_out_c_4, led_out_c_3, led_out_c_2, led_out_c_1, 
        led_out_c_0, enc_pulse_l, enc_pulse_r;
    wire [2:0]curr_wave_st;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(24[12:24])
    wire [2:0]next_wave_st;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(25[12:24])
    wire [2:0]curr_enc_st;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(29[12:23])
    wire [2:0]next_enc_st;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(30[12:23])
    wire [31:0]dds_fm_step;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(183[14:25])
    wire [7:0]dds_am_factor;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(194[13:26])
    
    wire led_out_2__N_6, led_out_1__N_8, led_out_0__N_10, led_out_4__N_5;
    wire [1:0]key_sec_pre;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(43[19:30])
    wire [1:0]key_sec;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(44[19:26])
    
    wire n1655, n1651, n1642, dds_fm_step_31__N_186, n1634, n1649, 
        dds_am_factor_7__N_231, n1645, n460, n1648, n336, n1647, 
        n1618, n1617, n1708, n1656, n1654, n1653;
    
    VHI i2 (.Z(VCC_net));
    FD1S3AX curr_enc_st_i1 (.D(n1645), .CK(clk_c), .Q(curr_enc_st[0]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(111[4:31])
    defparam curr_enc_st_i1.GSR = "ENABLED";
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
    dds_fm u_dds_fm (.enc_pulse_r(enc_pulse_r), .enc_pulse_l(enc_pulse_l), 
           .dds_fm_step({dds_fm_step}), .GND_net(GND_net), .clk_c(clk_c), 
           .dds_fm_step_31__N_186(dds_fm_step_31__N_186)) /* synthesis syn_module_defined=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(184[9] 191[3])
    FD1S3AY led_out_2__62 (.D(led_out_2__N_6), .CK(clk_c), .Q(led_out_c_2));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(84[8] 102[6])
    defparam led_out_2__62.GSR = "ENABLED";
    LUT4 i718_2_lut_4_lut (.A(n1642), .B(n1647), .C(curr_wave_st[2]), 
         .D(n1708), .Z(next_wave_st[2])) /* synthesis lut_function=(A (B+!(C (D)))+!A (B (C+!(D))+!B !(D))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(46[4] 75[11])
    defparam i718_2_lut_4_lut.init = 16'hcaff;
    OB dac_data_pad_7 (.I(dac_data_c_7), .O(dac_data[7]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    LUT4 i199_2_lut_rep_21 (.A(curr_wave_st[2]), .B(curr_wave_st[1]), .C(curr_wave_st[0]), 
         .D(rst_n_c), .Z(n1708)) /* synthesis lut_function=(!(A (B (C+!(D))+!B !(C (D)))+!A !(B (C (D))))) */ ;
    defparam i199_2_lut_rep_21.init = 16'h6800;
    LUT4 i1062_3_lut_4_lut_else_4_lut_4_lut (.A(curr_wave_st[2]), .B(curr_wave_st[1]), 
         .C(curr_wave_st[0]), .D(rst_n_c), .Z(n1655)) /* synthesis lut_function=(((C+!(D))+!B)+!A) */ ;
    defparam i1062_3_lut_4_lut_else_4_lut_4_lut.init = 16'hf7ff;
    LUT4 n1618_bdd_4_lut (.A(n1618), .B(n1617), .C(n1654), .D(rst_n_c), 
         .Z(led_out_0__N_10)) /* synthesis lut_function=(A (B (D)+!B !(C+!(D)))+!A (B (C (D)))) */ ;
    defparam n1618_bdd_4_lut.init = 16'hca00;
    encoder u_encoder (.GND_net(GND_net), .clk_c(clk_c), .enc_a_c(enc_a_c), 
            .enc_pulse_l(enc_pulse_l), .enc_ok_c(enc_ok_c), .enc_b_c(enc_b_c), 
            .n460(n460), .\curr_enc_st[0] (curr_enc_st[0]), .led_out_4__N_5(led_out_4__N_5), 
            .n1645(n1645), .\next_enc_st[1] (next_enc_st[1]), .enc_pulse_r(enc_pulse_r)) /* synthesis syn_module_defined=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(171[11] 180[8])
    LUT4 i692_2_lut_3_lut (.A(n1648), .B(rst_n_c), .C(n336), .Z(next_wave_st[0])) /* synthesis lut_function=(A (B (C))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(45[8] 76[6])
    defparam i692_2_lut_3_lut.init = 16'h8080;
    OB dac_data_pad_8 (.I(dac_data_c_8), .O(dac_data[8]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    OB dac_data_pad_9 (.I(dac_data_c_9), .O(dac_data[9]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    LUT4 i719_2_lut_4_lut (.A(n1654), .B(n1649), .C(curr_wave_st[2]), 
         .D(n1708), .Z(next_wave_st[1])) /* synthesis lut_function=(A (B+!(C (D)))+!A (B (C+!(D))+!B !(D))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(46[4] 75[11])
    defparam i719_2_lut_4_lut.init = 16'hcaff;
    LUT4 i207_3_lut (.A(curr_enc_st[0]), .B(rst_n_c), .C(led_out_c_4), 
         .Z(n460)) /* synthesis lut_function=(!(A ((C)+!B)+!A !(B (C)))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(119[8] 137[6])
    defparam i207_3_lut.init = 16'h4848;
    LUT4 curr_wave_st_2__bdd_4_lut_1071 (.A(curr_wave_st[2]), .B(n1654), 
         .C(curr_wave_st[0]), .D(n1653), .Z(n336)) /* synthesis lut_function=(A (B (C+(D))+!B !(C))+!A !(B (D))) */ ;
    defparam curr_wave_st_2__bdd_4_lut_1071.init = 16'h9bd7;
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    GSR GSR_INST (.GSR(rst_n_c));
    LUT4 led_out_c_bdd_2_lut_3_lut (.A(n1648), .B(rst_n_c), .C(n1634), 
         .Z(led_out_1__N_8)) /* synthesis lut_function=(((C)+!B)+!A) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(45[8] 76[6])
    defparam led_out_c_bdd_2_lut_3_lut.init = 16'hf7f7;
    FD1S3AY curr_wave_st_i2 (.D(next_wave_st[2]), .CK(clk_c), .Q(curr_wave_st[2]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(37[4:33])
    defparam curr_wave_st_i2.GSR = "ENABLED";
    FD1S3AY curr_wave_st_i1 (.D(next_wave_st[1]), .CK(clk_c), .Q(curr_wave_st[1]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(37[4:33])
    defparam curr_wave_st_i1.GSR = "ENABLED";
    TSALL TSALL_INST (.TSALL(GND_net));
    OB dac_data_pad_6 (.I(dac_data_c_6), .O(dac_data[6]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    LUT4 key_pulse_0__bdd_4_lut_1082 (.A(curr_wave_st[2]), .B(curr_wave_st[0]), 
         .C(n1653), .D(curr_wave_st[1]), .Z(n1617)) /* synthesis lut_function=(!(A (B (D)+!B !(C (D)))+!A ((C+!(D))+!B))) */ ;
    defparam key_pulse_0__bdd_4_lut_1082.init = 16'h2488;
    dds u_dds (.dds_fm_step({dds_fm_step}), .GND_net(GND_net), .dac_clk_c(dac_clk_c), 
        .dds_am_factor({dds_am_factor}), .dac_data_c_0(dac_data_c_0), .\curr_wave_st[1] (curr_wave_st[1]), 
        .dac_data_c_9(dac_data_c_9), .\curr_wave_st[0] (curr_wave_st[0]), 
        .n1651(n1651), .dac_data_c_8(dac_data_c_8), .dac_data_c_7(dac_data_c_7), 
        .dac_data_c_6(dac_data_c_6), .dac_data_c_5(dac_data_c_5), .dac_data_c_4(dac_data_c_4), 
        .dac_data_c_3(dac_data_c_3), .dac_data_c_2(dac_data_c_2), .dac_data_c_1(dac_data_c_1), 
        .VCC_net(VCC_net)) /* synthesis syn_module_defined=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(212[6] 218[3])
    LUT4 i26_2_lut_rep_17 (.A(curr_wave_st[1]), .B(curr_wave_st[2]), .Z(n1651)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;
    defparam i26_2_lut_rep_17.init = 16'h6666;
    LUT4 n452_bdd_4_lut (.A(n1654), .B(curr_wave_st[2]), .C(n1653), .D(curr_wave_st[0]), 
         .Z(n1634)) /* synthesis lut_function=(A ((C (D)+!C !(D))+!B)+!A (B)) */ ;
    defparam n452_bdd_4_lut.init = 16'he66e;
    LUT4 i1062_3_lut_4_lut_then_4_lut (.A(n1653), .B(n1708), .C(curr_wave_st[0]), 
         .D(curr_wave_st[2]), .Z(n1656)) /* synthesis lut_function=(!(A (B (C (D)))+!A !((D)+!B))) */ ;
    defparam i1062_3_lut_4_lut_then_4_lut.init = 16'h7fbb;
    LUT4 key_pulse_0__bdd_3_lut_1083 (.A(curr_wave_st[2]), .B(curr_wave_st[0]), 
         .C(curr_wave_st[1]), .Z(n1618)) /* synthesis lut_function=(!(A (B+!(C))+!A !(B (C)))) */ ;
    defparam key_pulse_0__bdd_3_lut_1083.init = 16'h6060;
    LUT4 i21_3_lut_rep_14_4_lut_3_lut (.A(curr_wave_st[2]), .B(curr_wave_st[1]), 
         .C(curr_wave_st[0]), .Z(n1648)) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(B (C)))) */ ;
    defparam i21_3_lut_rep_14_4_lut_3_lut.init = 16'h6868;
    LUT4 i1042_2_lut (.A(curr_enc_st[0]), .B(led_out_c_4), .Z(dds_fm_step_31__N_186)) /* synthesis lut_function=(!(A+!(B))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(121[5:17])
    defparam i1042_2_lut.init = 16'h4444;
    LUT4 i1040_2_lut (.A(curr_enc_st[0]), .B(led_out_c_4), .Z(dds_am_factor_7__N_231)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(128[17:29])
    defparam i1040_2_lut.init = 16'h2222;
    LUT4 i1056_2_lut_rep_20 (.A(key_sec_pre[0]), .B(key_sec[0]), .Z(n1654)) /* synthesis lut_function=((B)+!A) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(59[11] 62[40])
    defparam i1056_2_lut_rep_20.init = 16'hdddd;
    LUT4 i672_2_lut_rep_8_2_lut_3_lut_4_lut (.A(key_sec_pre[0]), .B(key_sec[0]), 
         .C(key_sec[1]), .D(key_sec_pre[1]), .Z(n1642)) /* synthesis lut_function=(!(A (B (C+!(D)))+!A (C+!(D)))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(59[11] 62[40])
    defparam i672_2_lut_rep_8_2_lut_3_lut_4_lut.init = 16'h2f22;
    VLO i1 (.Z(GND_net));
    PFUMX i1086 (.BLUT(n1655), .ALUT(n1656), .C0(n1654), .Z(led_out_2__N_6));
    \button(N=2'b10)  u_button (.clk_c(clk_c), .key_sec_pre({key_sec_pre}), 
            .key_sec({key_sec}), .key_c_0(key_c_0), .GND_net(GND_net), 
            .key_c_1(key_c_1), .n1653(n1653), .\curr_wave_st[0] (curr_wave_st[0]), 
            .n1654(n1654), .n1649(n1649), .n1647(n1647)) /* synthesis syn_module_defined=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(163[26] 168[6])
    dds_pll u_dds_pll (.clk_c(clk_c), .dac_clk_c(dac_clk_c), .GND_net(GND_net)) /* synthesis NGD_DRC_MASK=1, syn_module_defined=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(207[10:52])
    OB dac_data_pad_5 (.I(dac_data_c_5), .O(dac_data[5]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    OB dac_data_pad_4 (.I(dac_data_c_4), .O(dac_data[4]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    OB dac_data_pad_3 (.I(dac_data_c_3), .O(dac_data[3]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    OB dac_data_pad_2 (.I(dac_data_c_2), .O(dac_data[2]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    OB dac_data_pad_1 (.I(dac_data_c_1), .O(dac_data[1]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    OB dac_data_pad_0 (.I(dac_data_c_0), .O(dac_data[0]));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(10[19:27])
    OB dac_clk_pad (.I(dac_clk_c), .O(dac_clk));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(11[13:20])
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
    IB enc_a_pad (.I(enc_a), .O(enc_a_c));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(6[19:24])
    IB enc_b_pad (.I(enc_b), .O(enc_b_c));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(7[19:24])
    IB enc_ok_pad (.I(enc_ok), .O(enc_ok_c));   // c:/users/10798/desktop/fpga/dds_demo02/main.v(8[19:25])
    dds_am u_dds_am (.dds_am_factor({dds_am_factor}), .clk_c(clk_c), .dds_am_factor_7__N_231(dds_am_factor_7__N_231), 
           .enc_pulse_r(enc_pulse_r), .enc_pulse_l(enc_pulse_l), .GND_net(GND_net)) /* synthesis syn_module_defined=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(195[9] 202[3])
    
endmodule
//
// Verilog Description of module dds_fm
//

module dds_fm (enc_pulse_r, enc_pulse_l, dds_fm_step, GND_net, clk_c, 
            dds_fm_step_31__N_186) /* synthesis syn_module_defined=1 */ ;
    input enc_pulse_r;
    input enc_pulse_l;
    output [31:0]dds_fm_step;
    input GND_net;
    input clk_c;
    input dds_fm_step_31__N_186;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(3[8:11])
    
    wire n1346;
    wire [31:0]dds_fm_step_31__N_187;
    
    wire n1347, n1354, n1355, n1353, n1352, n1359, n1360, n1351, 
        n1358, n1350, n1361, n1349, n1357, n1356, n1348;
    
    CCU2D add_216_3 (.A0(enc_pulse_r), .B0(enc_pulse_l), .C0(dds_fm_step[1]), 
          .D0(GND_net), .A1(enc_pulse_r), .B1(enc_pulse_l), .C1(dds_fm_step[2]), 
          .D1(GND_net), .CIN(n1346), .COUT(n1347), .S0(dds_fm_step_31__N_187[1]), 
          .S1(dds_fm_step_31__N_187[2]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_3.INIT0 = 16'hd2d2;
    defparam add_216_3.INIT1 = 16'hd2d2;
    defparam add_216_3.INJECT1_0 = "NO";
    defparam add_216_3.INJECT1_1 = "NO";
    FD1P3AY dds_fm_step_i0 (.D(dds_fm_step_31__N_187[0]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i0.GSR = "ENABLED";
    CCU2D add_216_19 (.A0(dds_fm_step[17]), .B0(enc_pulse_l), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[18]), .B1(enc_pulse_l), .C1(GND_net), 
          .D1(GND_net), .CIN(n1354), .COUT(n1355), .S0(dds_fm_step_31__N_187[17]), 
          .S1(dds_fm_step_31__N_187[18]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_19.INIT0 = 16'h5666;
    defparam add_216_19.INIT1 = 16'h5666;
    defparam add_216_19.INJECT1_0 = "NO";
    defparam add_216_19.INJECT1_1 = "NO";
    CCU2D add_216_17 (.A0(dds_fm_step[15]), .B0(enc_pulse_l), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[16]), .B1(enc_pulse_l), .C1(GND_net), 
          .D1(GND_net), .CIN(n1353), .COUT(n1354), .S0(dds_fm_step_31__N_187[15]), 
          .S1(dds_fm_step_31__N_187[16]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_17.INIT0 = 16'h5666;
    defparam add_216_17.INIT1 = 16'h5666;
    defparam add_216_17.INJECT1_0 = "NO";
    defparam add_216_17.INJECT1_1 = "NO";
    FD1P3AX dds_fm_step_i31 (.D(dds_fm_step_31__N_187[31]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[31])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i31.GSR = "ENABLED";
    CCU2D add_216_15 (.A0(dds_fm_step[13]), .B0(enc_pulse_l), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[14]), .B1(enc_pulse_l), .C1(GND_net), 
          .D1(GND_net), .CIN(n1352), .COUT(n1353), .S0(dds_fm_step_31__N_187[13]), 
          .S1(dds_fm_step_31__N_187[14]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_15.INIT0 = 16'h5666;
    defparam add_216_15.INIT1 = 16'h5666;
    defparam add_216_15.INJECT1_0 = "NO";
    defparam add_216_15.INJECT1_1 = "NO";
    CCU2D add_216_1 (.A0(enc_pulse_l), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(enc_pulse_r), .B1(enc_pulse_l), .C1(dds_fm_step[0]), .D1(GND_net), 
          .COUT(n1346), .S1(dds_fm_step_31__N_187[0]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_1.INIT0 = 16'h5000;
    defparam add_216_1.INIT1 = 16'hd2d2;
    defparam add_216_1.INJECT1_0 = "NO";
    defparam add_216_1.INJECT1_1 = "NO";
    CCU2D add_216_29 (.A0(dds_fm_step[27]), .B0(enc_pulse_l), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[28]), .B1(enc_pulse_l), .C1(GND_net), 
          .D1(GND_net), .CIN(n1359), .COUT(n1360), .S0(dds_fm_step_31__N_187[27]), 
          .S1(dds_fm_step_31__N_187[28]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_29.INIT0 = 16'h5666;
    defparam add_216_29.INIT1 = 16'h5666;
    defparam add_216_29.INJECT1_0 = "NO";
    defparam add_216_29.INJECT1_1 = "NO";
    CCU2D add_216_13 (.A0(dds_fm_step[11]), .B0(enc_pulse_l), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[12]), .B1(enc_pulse_l), .C1(GND_net), 
          .D1(GND_net), .CIN(n1351), .COUT(n1352), .S0(dds_fm_step_31__N_187[11]), 
          .S1(dds_fm_step_31__N_187[12]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_13.INIT0 = 16'h5666;
    defparam add_216_13.INIT1 = 16'h5666;
    defparam add_216_13.INJECT1_0 = "NO";
    defparam add_216_13.INJECT1_1 = "NO";
    FD1P3AX dds_fm_step_i30 (.D(dds_fm_step_31__N_187[30]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[30])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i30.GSR = "ENABLED";
    FD1P3AX dds_fm_step_i29 (.D(dds_fm_step_31__N_187[29]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[29])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i29.GSR = "ENABLED";
    FD1P3AX dds_fm_step_i28 (.D(dds_fm_step_31__N_187[28]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[28])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i28.GSR = "ENABLED";
    FD1P3AX dds_fm_step_i27 (.D(dds_fm_step_31__N_187[27]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[27])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i27.GSR = "ENABLED";
    FD1P3AX dds_fm_step_i26 (.D(dds_fm_step_31__N_187[26]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[26])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i26.GSR = "ENABLED";
    FD1P3AX dds_fm_step_i25 (.D(dds_fm_step_31__N_187[25]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[25])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i25.GSR = "ENABLED";
    FD1P3AX dds_fm_step_i24 (.D(dds_fm_step_31__N_187[24]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[24])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i24.GSR = "ENABLED";
    FD1P3AX dds_fm_step_i23 (.D(dds_fm_step_31__N_187[23]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[23])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i23.GSR = "ENABLED";
    FD1P3AX dds_fm_step_i22 (.D(dds_fm_step_31__N_187[22]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[22])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i22.GSR = "ENABLED";
    FD1P3AX dds_fm_step_i21 (.D(dds_fm_step_31__N_187[21]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[21])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i21.GSR = "ENABLED";
    FD1P3AX dds_fm_step_i20 (.D(dds_fm_step_31__N_187[20]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[20])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i20.GSR = "ENABLED";
    FD1P3AX dds_fm_step_i19 (.D(dds_fm_step_31__N_187[19]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[19])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i19.GSR = "ENABLED";
    FD1P3AX dds_fm_step_i18 (.D(dds_fm_step_31__N_187[18]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[18])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i18.GSR = "ENABLED";
    FD1P3AX dds_fm_step_i17 (.D(dds_fm_step_31__N_187[17]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[17])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i17.GSR = "ENABLED";
    FD1P3AX dds_fm_step_i16 (.D(dds_fm_step_31__N_187[16]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[16])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i16.GSR = "ENABLED";
    FD1P3AY dds_fm_step_i15 (.D(dds_fm_step_31__N_187[15]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[15])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i15.GSR = "ENABLED";
    FD1P3AY dds_fm_step_i14 (.D(dds_fm_step_31__N_187[14]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[14])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i14.GSR = "ENABLED";
    FD1P3AY dds_fm_step_i13 (.D(dds_fm_step_31__N_187[13]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[13])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i13.GSR = "ENABLED";
    FD1P3AY dds_fm_step_i12 (.D(dds_fm_step_31__N_187[12]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[12])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i12.GSR = "ENABLED";
    FD1P3AY dds_fm_step_i11 (.D(dds_fm_step_31__N_187[11]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[11])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i11.GSR = "ENABLED";
    FD1P3AY dds_fm_step_i10 (.D(dds_fm_step_31__N_187[10]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[10])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i10.GSR = "ENABLED";
    FD1P3AY dds_fm_step_i9 (.D(dds_fm_step_31__N_187[9]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[9])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i9.GSR = "ENABLED";
    FD1P3AY dds_fm_step_i8 (.D(dds_fm_step_31__N_187[8]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[8])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i8.GSR = "ENABLED";
    FD1P3AY dds_fm_step_i7 (.D(dds_fm_step_31__N_187[7]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[7])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i7.GSR = "ENABLED";
    FD1P3AY dds_fm_step_i6 (.D(dds_fm_step_31__N_187[6]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[6])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i6.GSR = "ENABLED";
    CCU2D add_216_27 (.A0(dds_fm_step[25]), .B0(enc_pulse_l), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[26]), .B1(enc_pulse_l), .C1(GND_net), 
          .D1(GND_net), .CIN(n1358), .COUT(n1359), .S0(dds_fm_step_31__N_187[25]), 
          .S1(dds_fm_step_31__N_187[26]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_27.INIT0 = 16'h5666;
    defparam add_216_27.INIT1 = 16'h5666;
    defparam add_216_27.INJECT1_0 = "NO";
    defparam add_216_27.INJECT1_1 = "NO";
    FD1P3AY dds_fm_step_i5 (.D(dds_fm_step_31__N_187[5]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[5])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i5.GSR = "ENABLED";
    FD1P3AY dds_fm_step_i4 (.D(dds_fm_step_31__N_187[4]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[4])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i4.GSR = "ENABLED";
    FD1P3AY dds_fm_step_i3 (.D(dds_fm_step_31__N_187[3]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[3])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i3.GSR = "ENABLED";
    FD1P3AY dds_fm_step_i2 (.D(dds_fm_step_31__N_187[2]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[2])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i2.GSR = "ENABLED";
    FD1P3AY dds_fm_step_i1 (.D(dds_fm_step_31__N_187[1]), .SP(dds_fm_step_31__N_186), 
            .CK(clk_c), .Q(dds_fm_step[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=184, LSE_RLINE=191 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(20[3] 30[10])
    defparam dds_fm_step_i1.GSR = "ENABLED";
    CCU2D add_216_11 (.A0(dds_fm_step[9]), .B0(enc_pulse_l), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[10]), .B1(enc_pulse_l), .C1(GND_net), 
          .D1(GND_net), .CIN(n1350), .COUT(n1351), .S0(dds_fm_step_31__N_187[9]), 
          .S1(dds_fm_step_31__N_187[10]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_11.INIT0 = 16'h5666;
    defparam add_216_11.INIT1 = 16'h5666;
    defparam add_216_11.INJECT1_0 = "NO";
    defparam add_216_11.INJECT1_1 = "NO";
    CCU2D add_216_33 (.A0(dds_fm_step[31]), .B0(enc_pulse_l), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1361), .S0(dds_fm_step_31__N_187[31]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_33.INIT0 = 16'h5666;
    defparam add_216_33.INIT1 = 16'h0000;
    defparam add_216_33.INJECT1_0 = "NO";
    defparam add_216_33.INJECT1_1 = "NO";
    CCU2D add_216_9 (.A0(enc_pulse_r), .B0(enc_pulse_l), .C0(dds_fm_step[7]), 
          .D0(GND_net), .A1(dds_fm_step[8]), .B1(enc_pulse_l), .C1(GND_net), 
          .D1(GND_net), .CIN(n1349), .COUT(n1350), .S0(dds_fm_step_31__N_187[7]), 
          .S1(dds_fm_step_31__N_187[8]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_9.INIT0 = 16'hd2d2;
    defparam add_216_9.INIT1 = 16'h5666;
    defparam add_216_9.INJECT1_0 = "NO";
    defparam add_216_9.INJECT1_1 = "NO";
    CCU2D add_216_25 (.A0(dds_fm_step[23]), .B0(enc_pulse_l), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[24]), .B1(enc_pulse_l), .C1(GND_net), 
          .D1(GND_net), .CIN(n1357), .COUT(n1358), .S0(dds_fm_step_31__N_187[23]), 
          .S1(dds_fm_step_31__N_187[24]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_25.INIT0 = 16'h5666;
    defparam add_216_25.INIT1 = 16'h5666;
    defparam add_216_25.INJECT1_0 = "NO";
    defparam add_216_25.INJECT1_1 = "NO";
    CCU2D add_216_23 (.A0(dds_fm_step[21]), .B0(enc_pulse_l), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[22]), .B1(enc_pulse_l), .C1(GND_net), 
          .D1(GND_net), .CIN(n1356), .COUT(n1357), .S0(dds_fm_step_31__N_187[21]), 
          .S1(dds_fm_step_31__N_187[22]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_23.INIT0 = 16'h5666;
    defparam add_216_23.INIT1 = 16'h5666;
    defparam add_216_23.INJECT1_0 = "NO";
    defparam add_216_23.INJECT1_1 = "NO";
    CCU2D add_216_7 (.A0(enc_pulse_r), .B0(enc_pulse_l), .C0(dds_fm_step[5]), 
          .D0(GND_net), .A1(enc_pulse_r), .B1(enc_pulse_l), .C1(dds_fm_step[6]), 
          .D1(GND_net), .CIN(n1348), .COUT(n1349), .S0(dds_fm_step_31__N_187[5]), 
          .S1(dds_fm_step_31__N_187[6]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_7.INIT0 = 16'hd2d2;
    defparam add_216_7.INIT1 = 16'hd2d2;
    defparam add_216_7.INJECT1_0 = "NO";
    defparam add_216_7.INJECT1_1 = "NO";
    CCU2D add_216_5 (.A0(enc_pulse_r), .B0(enc_pulse_l), .C0(dds_fm_step[3]), 
          .D0(GND_net), .A1(enc_pulse_r), .B1(enc_pulse_l), .C1(dds_fm_step[4]), 
          .D1(GND_net), .CIN(n1347), .COUT(n1348), .S0(dds_fm_step_31__N_187[3]), 
          .S1(dds_fm_step_31__N_187[4]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_5.INIT0 = 16'hd2d2;
    defparam add_216_5.INIT1 = 16'hd2d2;
    defparam add_216_5.INJECT1_0 = "NO";
    defparam add_216_5.INJECT1_1 = "NO";
    CCU2D add_216_21 (.A0(dds_fm_step[19]), .B0(enc_pulse_l), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[20]), .B1(enc_pulse_l), .C1(GND_net), 
          .D1(GND_net), .CIN(n1355), .COUT(n1356), .S0(dds_fm_step_31__N_187[19]), 
          .S1(dds_fm_step_31__N_187[20]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_21.INIT0 = 16'h5666;
    defparam add_216_21.INIT1 = 16'h5666;
    defparam add_216_21.INJECT1_0 = "NO";
    defparam add_216_21.INJECT1_1 = "NO";
    CCU2D add_216_31 (.A0(dds_fm_step[29]), .B0(enc_pulse_l), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[30]), .B1(enc_pulse_l), .C1(GND_net), 
          .D1(GND_net), .CIN(n1360), .COUT(n1361), .S0(dds_fm_step_31__N_187[29]), 
          .S1(dds_fm_step_31__N_187[30]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_fm.v(24[10] 27[33])
    defparam add_216_31.INIT0 = 16'h5666;
    defparam add_216_31.INIT1 = 16'h5666;
    defparam add_216_31.INJECT1_0 = "NO";
    defparam add_216_31.INJECT1_1 = "NO";
    
endmodule
//
// Verilog Description of module encoder
//

module encoder (GND_net, clk_c, enc_a_c, enc_pulse_l, enc_ok_c, enc_b_c, 
            n460, \curr_enc_st[0] , led_out_4__N_5, n1645, \next_enc_st[1] , 
            enc_pulse_r) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input clk_c;
    input enc_a_c;
    output enc_pulse_l;
    input enc_ok_c;
    input enc_b_c;
    input n460;
    input \curr_enc_st[0] ;
    output led_out_4__N_5;
    output n1645;
    output \next_enc_st[1] ;
    output enc_pulse_r;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(3[8:11])
    wire [5:0]cnt_20ms;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(23[14:22])
    
    wire n1650;
    wire [5:0]n53;
    
    wire n1372;
    wire [12:0]cnt;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(15[15:18])
    wire [12:0]n1;
    
    wire n1373, n1371, key_ok_r1, key_ok_r, A_state_reg, A_state, 
        key_a_r, cnt_20ms_5__N_129, n1017, n989;
    wire [5:0]n20;
    
    wire key_b_r1, key_b_r, clk_c_enable_2, key_a_r1, n1646, n1531, 
        cnt_12__N_122, n1525, n1527, n1376, n1375, Left_pulse_N_130, 
        n1374, Left_pulse_N_132, n1446, n4, n6, n5;
    
    LUT4 i271_2_lut_3_lut_4_lut (.A(cnt_20ms[2]), .B(n1650), .C(cnt_20ms[4]), 
         .D(cnt_20ms[3]), .Z(n53[4])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(48[16:31])
    defparam i271_2_lut_3_lut_4_lut.init = 16'h78f0;
    CCU2D cnt_221_add_4_5 (.A0(cnt[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n1372), 
          .COUT(n1373), .S0(n1[3]), .S1(n1[4]));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221_add_4_5.INIT0 = 16'hfaaa;
    defparam cnt_221_add_4_5.INIT1 = 16'hfaaa;
    defparam cnt_221_add_4_5.INJECT1_0 = "NO";
    defparam cnt_221_add_4_5.INJECT1_1 = "NO";
    CCU2D cnt_221_add_4_3 (.A0(cnt[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n1371), 
          .COUT(n1372), .S0(n1[1]), .S1(n1[2]));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221_add_4_3.INIT0 = 16'hfaaa;
    defparam cnt_221_add_4_3.INIT1 = 16'hfaaa;
    defparam cnt_221_add_4_3.INJECT1_0 = "NO";
    defparam cnt_221_add_4_3.INJECT1_1 = "NO";
    FD1S3AY key_ok_r1_62 (.D(key_ok_r), .CK(clk_c), .Q(key_ok_r1)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=8, LSE_LLINE=171, LSE_RLINE=180 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(58[7:29])
    defparam key_ok_r1_62.GSR = "ENABLED";
    FD1S3AY A_state_reg_63 (.D(A_state), .CK(clk_c), .Q(A_state_reg)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=8, LSE_LLINE=171, LSE_RLINE=180 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(69[7:30])
    defparam A_state_reg_63.GSR = "ENABLED";
    FD1P3AY key_a_r_56 (.D(enc_a_c), .SP(cnt_20ms_5__N_129), .CK(clk_c), 
            .Q(key_a_r));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam key_a_r_56.GSR = "ENABLED";
    FD1S3AX Left_pulse_65 (.D(n1017), .CK(clk_c), .Q(enc_pulse_l)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=8, LSE_LLINE=171, LSE_RLINE=180 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(81[11] 88[5])
    defparam Left_pulse_65.GSR = "ENABLED";
    LUT4 i581_3_lut_4_lut (.A(enc_pulse_l), .B(A_state), .C(n989), .D(A_state_reg), 
         .Z(n1017)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B !(C (D)))+!A (((D)+!C)+!B))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(81[11] 88[5])
    defparam i581_3_lut_4_lut.init = 16'h20c0;
    CCU2D cnt_221_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n1371), 
          .S1(n1[0]));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221_add_4_1.INIT0 = 16'hF000;
    defparam cnt_221_add_4_1.INIT1 = 16'h0555;
    defparam cnt_221_add_4_1.INJECT1_0 = "NO";
    defparam cnt_221_add_4_1.INJECT1_1 = "NO";
    FD1S3AY cnt_20ms__i0 (.D(n20[0]), .CK(clk_c), .Q(cnt_20ms[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=8, LSE_LLINE=171, LSE_RLINE=180 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam cnt_20ms__i0.GSR = "ENABLED";
    FD1P3AY key_b_r1_59 (.D(key_b_r), .SP(cnt_20ms_5__N_129), .CK(clk_c), 
            .Q(key_b_r1));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam key_b_r1_59.GSR = "ENABLED";
    FD1P3AY key_ok_r_61 (.D(enc_ok_c), .SP(clk_c_enable_2), .CK(clk_c), 
            .Q(key_ok_r));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam key_ok_r_61.GSR = "ENABLED";
    FD1P3AY key_b_r_58 (.D(enc_b_c), .SP(cnt_20ms_5__N_129), .CK(clk_c), 
            .Q(key_b_r));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam key_b_r_58.GSR = "ENABLED";
    FD1P3AY key_a_r1_57 (.D(key_a_r), .SP(cnt_20ms_5__N_129), .CK(clk_c), 
            .Q(key_a_r1));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam key_a_r1_57.GSR = "ENABLED";
    LUT4 i278_3_lut_4_lut (.A(cnt_20ms[3]), .B(n1646), .C(cnt_20ms[4]), 
         .D(cnt_20ms[5]), .Z(n53[5])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(48[16:31])
    defparam i278_3_lut_4_lut.init = 16'h7f80;
    LUT4 i2_3_lut (.A(enc_a_c), .B(key_a_r), .C(key_a_r1), .Z(A_state)) /* synthesis lut_function=(A (B (C))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(61[17:45])
    defparam i2_3_lut.init = 16'h8080;
    LUT4 i1050_4_lut (.A(cnt[7]), .B(cnt[4]), .C(cnt[11]), .D(n1531), 
         .Z(cnt_20ms_5__N_129)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[14:32])
    defparam i1050_4_lut.init = 16'h0100;
    FD1S3IX cnt_221__i0 (.D(n1[0]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[0])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221__i0.GSR = "ENABLED";
    LUT4 i252_2_lut_rep_16 (.A(cnt_20ms[1]), .B(cnt_20ms[0]), .Z(n1650)) /* synthesis lut_function=(A (B)) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(48[16:31])
    defparam i252_2_lut_rep_16.init = 16'h8888;
    LUT4 i1001_4_lut (.A(n1525), .B(cnt[6]), .C(n1527), .D(cnt[1]), 
         .Z(n1531)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i1001_4_lut.init = 16'h8000;
    LUT4 i259_2_lut_rep_12_3_lut (.A(cnt_20ms[1]), .B(cnt_20ms[0]), .C(cnt_20ms[2]), 
         .Z(n1646)) /* synthesis lut_function=(A (B (C))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(48[16:31])
    defparam i259_2_lut_rep_12_3_lut.init = 16'h8080;
    LUT4 i995_4_lut (.A(cnt[0]), .B(cnt[8]), .C(cnt[12]), .D(cnt[3]), 
         .Z(n1525)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i995_4_lut.init = 16'h8000;
    LUT4 i997_4_lut (.A(cnt[9]), .B(cnt[10]), .C(cnt[5]), .D(cnt[2]), 
         .Z(n1527)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i997_4_lut.init = 16'h8000;
    FD1S3IX cnt_221__i12 (.D(n1[12]), .CK(clk_c), .CD(cnt_12__N_122), 
            .Q(cnt[12])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221__i12.GSR = "ENABLED";
    FD1S3IX cnt_221__i11 (.D(n1[11]), .CK(clk_c), .CD(cnt_12__N_122), 
            .Q(cnt[11])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221__i11.GSR = "ENABLED";
    FD1S3IX cnt_221__i10 (.D(n1[10]), .CK(clk_c), .CD(cnt_12__N_122), 
            .Q(cnt[10])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221__i10.GSR = "ENABLED";
    FD1S3IX cnt_221__i9 (.D(n1[9]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[9])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221__i9.GSR = "ENABLED";
    FD1S3IX cnt_221__i8 (.D(n1[8]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[8])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221__i8.GSR = "ENABLED";
    FD1S3IX cnt_221__i7 (.D(n1[7]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[7])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221__i7.GSR = "ENABLED";
    FD1S3IX cnt_221__i6 (.D(n1[6]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[6])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221__i6.GSR = "ENABLED";
    FD1S3IX cnt_221__i5 (.D(n1[5]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[5])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221__i5.GSR = "ENABLED";
    FD1S3IX cnt_221__i4 (.D(n1[4]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[4])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221__i4.GSR = "ENABLED";
    FD1S3IX cnt_221__i3 (.D(n1[3]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[3])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221__i3.GSR = "ENABLED";
    FD1S3IX cnt_221__i2 (.D(n1[2]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[2])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221__i2.GSR = "ENABLED";
    FD1S3IX cnt_221__i1 (.D(n1[1]), .CK(clk_c), .CD(cnt_12__N_122), .Q(cnt[1])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221__i1.GSR = "ENABLED";
    CCU2D cnt_221_add_4_13 (.A0(cnt[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt[12]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1376), .S0(n1[11]), .S1(n1[12]));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221_add_4_13.INIT0 = 16'hfaaa;
    defparam cnt_221_add_4_13.INIT1 = 16'hfaaa;
    defparam cnt_221_add_4_13.INJECT1_0 = "NO";
    defparam cnt_221_add_4_13.INJECT1_1 = "NO";
    CCU2D cnt_221_add_4_11 (.A0(cnt[9]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n1375), 
          .COUT(n1376), .S0(n1[9]), .S1(n1[10]));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221_add_4_11.INIT0 = 16'hfaaa;
    defparam cnt_221_add_4_11.INIT1 = 16'hfaaa;
    defparam cnt_221_add_4_11.INJECT1_0 = "NO";
    defparam cnt_221_add_4_11.INJECT1_1 = "NO";
    FD1P3IX cnt_20ms__i5 (.D(n53[5]), .SP(cnt_20ms_5__N_129), .CD(clk_c_enable_2), 
            .CK(clk_c), .Q(cnt_20ms[5])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=8, LSE_LLINE=171, LSE_RLINE=180 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam cnt_20ms__i5.GSR = "ENABLED";
    LUT4 i257_2_lut_3_lut (.A(cnt_20ms[1]), .B(cnt_20ms[0]), .C(cnt_20ms[2]), 
         .Z(n53[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(48[16:31])
    defparam i257_2_lut_3_lut.init = 16'h7878;
    LUT4 i1046_3_lut (.A(A_state), .B(n989), .C(A_state_reg), .Z(Left_pulse_N_130)) /* synthesis lut_function=(((C)+!B)+!A) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(62[17:45])
    defparam i1046_3_lut.init = 16'hf7f7;
    LUT4 i264_2_lut_3_lut_4_lut (.A(cnt_20ms[1]), .B(cnt_20ms[0]), .C(cnt_20ms[3]), 
         .D(cnt_20ms[2]), .Z(n53[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(48[16:31])
    defparam i264_2_lut_3_lut_4_lut.init = 16'h78f0;
    CCU2D cnt_221_add_4_9 (.A0(cnt[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n1374), 
          .COUT(n1375), .S0(n1[7]), .S1(n1[8]));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221_add_4_9.INIT0 = 16'hfaaa;
    defparam cnt_221_add_4_9.INIT1 = 16'hfaaa;
    defparam cnt_221_add_4_9.INJECT1_0 = "NO";
    defparam cnt_221_add_4_9.INJECT1_1 = "NO";
    FD1P3IX cnt_20ms__i4 (.D(n53[4]), .SP(cnt_20ms_5__N_129), .CD(clk_c_enable_2), 
            .CK(clk_c), .Q(cnt_20ms[4])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=8, LSE_LLINE=171, LSE_RLINE=180 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam cnt_20ms__i4.GSR = "ENABLED";
    FD1P3IX cnt_20ms__i3 (.D(n53[3]), .SP(cnt_20ms_5__N_129), .CD(clk_c_enable_2), 
            .CK(clk_c), .Q(cnt_20ms[3])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=8, LSE_LLINE=171, LSE_RLINE=180 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam cnt_20ms__i3.GSR = "ENABLED";
    FD1P3IX cnt_20ms__i2 (.D(n53[2]), .SP(cnt_20ms_5__N_129), .CD(clk_c_enable_2), 
            .CK(clk_c), .Q(cnt_20ms[2])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=8, LSE_LLINE=171, LSE_RLINE=180 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam cnt_20ms__i2.GSR = "ENABLED";
    FD1P3IX cnt_20ms__i1 (.D(n53[1]), .SP(cnt_20ms_5__N_129), .CD(clk_c_enable_2), 
            .CK(clk_c), .Q(cnt_20ms[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=11, LSE_RCOL=8, LSE_LLINE=171, LSE_RLINE=180 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam cnt_20ms__i1.GSR = "ENABLED";
    LUT4 i2_3_lut_adj_7 (.A(A_state), .B(n989), .C(A_state_reg), .Z(Left_pulse_N_132)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(62[17:45])
    defparam i2_3_lut_adj_7.init = 16'h4040;
    LUT4 i2_3_lut_adj_8 (.A(enc_b_c), .B(key_b_r), .C(key_b_r1), .Z(n989)) /* synthesis lut_function=(A (B (C))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(62[17:45])
    defparam i2_3_lut_adj_8.init = 16'h8080;
    LUT4 i250_2_lut (.A(cnt_20ms[1]), .B(cnt_20ms[0]), .Z(n53[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(48[16:31])
    defparam i250_2_lut.init = 16'h6666;
    LUT4 equal_170_i4_1_lut_3_lut_4_lut_3_lut_4_lut (.A(key_ok_r1), .B(key_ok_r), 
         .C(n460), .D(\curr_enc_st[0] ), .Z(led_out_4__N_5)) /* synthesis lut_function=(A (B (C (D))+!B !((D)+!C))+!A (C (D))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(63[19:43])
    defparam equal_170_i4_1_lut_3_lut_4_lut_3_lut_4_lut.init = 16'hd020;
    LUT4 i3_4_lut (.A(cnt[0]), .B(cnt[3]), .C(cnt[2]), .D(cnt[1]), .Z(n1446)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i3_4_lut.init = 16'h8000;
    LUT4 i1_3_lut (.A(cnt[5]), .B(n1446), .C(cnt[4]), .Z(n4)) /* synthesis lut_function=(A (B+(C))) */ ;
    defparam i1_3_lut.init = 16'ha8a8;
    LUT4 i674_3_lut_rep_11_4_lut (.A(key_ok_r1), .B(key_ok_r), .C(\curr_enc_st[0] ), 
         .D(n460), .Z(n1645)) /* synthesis lut_function=(A (B (C (D))+!B !(C+!(D)))+!A (C (D))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(63[19:43])
    defparam i674_3_lut_rep_11_4_lut.init = 16'hd200;
    LUT4 i2_2_lut (.A(cnt[10]), .B(cnt[8]), .Z(n6)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2_2_lut.init = 16'h8888;
    LUT4 i1_4_lut (.A(cnt[6]), .B(cnt[9]), .C(cnt[7]), .D(n4), .Z(n5)) /* synthesis lut_function=(A (B (C+(D)))+!A (B (C))) */ ;
    defparam i1_4_lut.init = 16'hc8c0;
    LUT4 i403_4_lut (.A(n5), .B(cnt[12]), .C(cnt[11]), .D(n6), .Z(cnt_12__N_122)) /* synthesis lut_function=(A (B (C+(D)))+!A (B (C))) */ ;
    defparam i403_4_lut.init = 16'hc8c0;
    LUT4 i2_3_lut_rep_9_4_lut_3_lut_4_lut (.A(key_ok_r1), .B(key_ok_r), 
         .C(n460), .D(\curr_enc_st[0] ), .Z(\next_enc_st[1] )) /* synthesis lut_function=(!(A (B (C (D))+!B !((D)+!C))+!A (C (D)))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(63[19:43])
    defparam i2_3_lut_rep_9_4_lut_3_lut_4_lut.init = 16'h2fdf;
    LUT4 i689_3_lut (.A(cnt_20ms[0]), .B(clk_c_enable_2), .C(cnt_20ms_5__N_129), 
         .Z(n20[0])) /* synthesis lut_function=(!(A (B+(C))+!A (B+!(C)))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(39[11] 51[5])
    defparam i689_3_lut.init = 16'h1212;
    LUT4 i2_4_lut (.A(cnt_20ms[3]), .B(cnt_20ms[5]), .C(cnt_20ms[4]), 
         .D(cnt_20ms_5__N_129), .Z(clk_c_enable_2)) /* synthesis lut_function=(A (B (D))+!A (B (C (D)))) */ ;
    defparam i2_4_lut.init = 16'hc800;
    FD1P3AX Right_pulse_64 (.D(Left_pulse_N_132), .SP(Left_pulse_N_130), 
            .CK(clk_c), .Q(enc_pulse_r));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(81[11] 88[5])
    defparam Right_pulse_64.GSR = "ENABLED";
    CCU2D cnt_221_add_4_7 (.A0(cnt[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n1373), 
          .COUT(n1374), .S0(n1[5]), .S1(n1[6]));   // c:/users/10798/desktop/fpga/dds_demo02/encoder.v(20[14:24])
    defparam cnt_221_add_4_7.INIT0 = 16'hfaaa;
    defparam cnt_221_add_4_7.INIT1 = 16'hfaaa;
    defparam cnt_221_add_4_7.INJECT1_0 = "NO";
    defparam cnt_221_add_4_7.INJECT1_1 = "NO";
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

//
// Verilog Description of module TSALL
// module not written out since it is a black-box. 
//

//
// Verilog Description of module dds
//

module dds (dds_fm_step, GND_net, dac_clk_c, dds_am_factor, dac_data_c_0, 
            \curr_wave_st[1] , dac_data_c_9, \curr_wave_st[0] , n1651, 
            dac_data_c_8, dac_data_c_7, dac_data_c_6, dac_data_c_5, 
            dac_data_c_4, dac_data_c_3, dac_data_c_2, dac_data_c_1, 
            VCC_net) /* synthesis syn_module_defined=1 */ ;
    input [31:0]dds_fm_step;
    input GND_net;
    input dac_clk_c;
    input [7:0]dds_am_factor;
    output dac_data_c_0;
    input \curr_wave_st[1] ;
    output dac_data_c_9;
    input \curr_wave_st[0] ;
    input n1651;
    output dac_data_c_8;
    output dac_data_c_7;
    output dac_data_c_6;
    output dac_data_c_5;
    output dac_data_c_4;
    output dac_data_c_3;
    output dac_data_c_2;
    output dac_data_c_1;
    input VCC_net;
    
    wire dac_clk_c /* synthesis SET_AS_NETWORK=dac_clk_c, is_clock=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(11[13:20])
    
    wire n1384;
    wire [31:0]n233;
    wire [31:0]n133;
    
    wire n1385;
    wire [9:0]ori_out;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(16[11:18])
    wire [9:0]ori_out_9__N_250;
    
    wire n1396;
    wire [8:0]n320;
    
    wire n279;
    wire [8:0]n321;
    
    wire n282;
    wire [17:0]am_out_17__N_240;
    
    wire n1397;
    wire [8:0]n318;
    
    wire n273;
    wire [8:0]n319;
    
    wire n276, n1383, n1433, n1432, n1431, n1430, n1429, n1393;
    wire [31:0]cnt;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(19[12:15])
    
    wire n1382, n1428, n1381, n1380;
    wire [17:0]am_out;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(14[12:18])
    
    wire n1379, n1427, n1426, n1425;
    wire [9:0]n374;
    
    wire n1392, n1424, n1423, n1422, n1421, n1420, n1419, n1418, 
        n1417, n1416, n1415, n1414, n1413, n285, n1412;
    wire [8:0]n322;
    
    wire n1411, n1410, n1409, n1408, n288, n1391, n1390, n1389, 
        n1388, n1387, n1407;
    wire [8:0]n323;
    
    wire n1406, n1405, n1404, n1403, n291, n1402, n1401, n1400, 
        n1399;
    wire [9:0]dds_out_sin_temp;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(23[12:28])
    
    wire n1398;
    wire [9:0]ori_out_9__N_296;
    
    wire n1386;
    
    CCU2D cnt_222_add_4_14 (.A0(dds_fm_step[12]), .B0(n233[12]), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[13]), .B1(n233[13]), .C1(GND_net), 
          .D1(GND_net), .CIN(n1384), .COUT(n1385), .S0(n133[12]), .S1(n133[13]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222_add_4_14.INIT0 = 16'h5666;
    defparam cnt_222_add_4_14.INIT1 = 16'h5666;
    defparam cnt_222_add_4_14.INJECT1_0 = "NO";
    defparam cnt_222_add_4_14.INJECT1_1 = "NO";
    FD1S3AX ori_out_i9 (.D(ori_out_9__N_250[9]), .CK(dac_clk_c), .Q(ori_out[9])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam ori_out_i9.GSR = "DISABLED";
    FD1S3AX ori_out_i8 (.D(ori_out_9__N_250[8]), .CK(dac_clk_c), .Q(ori_out[8])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam ori_out_i8.GSR = "DISABLED";
    FD1S3AX ori_out_i7 (.D(ori_out_9__N_250[7]), .CK(dac_clk_c), .Q(ori_out[7])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam ori_out_i7.GSR = "DISABLED";
    FD1S3AX ori_out_i6 (.D(ori_out_9__N_250[6]), .CK(dac_clk_c), .Q(ori_out[6])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam ori_out_i6.GSR = "DISABLED";
    FD1S3AX ori_out_i5 (.D(ori_out_9__N_250[5]), .CK(dac_clk_c), .Q(ori_out[5])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam ori_out_i5.GSR = "DISABLED";
    FD1S3AX ori_out_i4 (.D(ori_out_9__N_250[4]), .CK(dac_clk_c), .Q(ori_out[4])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam ori_out_i4.GSR = "DISABLED";
    FD1S3AX ori_out_i3 (.D(ori_out_9__N_250[3]), .CK(dac_clk_c), .Q(ori_out[3])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam ori_out_i3.GSR = "DISABLED";
    FD1S3AX ori_out_i2 (.D(ori_out_9__N_250[2]), .CK(dac_clk_c), .Q(ori_out[2])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam ori_out_i2.GSR = "DISABLED";
    FD1S3AX ori_out_i1 (.D(ori_out_9__N_250[1]), .CK(dac_clk_c), .Q(ori_out[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam ori_out_i1.GSR = "DISABLED";
    CCU2D ori_out_9__I_0_add_216_4 (.A0(n320[8]), .B0(n279), .C0(GND_net), 
          .D0(GND_net), .A1(n321[8]), .B1(n282), .C1(GND_net), .D1(GND_net), 
          .CIN(n1396), .COUT(n1397), .S0(am_out_17__N_240[12]), .S1(am_out_17__N_240[13]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_216_4.INIT0 = 16'h5666;
    defparam ori_out_9__I_0_add_216_4.INIT1 = 16'h5666;
    defparam ori_out_9__I_0_add_216_4.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_216_4.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_216_2 (.A0(n318[8]), .B0(n273), .C0(GND_net), 
          .D0(GND_net), .A1(n319[8]), .B1(n276), .C1(GND_net), .D1(GND_net), 
          .COUT(n1396), .S1(am_out_17__N_240[11]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_216_2.INIT0 = 16'h7000;
    defparam ori_out_9__I_0_add_216_2.INIT1 = 16'h5666;
    defparam ori_out_9__I_0_add_216_2.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_216_2.INJECT1_1 = "NO";
    CCU2D cnt_222_add_4_12 (.A0(dds_fm_step[10]), .B0(n233[10]), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[11]), .B1(n233[11]), .C1(GND_net), 
          .D1(GND_net), .CIN(n1383), .COUT(n1384), .S0(n133[10]), .S1(n133[11]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222_add_4_12.INIT0 = 16'h5666;
    defparam cnt_222_add_4_12.INIT1 = 16'h5666;
    defparam cnt_222_add_4_12.INJECT1_0 = "NO";
    defparam cnt_222_add_4_12.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_209_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1433), .S0(n273));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_209_cout.INIT0 = 16'h0000;
    defparam ori_out_9__I_0_add_209_cout.INIT1 = 16'h0000;
    defparam ori_out_9__I_0_add_209_cout.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_209_cout.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_209_9 (.A0(ori_out[8]), .B0(dds_am_factor[0]), 
          .C0(n318[6]), .D0(GND_net), .A1(ori_out[9]), .B1(dds_am_factor[0]), 
          .C1(n318[7]), .D1(GND_net), .CIN(n1432), .COUT(n1433), .S0(am_out_17__N_240[8]), 
          .S1(am_out_17__N_240[9]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_209_9.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_209_9.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_209_9.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_209_9.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_209_7 (.A0(ori_out[6]), .B0(dds_am_factor[0]), 
          .C0(n318[4]), .D0(GND_net), .A1(ori_out[7]), .B1(dds_am_factor[0]), 
          .C1(n318[5]), .D1(GND_net), .CIN(n1431), .COUT(n1432));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_209_7.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_209_7.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_209_7.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_209_7.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_209_5 (.A0(ori_out[4]), .B0(dds_am_factor[0]), 
          .C0(n318[2]), .D0(GND_net), .A1(ori_out[5]), .B1(dds_am_factor[0]), 
          .C1(n318[3]), .D1(GND_net), .CIN(n1430), .COUT(n1431));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_209_5.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_209_5.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_209_5.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_209_5.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_209_3 (.A0(ori_out[2]), .B0(dds_am_factor[0]), 
          .C0(n318[0]), .D0(GND_net), .A1(ori_out[3]), .B1(dds_am_factor[0]), 
          .C1(n318[1]), .D1(GND_net), .CIN(n1429), .COUT(n1430));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_209_3.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_209_3.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_209_3.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_209_3.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_209_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(ori_out[0]), .B1(dds_am_factor[1]), .C1(ori_out[1]), 
          .D1(dds_am_factor[0]), .COUT(n1429));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_209_1.INIT0 = 16'hF000;
    defparam ori_out_9__I_0_add_209_1.INIT1 = 16'h7888;
    defparam ori_out_9__I_0_add_209_1.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_209_1.INJECT1_1 = "NO";
    CCU2D cnt_222_add_4_32 (.A0(dds_fm_step[30]), .B0(cnt[30]), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[31]), .B1(cnt[31]), .C1(GND_net), 
          .D1(GND_net), .CIN(n1393), .S0(n133[30]), .S1(n133[31]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222_add_4_32.INIT0 = 16'h5666;
    defparam cnt_222_add_4_32.INIT1 = 16'h5666;
    defparam cnt_222_add_4_32.INJECT1_0 = "NO";
    defparam cnt_222_add_4_32.INJECT1_1 = "NO";
    CCU2D cnt_222_add_4_10 (.A0(dds_fm_step[8]), .B0(n233[8]), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[9]), .B1(n233[9]), .C1(GND_net), 
          .D1(GND_net), .CIN(n1382), .COUT(n1383), .S0(n133[8]), .S1(n133[9]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222_add_4_10.INIT0 = 16'h5666;
    defparam cnt_222_add_4_10.INIT1 = 16'h5666;
    defparam cnt_222_add_4_10.INJECT1_0 = "NO";
    defparam cnt_222_add_4_10.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_210_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1428), .S0(n276));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_210_cout.INIT0 = 16'h0000;
    defparam ori_out_9__I_0_add_210_cout.INIT1 = 16'h0000;
    defparam ori_out_9__I_0_add_210_cout.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_210_cout.INJECT1_1 = "NO";
    FD1S3AX ori_out_i0 (.D(ori_out_9__N_250[0]), .CK(dac_clk_c), .Q(ori_out[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam ori_out_i0.GSR = "DISABLED";
    CCU2D cnt_222_add_4_8 (.A0(dds_fm_step[6]), .B0(n233[6]), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[7]), .B1(n233[7]), .C1(GND_net), 
          .D1(GND_net), .CIN(n1381), .COUT(n1382), .S0(n133[6]), .S1(n133[7]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222_add_4_8.INIT0 = 16'h5666;
    defparam cnt_222_add_4_8.INIT1 = 16'h5666;
    defparam cnt_222_add_4_8.INJECT1_0 = "NO";
    defparam cnt_222_add_4_8.INJECT1_1 = "NO";
    CCU2D cnt_222_add_4_6 (.A0(dds_fm_step[4]), .B0(n233[4]), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[5]), .B1(n233[5]), .C1(GND_net), 
          .D1(GND_net), .CIN(n1380), .COUT(n1381), .S0(n133[4]), .S1(n133[5]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222_add_4_6.INIT0 = 16'h5666;
    defparam cnt_222_add_4_6.INIT1 = 16'h5666;
    defparam cnt_222_add_4_6.INJECT1_0 = "NO";
    defparam cnt_222_add_4_6.INJECT1_1 = "NO";
    FD1S3AX am_out_i1 (.D(am_out_17__N_240[8]), .CK(dac_clk_c), .Q(am_out[8])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam am_out_i1.GSR = "DISABLED";
    CCU2D cnt_222_add_4_4 (.A0(dds_fm_step[2]), .B0(n233[2]), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[3]), .B1(n233[3]), .C1(GND_net), 
          .D1(GND_net), .CIN(n1379), .COUT(n1380), .S0(n133[2]), .S1(n133[3]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222_add_4_4.INIT0 = 16'h5666;
    defparam cnt_222_add_4_4.INIT1 = 16'h5666;
    defparam cnt_222_add_4_4.INJECT1_0 = "NO";
    defparam cnt_222_add_4_4.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_210_9 (.A0(ori_out[8]), .B0(dds_am_factor[1]), 
          .C0(n319[6]), .D0(GND_net), .A1(ori_out[9]), .B1(dds_am_factor[1]), 
          .C1(n319[7]), .D1(GND_net), .CIN(n1427), .COUT(n1428), .S0(n318[7]), 
          .S1(n318[8]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_210_9.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_210_9.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_210_9.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_210_9.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_210_7 (.A0(ori_out[6]), .B0(dds_am_factor[1]), 
          .C0(n319[4]), .D0(GND_net), .A1(ori_out[7]), .B1(dds_am_factor[1]), 
          .C1(n319[5]), .D1(GND_net), .CIN(n1426), .COUT(n1427), .S0(n318[5]), 
          .S1(n318[6]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_210_7.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_210_7.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_210_7.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_210_7.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_210_5 (.A0(ori_out[4]), .B0(dds_am_factor[1]), 
          .C0(n319[2]), .D0(GND_net), .A1(ori_out[5]), .B1(dds_am_factor[1]), 
          .C1(n319[3]), .D1(GND_net), .CIN(n1425), .COUT(n1426), .S0(n318[3]), 
          .S1(n318[4]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_210_5.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_210_5.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_210_5.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_210_5.INJECT1_1 = "NO";
    FD1S3AX dds_out_i1 (.D(am_out[8]), .CK(dac_clk_c), .Q(dac_data_c_0)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam dds_out_i1.GSR = "DISABLED";
    LUT4 mux_154_i7_3_lut (.A(cnt[31]), .B(cnt[27]), .C(\curr_wave_st[1] ), 
         .Z(n374[6])) /* synthesis lut_function=(A (B+!(C))+!A !(B+!(C))) */ ;
    defparam mux_154_i7_3_lut.init = 16'h9a9a;
    LUT4 mux_154_i4_3_lut (.A(cnt[31]), .B(cnt[24]), .C(\curr_wave_st[1] ), 
         .Z(n374[3])) /* synthesis lut_function=(A (B+!(C))+!A !(B+!(C))) */ ;
    defparam mux_154_i4_3_lut.init = 16'h9a9a;
    LUT4 mux_154_i3_3_lut (.A(cnt[31]), .B(cnt[23]), .C(\curr_wave_st[1] ), 
         .Z(n374[2])) /* synthesis lut_function=(A (B+!(C))+!A !(B+!(C))) */ ;
    defparam mux_154_i3_3_lut.init = 16'h9a9a;
    LUT4 mux_154_i2_3_lut (.A(cnt[31]), .B(cnt[22]), .C(\curr_wave_st[1] ), 
         .Z(n374[1])) /* synthesis lut_function=(A (B+!(C))+!A !(B+!(C))) */ ;
    defparam mux_154_i2_3_lut.init = 16'h9a9a;
    CCU2D cnt_222_add_4_30 (.A0(dds_fm_step[28]), .B0(cnt[28]), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[29]), .B1(cnt[29]), .C1(GND_net), 
          .D1(GND_net), .CIN(n1392), .COUT(n1393), .S0(n133[28]), .S1(n133[29]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222_add_4_30.INIT0 = 16'h5666;
    defparam cnt_222_add_4_30.INIT1 = 16'h5666;
    defparam cnt_222_add_4_30.INJECT1_0 = "NO";
    defparam cnt_222_add_4_30.INJECT1_1 = "NO";
    CCU2D cnt_222_add_4_2 (.A0(dds_fm_step[0]), .B0(n233[0]), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[1]), .B1(n233[1]), .C1(GND_net), 
          .D1(GND_net), .COUT(n1379), .S1(n133[1]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222_add_4_2.INIT0 = 16'h7000;
    defparam cnt_222_add_4_2.INIT1 = 16'h5666;
    defparam cnt_222_add_4_2.INJECT1_0 = "NO";
    defparam cnt_222_add_4_2.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_210_3 (.A0(ori_out[2]), .B0(dds_am_factor[1]), 
          .C0(n319[0]), .D0(GND_net), .A1(ori_out[3]), .B1(dds_am_factor[1]), 
          .C1(n319[1]), .D1(GND_net), .CIN(n1424), .COUT(n1425), .S0(n318[1]), 
          .S1(n318[2]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_210_3.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_210_3.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_210_3.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_210_3.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_210_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(ori_out[0]), .B1(dds_am_factor[2]), .C1(ori_out[1]), 
          .D1(dds_am_factor[1]), .COUT(n1424), .S1(n318[0]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_210_1.INIT0 = 16'hF000;
    defparam ori_out_9__I_0_add_210_1.INIT1 = 16'h7888;
    defparam ori_out_9__I_0_add_210_1.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_210_1.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_211_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1423), .S0(n279));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_211_cout.INIT0 = 16'h0000;
    defparam ori_out_9__I_0_add_211_cout.INIT1 = 16'h0000;
    defparam ori_out_9__I_0_add_211_cout.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_211_cout.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_211_9 (.A0(ori_out[8]), .B0(dds_am_factor[2]), 
          .C0(n320[6]), .D0(GND_net), .A1(ori_out[9]), .B1(dds_am_factor[2]), 
          .C1(n320[7]), .D1(GND_net), .CIN(n1422), .COUT(n1423), .S0(n319[7]), 
          .S1(n319[8]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_211_9.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_211_9.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_211_9.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_211_9.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_211_7 (.A0(ori_out[6]), .B0(dds_am_factor[2]), 
          .C0(n320[4]), .D0(GND_net), .A1(ori_out[7]), .B1(dds_am_factor[2]), 
          .C1(n320[5]), .D1(GND_net), .CIN(n1421), .COUT(n1422), .S0(n319[5]), 
          .S1(n319[6]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_211_7.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_211_7.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_211_7.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_211_7.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_211_5 (.A0(ori_out[4]), .B0(dds_am_factor[2]), 
          .C0(n320[2]), .D0(GND_net), .A1(ori_out[5]), .B1(dds_am_factor[2]), 
          .C1(n320[3]), .D1(GND_net), .CIN(n1420), .COUT(n1421), .S0(n319[3]), 
          .S1(n319[4]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_211_5.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_211_5.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_211_5.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_211_5.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_211_3 (.A0(ori_out[2]), .B0(dds_am_factor[2]), 
          .C0(n320[0]), .D0(GND_net), .A1(ori_out[3]), .B1(dds_am_factor[2]), 
          .C1(n320[1]), .D1(GND_net), .CIN(n1419), .COUT(n1420), .S0(n319[1]), 
          .S1(n319[2]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_211_3.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_211_3.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_211_3.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_211_3.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_211_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(ori_out[0]), .B1(dds_am_factor[3]), .C1(ori_out[1]), 
          .D1(dds_am_factor[2]), .COUT(n1419), .S1(n319[0]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_211_1.INIT0 = 16'hF000;
    defparam ori_out_9__I_0_add_211_1.INIT1 = 16'h7888;
    defparam ori_out_9__I_0_add_211_1.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_211_1.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_212_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1418), .S0(n282));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_212_cout.INIT0 = 16'h0000;
    defparam ori_out_9__I_0_add_212_cout.INIT1 = 16'h0000;
    defparam ori_out_9__I_0_add_212_cout.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_212_cout.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_212_9 (.A0(ori_out[8]), .B0(dds_am_factor[3]), 
          .C0(n321[6]), .D0(GND_net), .A1(ori_out[9]), .B1(dds_am_factor[3]), 
          .C1(n321[7]), .D1(GND_net), .CIN(n1417), .COUT(n1418), .S0(n320[7]), 
          .S1(n320[8]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_212_9.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_212_9.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_212_9.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_212_9.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_212_7 (.A0(ori_out[6]), .B0(dds_am_factor[3]), 
          .C0(n321[4]), .D0(GND_net), .A1(ori_out[7]), .B1(dds_am_factor[3]), 
          .C1(n321[5]), .D1(GND_net), .CIN(n1416), .COUT(n1417), .S0(n320[5]), 
          .S1(n320[6]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_212_7.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_212_7.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_212_7.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_212_7.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_212_5 (.A0(ori_out[4]), .B0(dds_am_factor[3]), 
          .C0(n321[2]), .D0(GND_net), .A1(ori_out[5]), .B1(dds_am_factor[3]), 
          .C1(n321[3]), .D1(GND_net), .CIN(n1415), .COUT(n1416), .S0(n320[3]), 
          .S1(n320[4]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_212_5.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_212_5.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_212_5.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_212_5.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_212_3 (.A0(ori_out[2]), .B0(dds_am_factor[3]), 
          .C0(n321[0]), .D0(GND_net), .A1(ori_out[3]), .B1(dds_am_factor[3]), 
          .C1(n321[1]), .D1(GND_net), .CIN(n1414), .COUT(n1415), .S0(n320[1]), 
          .S1(n320[2]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_212_3.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_212_3.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_212_3.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_212_3.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_212_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(ori_out[0]), .B1(dds_am_factor[4]), .C1(ori_out[1]), 
          .D1(dds_am_factor[3]), .COUT(n1414), .S1(n320[0]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_212_1.INIT0 = 16'hF000;
    defparam ori_out_9__I_0_add_212_1.INIT1 = 16'h7888;
    defparam ori_out_9__I_0_add_212_1.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_212_1.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_213_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1413), .S0(n285));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_213_cout.INIT0 = 16'h0000;
    defparam ori_out_9__I_0_add_213_cout.INIT1 = 16'h0000;
    defparam ori_out_9__I_0_add_213_cout.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_213_cout.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_213_9 (.A0(ori_out[8]), .B0(dds_am_factor[4]), 
          .C0(n322[6]), .D0(GND_net), .A1(ori_out[9]), .B1(dds_am_factor[4]), 
          .C1(n322[7]), .D1(GND_net), .CIN(n1412), .COUT(n1413), .S0(n321[7]), 
          .S1(n321[8]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_213_9.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_213_9.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_213_9.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_213_9.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_213_7 (.A0(ori_out[6]), .B0(dds_am_factor[4]), 
          .C0(n322[4]), .D0(GND_net), .A1(ori_out[7]), .B1(dds_am_factor[4]), 
          .C1(n322[5]), .D1(GND_net), .CIN(n1411), .COUT(n1412), .S0(n321[5]), 
          .S1(n321[6]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_213_7.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_213_7.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_213_7.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_213_7.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_213_5 (.A0(ori_out[4]), .B0(dds_am_factor[4]), 
          .C0(n322[2]), .D0(GND_net), .A1(ori_out[5]), .B1(dds_am_factor[4]), 
          .C1(n322[3]), .D1(GND_net), .CIN(n1410), .COUT(n1411), .S0(n321[3]), 
          .S1(n321[4]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_213_5.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_213_5.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_213_5.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_213_5.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_213_3 (.A0(ori_out[2]), .B0(dds_am_factor[4]), 
          .C0(n322[0]), .D0(GND_net), .A1(ori_out[3]), .B1(dds_am_factor[4]), 
          .C1(n322[1]), .D1(GND_net), .CIN(n1409), .COUT(n1410), .S0(n321[1]), 
          .S1(n321[2]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_213_3.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_213_3.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_213_3.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_213_3.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_213_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(ori_out[0]), .B1(dds_am_factor[5]), .C1(ori_out[1]), 
          .D1(dds_am_factor[4]), .COUT(n1409), .S1(n321[0]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_213_1.INIT0 = 16'hF000;
    defparam ori_out_9__I_0_add_213_1.INIT1 = 16'h7888;
    defparam ori_out_9__I_0_add_213_1.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_213_1.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_214_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1408), .S0(n288));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_214_cout.INIT0 = 16'h0000;
    defparam ori_out_9__I_0_add_214_cout.INIT1 = 16'h0000;
    defparam ori_out_9__I_0_add_214_cout.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_214_cout.INJECT1_1 = "NO";
    FD1S3AX cnt_222__i0 (.D(n133[0]), .CK(dac_clk_c), .Q(n233[0])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i0.GSR = "DISABLED";
    FD1S3AX cnt_222__i31 (.D(n133[31]), .CK(dac_clk_c), .Q(cnt[31])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i31.GSR = "DISABLED";
    FD1S3AX cnt_222__i30 (.D(n133[30]), .CK(dac_clk_c), .Q(cnt[30])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i30.GSR = "DISABLED";
    FD1S3AX cnt_222__i29 (.D(n133[29]), .CK(dac_clk_c), .Q(cnt[29])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i29.GSR = "DISABLED";
    FD1S3AX cnt_222__i28 (.D(n133[28]), .CK(dac_clk_c), .Q(cnt[28])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i28.GSR = "DISABLED";
    FD1S3AX cnt_222__i27 (.D(n133[27]), .CK(dac_clk_c), .Q(cnt[27])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i27.GSR = "DISABLED";
    FD1S3AX cnt_222__i26 (.D(n133[26]), .CK(dac_clk_c), .Q(cnt[26])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i26.GSR = "DISABLED";
    FD1S3AX cnt_222__i25 (.D(n133[25]), .CK(dac_clk_c), .Q(cnt[25])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i25.GSR = "DISABLED";
    FD1S3AX cnt_222__i24 (.D(n133[24]), .CK(dac_clk_c), .Q(cnt[24])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i24.GSR = "DISABLED";
    FD1S3AX cnt_222__i23 (.D(n133[23]), .CK(dac_clk_c), .Q(cnt[23])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i23.GSR = "DISABLED";
    FD1S3AX cnt_222__i22 (.D(n133[22]), .CK(dac_clk_c), .Q(cnt[22])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i22.GSR = "DISABLED";
    FD1S3AX cnt_222__i21 (.D(n133[21]), .CK(dac_clk_c), .Q(cnt[21])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i21.GSR = "DISABLED";
    FD1S3AX cnt_222__i20 (.D(n133[20]), .CK(dac_clk_c), .Q(n233[20])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i20.GSR = "DISABLED";
    FD1S3AX cnt_222__i19 (.D(n133[19]), .CK(dac_clk_c), .Q(n233[19])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i19.GSR = "DISABLED";
    FD1S3AX cnt_222__i18 (.D(n133[18]), .CK(dac_clk_c), .Q(n233[18])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i18.GSR = "DISABLED";
    FD1S3AX cnt_222__i17 (.D(n133[17]), .CK(dac_clk_c), .Q(n233[17])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i17.GSR = "DISABLED";
    FD1S3AX cnt_222__i16 (.D(n133[16]), .CK(dac_clk_c), .Q(n233[16])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i16.GSR = "DISABLED";
    FD1S3AX cnt_222__i15 (.D(n133[15]), .CK(dac_clk_c), .Q(n233[15])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i15.GSR = "DISABLED";
    FD1S3AX cnt_222__i14 (.D(n133[14]), .CK(dac_clk_c), .Q(n233[14])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i14.GSR = "DISABLED";
    FD1S3AX cnt_222__i13 (.D(n133[13]), .CK(dac_clk_c), .Q(n233[13])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i13.GSR = "DISABLED";
    FD1S3AX cnt_222__i12 (.D(n133[12]), .CK(dac_clk_c), .Q(n233[12])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i12.GSR = "DISABLED";
    FD1S3AX cnt_222__i11 (.D(n133[11]), .CK(dac_clk_c), .Q(n233[11])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i11.GSR = "DISABLED";
    FD1S3AX cnt_222__i10 (.D(n133[10]), .CK(dac_clk_c), .Q(n233[10])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i10.GSR = "DISABLED";
    FD1S3AX cnt_222__i9 (.D(n133[9]), .CK(dac_clk_c), .Q(n233[9])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i9.GSR = "DISABLED";
    FD1S3AX cnt_222__i8 (.D(n133[8]), .CK(dac_clk_c), .Q(n233[8])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i8.GSR = "DISABLED";
    FD1S3AX cnt_222__i7 (.D(n133[7]), .CK(dac_clk_c), .Q(n233[7])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i7.GSR = "DISABLED";
    FD1S3AX cnt_222__i6 (.D(n133[6]), .CK(dac_clk_c), .Q(n233[6])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i6.GSR = "DISABLED";
    FD1S3AX cnt_222__i5 (.D(n133[5]), .CK(dac_clk_c), .Q(n233[5])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i5.GSR = "DISABLED";
    FD1S3AX cnt_222__i4 (.D(n133[4]), .CK(dac_clk_c), .Q(n233[4])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i4.GSR = "DISABLED";
    FD1S3AX cnt_222__i3 (.D(n133[3]), .CK(dac_clk_c), .Q(n233[3])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i3.GSR = "DISABLED";
    FD1S3AX cnt_222__i2 (.D(n133[2]), .CK(dac_clk_c), .Q(n233[2])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i2.GSR = "DISABLED";
    FD1S3AX cnt_222__i1 (.D(n133[1]), .CK(dac_clk_c), .Q(n233[1])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222__i1.GSR = "DISABLED";
    CCU2D cnt_222_add_4_28 (.A0(dds_fm_step[26]), .B0(cnt[26]), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[27]), .B1(cnt[27]), .C1(GND_net), 
          .D1(GND_net), .CIN(n1391), .COUT(n1392), .S0(n133[26]), .S1(n133[27]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222_add_4_28.INIT0 = 16'h5666;
    defparam cnt_222_add_4_28.INIT1 = 16'h5666;
    defparam cnt_222_add_4_28.INJECT1_0 = "NO";
    defparam cnt_222_add_4_28.INJECT1_1 = "NO";
    CCU2D cnt_222_add_4_26 (.A0(dds_fm_step[24]), .B0(cnt[24]), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[25]), .B1(cnt[25]), .C1(GND_net), 
          .D1(GND_net), .CIN(n1390), .COUT(n1391), .S0(n133[24]), .S1(n133[25]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222_add_4_26.INIT0 = 16'h5666;
    defparam cnt_222_add_4_26.INIT1 = 16'h5666;
    defparam cnt_222_add_4_26.INJECT1_0 = "NO";
    defparam cnt_222_add_4_26.INJECT1_1 = "NO";
    CCU2D cnt_222_add_4_24 (.A0(dds_fm_step[22]), .B0(cnt[22]), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[23]), .B1(cnt[23]), .C1(GND_net), 
          .D1(GND_net), .CIN(n1389), .COUT(n1390), .S0(n133[22]), .S1(n133[23]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222_add_4_24.INIT0 = 16'h5666;
    defparam cnt_222_add_4_24.INIT1 = 16'h5666;
    defparam cnt_222_add_4_24.INJECT1_0 = "NO";
    defparam cnt_222_add_4_24.INJECT1_1 = "NO";
    FD1S3AX dds_out_i10 (.D(am_out[17]), .CK(dac_clk_c), .Q(dac_data_c_9)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam dds_out_i10.GSR = "DISABLED";
    CCU2D cnt_222_add_4_22 (.A0(dds_fm_step[20]), .B0(n233[20]), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[21]), .B1(cnt[21]), .C1(GND_net), 
          .D1(GND_net), .CIN(n1388), .COUT(n1389), .S0(n133[20]), .S1(n133[21]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222_add_4_22.INIT0 = 16'h5666;
    defparam cnt_222_add_4_22.INIT1 = 16'h5666;
    defparam cnt_222_add_4_22.INJECT1_0 = "NO";
    defparam cnt_222_add_4_22.INJECT1_1 = "NO";
    CCU2D cnt_222_add_4_20 (.A0(dds_fm_step[18]), .B0(n233[18]), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[19]), .B1(n233[19]), .C1(GND_net), 
          .D1(GND_net), .CIN(n1387), .COUT(n1388), .S0(n133[18]), .S1(n133[19]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222_add_4_20.INIT0 = 16'h5666;
    defparam cnt_222_add_4_20.INIT1 = 16'h5666;
    defparam cnt_222_add_4_20.INJECT1_0 = "NO";
    defparam cnt_222_add_4_20.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_214_9 (.A0(ori_out[8]), .B0(dds_am_factor[5]), 
          .C0(n323[6]), .D0(GND_net), .A1(ori_out[9]), .B1(dds_am_factor[5]), 
          .C1(n323[7]), .D1(GND_net), .CIN(n1407), .COUT(n1408), .S0(n322[7]), 
          .S1(n322[8]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_214_9.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_214_9.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_214_9.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_214_9.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_214_7 (.A0(ori_out[6]), .B0(dds_am_factor[5]), 
          .C0(n323[4]), .D0(GND_net), .A1(ori_out[7]), .B1(dds_am_factor[5]), 
          .C1(n323[5]), .D1(GND_net), .CIN(n1406), .COUT(n1407), .S0(n322[5]), 
          .S1(n322[6]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_214_7.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_214_7.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_214_7.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_214_7.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_214_5 (.A0(ori_out[4]), .B0(dds_am_factor[5]), 
          .C0(n323[2]), .D0(GND_net), .A1(ori_out[5]), .B1(dds_am_factor[5]), 
          .C1(n323[3]), .D1(GND_net), .CIN(n1405), .COUT(n1406), .S0(n322[3]), 
          .S1(n322[4]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_214_5.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_214_5.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_214_5.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_214_5.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_214_3 (.A0(ori_out[2]), .B0(dds_am_factor[5]), 
          .C0(n323[0]), .D0(GND_net), .A1(ori_out[3]), .B1(dds_am_factor[5]), 
          .C1(n323[1]), .D1(GND_net), .CIN(n1404), .COUT(n1405), .S0(n322[1]), 
          .S1(n322[2]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_214_3.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_214_3.INIT1 = 16'h7878;
    defparam ori_out_9__I_0_add_214_3.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_214_3.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_214_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(ori_out[0]), .B1(dds_am_factor[6]), .C1(ori_out[1]), 
          .D1(dds_am_factor[5]), .COUT(n1404), .S1(n322[0]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_214_1.INIT0 = 16'hF000;
    defparam ori_out_9__I_0_add_214_1.INIT1 = 16'h7888;
    defparam ori_out_9__I_0_add_214_1.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_214_1.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_215_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1403), .S0(n291));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_215_cout.INIT0 = 16'h0000;
    defparam ori_out_9__I_0_add_215_cout.INIT1 = 16'h0000;
    defparam ori_out_9__I_0_add_215_cout.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_215_cout.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_215_9 (.A0(ori_out[7]), .B0(dds_am_factor[7]), 
          .C0(ori_out[8]), .D0(dds_am_factor[6]), .A1(ori_out[8]), .B1(dds_am_factor[7]), 
          .C1(ori_out[9]), .D1(dds_am_factor[6]), .CIN(n1402), .COUT(n1403), 
          .S0(n323[7]), .S1(n323[8]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_215_9.INIT0 = 16'h7888;
    defparam ori_out_9__I_0_add_215_9.INIT1 = 16'h7888;
    defparam ori_out_9__I_0_add_215_9.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_215_9.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_215_7 (.A0(ori_out[5]), .B0(dds_am_factor[7]), 
          .C0(ori_out[6]), .D0(dds_am_factor[6]), .A1(ori_out[6]), .B1(dds_am_factor[7]), 
          .C1(ori_out[7]), .D1(dds_am_factor[6]), .CIN(n1401), .COUT(n1402), 
          .S0(n323[5]), .S1(n323[6]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_215_7.INIT0 = 16'h7888;
    defparam ori_out_9__I_0_add_215_7.INIT1 = 16'h7888;
    defparam ori_out_9__I_0_add_215_7.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_215_7.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_215_5 (.A0(ori_out[3]), .B0(dds_am_factor[7]), 
          .C0(ori_out[4]), .D0(dds_am_factor[6]), .A1(ori_out[4]), .B1(dds_am_factor[7]), 
          .C1(ori_out[5]), .D1(dds_am_factor[6]), .CIN(n1400), .COUT(n1401), 
          .S0(n323[3]), .S1(n323[4]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_215_5.INIT0 = 16'h7888;
    defparam ori_out_9__I_0_add_215_5.INIT1 = 16'h7888;
    defparam ori_out_9__I_0_add_215_5.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_215_5.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_215_3 (.A0(ori_out[1]), .B0(dds_am_factor[7]), 
          .C0(ori_out[2]), .D0(dds_am_factor[6]), .A1(ori_out[2]), .B1(dds_am_factor[7]), 
          .C1(ori_out[3]), .D1(dds_am_factor[6]), .CIN(n1399), .COUT(n1400), 
          .S0(n323[1]), .S1(n323[2]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_215_3.INIT0 = 16'h7888;
    defparam ori_out_9__I_0_add_215_3.INIT1 = 16'h7888;
    defparam ori_out_9__I_0_add_215_3.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_215_3.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_215_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(ori_out[0]), .B1(dds_am_factor[7]), .C1(ori_out[1]), 
          .D1(dds_am_factor[6]), .COUT(n1399), .S1(n323[0]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_215_1.INIT0 = 16'hF000;
    defparam ori_out_9__I_0_add_215_1.INIT1 = 16'h7888;
    defparam ori_out_9__I_0_add_215_1.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_215_1.INJECT1_1 = "NO";
    LUT4 mux_158_i10_3_lut_4_lut (.A(\curr_wave_st[0] ), .B(n1651), .C(n374[9]), 
         .D(dds_out_sin_temp[9]), .Z(ori_out_9__N_250[9])) /* synthesis lut_function=(A (B (C)+!B !(D))+!A !(D)) */ ;
    defparam mux_158_i10_3_lut_4_lut.init = 16'h80f7;
    FD1S3AX dds_out_i9 (.D(am_out[16]), .CK(dac_clk_c), .Q(dac_data_c_8)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam dds_out_i9.GSR = "DISABLED";
    FD1S3AX dds_out_i8 (.D(am_out[15]), .CK(dac_clk_c), .Q(dac_data_c_7)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam dds_out_i8.GSR = "DISABLED";
    FD1S3AX dds_out_i7 (.D(am_out[14]), .CK(dac_clk_c), .Q(dac_data_c_6)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam dds_out_i7.GSR = "DISABLED";
    FD1S3AX dds_out_i6 (.D(am_out[13]), .CK(dac_clk_c), .Q(dac_data_c_5)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam dds_out_i6.GSR = "DISABLED";
    FD1S3AX dds_out_i5 (.D(am_out[12]), .CK(dac_clk_c), .Q(dac_data_c_4)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam dds_out_i5.GSR = "DISABLED";
    FD1S3AX dds_out_i4 (.D(am_out[11]), .CK(dac_clk_c), .Q(dac_data_c_3)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam dds_out_i4.GSR = "DISABLED";
    FD1S3AX dds_out_i3 (.D(am_out[10]), .CK(dac_clk_c), .Q(dac_data_c_2)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam dds_out_i3.GSR = "DISABLED";
    FD1S3AX dds_out_i2 (.D(am_out[9]), .CK(dac_clk_c), .Q(dac_data_c_1)) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam dds_out_i2.GSR = "DISABLED";
    FD1S3AX am_out_i10 (.D(am_out_17__N_240[17]), .CK(dac_clk_c), .Q(am_out[17])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam am_out_i10.GSR = "DISABLED";
    FD1S3AX am_out_i9 (.D(am_out_17__N_240[16]), .CK(dac_clk_c), .Q(am_out[16])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam am_out_i9.GSR = "DISABLED";
    FD1S3AX am_out_i8 (.D(am_out_17__N_240[15]), .CK(dac_clk_c), .Q(am_out[15])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam am_out_i8.GSR = "DISABLED";
    FD1S3AX am_out_i7 (.D(am_out_17__N_240[14]), .CK(dac_clk_c), .Q(am_out[14])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam am_out_i7.GSR = "DISABLED";
    FD1S3AX am_out_i6 (.D(am_out_17__N_240[13]), .CK(dac_clk_c), .Q(am_out[13])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam am_out_i6.GSR = "DISABLED";
    FD1S3AX am_out_i5 (.D(am_out_17__N_240[12]), .CK(dac_clk_c), .Q(am_out[12])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam am_out_i5.GSR = "DISABLED";
    FD1S3AX am_out_i4 (.D(am_out_17__N_240[11]), .CK(dac_clk_c), .Q(am_out[11])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam am_out_i4.GSR = "DISABLED";
    FD1S3AX am_out_i3 (.D(am_out_17__N_240[10]), .CK(dac_clk_c), .Q(am_out[10])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam am_out_i3.GSR = "DISABLED";
    FD1S3AX am_out_i2 (.D(am_out_17__N_240[9]), .CK(dac_clk_c), .Q(am_out[9])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=6, LSE_RCOL=3, LSE_LLINE=212, LSE_RLINE=218 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(34[8] 49[4])
    defparam am_out_i2.GSR = "DISABLED";
    CCU2D ori_out_9__I_0_add_216_8 (.A0(ori_out[9]), .B0(dds_am_factor[7]), 
          .C0(n291), .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n1398), .S0(am_out_17__N_240[16]), .S1(am_out_17__N_240[17]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_216_8.INIT0 = 16'h7878;
    defparam ori_out_9__I_0_add_216_8.INIT1 = 16'h0000;
    defparam ori_out_9__I_0_add_216_8.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_216_8.INJECT1_1 = "NO";
    LUT4 mux_154_i5_3_lut (.A(cnt[31]), .B(cnt[25]), .C(\curr_wave_st[1] ), 
         .Z(n374[4])) /* synthesis lut_function=(A (B+!(C))+!A !(B+!(C))) */ ;
    defparam mux_154_i5_3_lut.init = 16'h9a9a;
    LUT4 mux_154_i6_3_lut (.A(cnt[31]), .B(cnt[26]), .C(\curr_wave_st[1] ), 
         .Z(n374[5])) /* synthesis lut_function=(A (B+!(C))+!A !(B+!(C))) */ ;
    defparam mux_154_i6_3_lut.init = 16'h9a9a;
    LUT4 mux_158_i1_3_lut_4_lut (.A(\curr_wave_st[0] ), .B(n1651), .C(n374[0]), 
         .D(ori_out_9__N_296[0]), .Z(ori_out_9__N_250[0])) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)) */ ;
    defparam mux_158_i1_3_lut_4_lut.init = 16'hf780;
    LUT4 mux_158_i9_3_lut_4_lut (.A(\curr_wave_st[0] ), .B(n1651), .C(n374[8]), 
         .D(ori_out_9__N_296[8]), .Z(ori_out_9__N_250[8])) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)) */ ;
    defparam mux_158_i9_3_lut_4_lut.init = 16'hf780;
    LUT4 mux_158_i8_3_lut_4_lut (.A(\curr_wave_st[0] ), .B(n1651), .C(n374[7]), 
         .D(ori_out_9__N_296[7]), .Z(ori_out_9__N_250[7])) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)) */ ;
    defparam mux_158_i8_3_lut_4_lut.init = 16'hf780;
    LUT4 mux_158_i7_3_lut_4_lut (.A(\curr_wave_st[0] ), .B(n1651), .C(n374[6]), 
         .D(ori_out_9__N_296[6]), .Z(ori_out_9__N_250[6])) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)) */ ;
    defparam mux_158_i7_3_lut_4_lut.init = 16'hf780;
    LUT4 mux_158_i6_3_lut_4_lut (.A(\curr_wave_st[0] ), .B(n1651), .C(n374[5]), 
         .D(ori_out_9__N_296[5]), .Z(ori_out_9__N_250[5])) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)) */ ;
    defparam mux_158_i6_3_lut_4_lut.init = 16'hf780;
    LUT4 mux_154_i1_3_lut (.A(cnt[31]), .B(cnt[21]), .C(\curr_wave_st[1] ), 
         .Z(n374[0])) /* synthesis lut_function=(A (B+!(C))+!A !(B+!(C))) */ ;
    defparam mux_154_i1_3_lut.init = 16'h9a9a;
    LUT4 mux_158_i5_3_lut_4_lut (.A(\curr_wave_st[0] ), .B(n1651), .C(n374[4]), 
         .D(ori_out_9__N_296[4]), .Z(ori_out_9__N_250[4])) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)) */ ;
    defparam mux_158_i5_3_lut_4_lut.init = 16'hf780;
    LUT4 mux_158_i4_3_lut_4_lut (.A(\curr_wave_st[0] ), .B(n1651), .C(n374[3]), 
         .D(ori_out_9__N_296[3]), .Z(ori_out_9__N_250[3])) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)) */ ;
    defparam mux_158_i4_3_lut_4_lut.init = 16'hf780;
    LUT4 mux_158_i3_3_lut_4_lut (.A(\curr_wave_st[0] ), .B(n1651), .C(n374[2]), 
         .D(ori_out_9__N_296[2]), .Z(ori_out_9__N_250[2])) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)) */ ;
    defparam mux_158_i3_3_lut_4_lut.init = 16'hf780;
    LUT4 i906_2_lut (.A(n318[8]), .B(n273), .Z(am_out_17__N_240[10])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;
    defparam i906_2_lut.init = 16'h6666;
    LUT4 i905_2_lut (.A(dds_fm_step[0]), .B(n233[0]), .Z(n133[0])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;
    defparam i905_2_lut.init = 16'h6666;
    LUT4 mux_154_i8_3_lut (.A(cnt[31]), .B(cnt[28]), .C(\curr_wave_st[1] ), 
         .Z(n374[7])) /* synthesis lut_function=(A (B+!(C))+!A !(B+!(C))) */ ;
    defparam mux_154_i8_3_lut.init = 16'h9a9a;
    LUT4 mux_154_i10_3_lut (.A(cnt[31]), .B(cnt[30]), .C(\curr_wave_st[1] ), 
         .Z(n374[9])) /* synthesis lut_function=(A (B+!(C))+!A !(B+!(C))) */ ;
    defparam mux_154_i10_3_lut.init = 16'h9a9a;
    LUT4 mux_158_i2_3_lut_4_lut (.A(\curr_wave_st[0] ), .B(n1651), .C(n374[1]), 
         .D(ori_out_9__N_296[1]), .Z(ori_out_9__N_250[1])) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)) */ ;
    defparam mux_158_i2_3_lut_4_lut.init = 16'hf780;
    LUT4 mux_154_i9_3_lut (.A(cnt[31]), .B(cnt[29]), .C(\curr_wave_st[1] ), 
         .Z(n374[8])) /* synthesis lut_function=(A (B+!(C))+!A !(B+!(C))) */ ;
    defparam mux_154_i9_3_lut.init = 16'h9a9a;
    CCU2D cnt_222_add_4_18 (.A0(dds_fm_step[16]), .B0(n233[16]), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[17]), .B1(n233[17]), .C1(GND_net), 
          .D1(GND_net), .CIN(n1386), .COUT(n1387), .S0(n133[16]), .S1(n133[17]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222_add_4_18.INIT0 = 16'h5666;
    defparam cnt_222_add_4_18.INIT1 = 16'h5666;
    defparam cnt_222_add_4_18.INJECT1_0 = "NO";
    defparam cnt_222_add_4_18.INJECT1_1 = "NO";
    CCU2D cnt_222_add_4_16 (.A0(dds_fm_step[14]), .B0(n233[14]), .C0(GND_net), 
          .D0(GND_net), .A1(dds_fm_step[15]), .B1(n233[15]), .C1(GND_net), 
          .D1(GND_net), .CIN(n1385), .COUT(n1386), .S0(n133[14]), .S1(n133[15]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(20[34:47])
    defparam cnt_222_add_4_16.INIT0 = 16'h5666;
    defparam cnt_222_add_4_16.INIT1 = 16'h5666;
    defparam cnt_222_add_4_16.INJECT1_0 = "NO";
    defparam cnt_222_add_4_16.INJECT1_1 = "NO";
    CCU2D ori_out_9__I_0_add_216_6 (.A0(n322[8]), .B0(n285), .C0(GND_net), 
          .D0(GND_net), .A1(n323[8]), .B1(n288), .C1(GND_net), .D1(GND_net), 
          .CIN(n1397), .COUT(n1398), .S0(am_out_17__N_240[14]), .S1(am_out_17__N_240[15]));   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(47[12:31])
    defparam ori_out_9__I_0_add_216_6.INIT0 = 16'h5666;
    defparam ori_out_9__I_0_add_216_6.INIT1 = 16'h5666;
    defparam ori_out_9__I_0_add_216_6.INJECT1_0 = "NO";
    defparam ori_out_9__I_0_add_216_6.INJECT1_1 = "NO";
    dds_sin_table u_dds_sin_table (.dac_clk_c(dac_clk_c), .VCC_net(VCC_net), 
            .GND_net(GND_net), .\cnt[25] (cnt[25]), .\cnt[26] (cnt[26]), 
            .\cnt[27] (cnt[27]), .\cnt[28] (cnt[28]), .\cnt[29] (cnt[29]), 
            .\cnt[30] (cnt[30]), .\cnt[31] (cnt[31]), .\ori_out_9__N_296[1] (ori_out_9__N_296[1]), 
            .\ori_out_9__N_296[2] (ori_out_9__N_296[2]), .\ori_out_9__N_296[3] (ori_out_9__N_296[3]), 
            .\ori_out_9__N_296[4] (ori_out_9__N_296[4]), .\ori_out_9__N_296[5] (ori_out_9__N_296[5]), 
            .\ori_out_9__N_296[6] (ori_out_9__N_296[6]), .\ori_out_9__N_296[7] (ori_out_9__N_296[7]), 
            .\ori_out_9__N_296[8] (ori_out_9__N_296[8]), .\dds_out_sin_temp[9] (dds_out_sin_temp[9]), 
            .\cnt[24] (cnt[24]), .\ori_out_9__N_296[0] (ori_out_9__N_296[0])) /* synthesis NGD_DRC_MASK=1, syn_module_defined=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    
endmodule
//
// Verilog Description of module dds_sin_table
//

module dds_sin_table (dac_clk_c, VCC_net, GND_net, \cnt[25] , \cnt[26] , 
            \cnt[27] , \cnt[28] , \cnt[29] , \cnt[30] , \cnt[31] , 
            \ori_out_9__N_296[1] , \ori_out_9__N_296[2] , \ori_out_9__N_296[3] , 
            \ori_out_9__N_296[4] , \ori_out_9__N_296[5] , \ori_out_9__N_296[6] , 
            \ori_out_9__N_296[7] , \ori_out_9__N_296[8] , \dds_out_sin_temp[9] , 
            \cnt[24] , \ori_out_9__N_296[0] ) /* synthesis NGD_DRC_MASK=1, syn_module_defined=1 */ ;
    input dac_clk_c;
    input VCC_net;
    input GND_net;
    input \cnt[25] ;
    input \cnt[26] ;
    input \cnt[27] ;
    input \cnt[28] ;
    input \cnt[29] ;
    input \cnt[30] ;
    input \cnt[31] ;
    output \ori_out_9__N_296[1] ;
    output \ori_out_9__N_296[2] ;
    output \ori_out_9__N_296[3] ;
    output \ori_out_9__N_296[4] ;
    output \ori_out_9__N_296[5] ;
    output \ori_out_9__N_296[6] ;
    output \ori_out_9__N_296[7] ;
    output \ori_out_9__N_296[8] ;
    output \dds_out_sin_temp[9] ;
    input \cnt[24] ;
    output \ori_out_9__N_296[0] ;
    
    wire dac_clk_c /* synthesis SET_AS_NETWORK=dac_clk_c, is_clock=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(11[13:20])
    
    wire rom_addr0_r_1, rom_addr0_r_2, rom_addr0_r_3, rom_addr0_r_4, 
        rom_addr0_r_5, mx_ctrl_r, mx_ctrl_r_1, rom_addr0_r, rom_addr0_r_n, 
        rom_addr0_r_n_6, rom_dout_8, rom_dout_8_ffin, rom_dout_7, rom_dout_7_ffin, 
        rom_dout_6, rom_dout_6_ffin, rom_dout_5, rom_dout_5_ffin, rom_dout_4, 
        rom_dout_4_ffin, rom_dout_3, rom_dout_3_ffin, rom_dout_2, rom_dout_2_ffin, 
        rom_dout_1, rom_dout_1_ffin, rom_dout, rom_dout_ffin, sinromoutsel, 
        rom_dout_10, rom_dout_n, out_sel, sinout_pre, sinout_pre_1, 
        sinout_pre_2, sinout_pre_3, sinout_pre_4, sinout_pre_5, sinout_pre_6, 
        sinout_pre_7, sinout_pre_8, sinout_pre_9, rom_addr0_r_inv, co0, 
        rom_addr0_r_n_1, rom_addr0_r_n_2, rom_addr0_r_1_inv, rom_addr0_r_2_inv, 
        co1, rom_addr0_r_n_3, rom_addr0_r_n_4, rom_addr0_r_3_inv, rom_addr0_r_4_inv, 
        co2, rom_addr0_r_n_5, rom_addr0_r_5_inv, rom_dout_9_ffin, rom_addr0_r_n_7, 
        rom_addr0_r_n_8, rom_addr0_r_n_9, rom_addr0_r_n_10, rom_addr0_r_n_11, 
        rom_dout_inv, co0_1, rom_dout_n_1, rom_dout_n_2, rom_dout_1_inv, 
        rom_dout_2_inv, co1_1, rom_dout_n_3, rom_dout_n_4, rom_dout_3_inv, 
        rom_dout_4_inv, co2_1, rom_dout_n_5, rom_dout_n_6, rom_dout_5_inv, 
        rom_dout_6_inv, co3, rom_dout_n_7, rom_dout_n_8, rom_dout_7_inv, 
        rom_dout_8_inv, co4, rom_dout_n_9, rom_dout_9_inv, rom_dout_9, 
        func_or_inet, lx_ne0, lx_ne0_inv, mx_ctrl_r_inv, out_sel_i, 
        rom_dout_11, rom_dout_12, rom_dout_13, rom_dout_14, rom_dout_15, 
        rom_dout_16, rom_dout_17, rom_dout_18, rom_dout_19;
    
    FD1P3DX FF_28 (.D(\cnt[25] ), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(rom_addr0_r_1)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(168[13:88])
    defparam FF_28.GSR = "DISABLED";
    FD1P3DX FF_27 (.D(\cnt[26] ), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(rom_addr0_r_2)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(171[13:88])
    defparam FF_27.GSR = "DISABLED";
    FD1P3DX FF_26 (.D(\cnt[27] ), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(rom_addr0_r_3)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(174[13:88])
    defparam FF_26.GSR = "DISABLED";
    FD1P3DX FF_25 (.D(\cnt[28] ), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(rom_addr0_r_4)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(177[13:88])
    defparam FF_25.GSR = "DISABLED";
    FD1P3DX FF_24 (.D(\cnt[29] ), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(rom_addr0_r_5)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(180[13:88])
    defparam FF_24.GSR = "DISABLED";
    FD1P3DX FF_23 (.D(\cnt[30] ), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(mx_ctrl_r)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(183[13:84])
    defparam FF_23.GSR = "DISABLED";
    FD1P3DX FF_22 (.D(\cnt[31] ), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(mx_ctrl_r_1)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(186[13:86])
    defparam FF_22.GSR = "DISABLED";
    MUX21 muxb_25 (.D0(rom_addr0_r_n), .D1(rom_addr0_r), .SD(mx_ctrl_r), 
          .Z(rom_addr0_r_n_6)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    FD1P3DX FF_20 (.D(rom_dout_8_ffin), .SP(VCC_net), .CK(dac_clk_c), 
            .CD(GND_net), .Q(rom_dout_8)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(211[13] 212[24])
    defparam FF_20.GSR = "DISABLED";
    FD1P3DX FF_19 (.D(rom_dout_7_ffin), .SP(VCC_net), .CK(dac_clk_c), 
            .CD(GND_net), .Q(rom_dout_7)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(215[13] 216[24])
    defparam FF_19.GSR = "DISABLED";
    FD1P3DX FF_18 (.D(rom_dout_6_ffin), .SP(VCC_net), .CK(dac_clk_c), 
            .CD(GND_net), .Q(rom_dout_6)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(219[13] 220[24])
    defparam FF_18.GSR = "DISABLED";
    FD1P3DX FF_17 (.D(rom_dout_5_ffin), .SP(VCC_net), .CK(dac_clk_c), 
            .CD(GND_net), .Q(rom_dout_5)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(223[13] 224[24])
    defparam FF_17.GSR = "DISABLED";
    FD1P3DX FF_16 (.D(rom_dout_4_ffin), .SP(VCC_net), .CK(dac_clk_c), 
            .CD(GND_net), .Q(rom_dout_4)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(227[13] 228[24])
    defparam FF_16.GSR = "DISABLED";
    FD1P3DX FF_15 (.D(rom_dout_3_ffin), .SP(VCC_net), .CK(dac_clk_c), 
            .CD(GND_net), .Q(rom_dout_3)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(231[13] 232[24])
    defparam FF_15.GSR = "DISABLED";
    FD1P3DX FF_14 (.D(rom_dout_2_ffin), .SP(VCC_net), .CK(dac_clk_c), 
            .CD(GND_net), .Q(rom_dout_2)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(235[13] 236[24])
    defparam FF_14.GSR = "DISABLED";
    FD1P3DX FF_13 (.D(rom_dout_1_ffin), .SP(VCC_net), .CK(dac_clk_c), 
            .CD(GND_net), .Q(rom_dout_1)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(239[13] 240[24])
    defparam FF_13.GSR = "DISABLED";
    FD1P3DX FF_12 (.D(rom_dout_ffin), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(rom_dout)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(243[13] 244[22])
    defparam FF_12.GSR = "DISABLED";
    FD1P3DX FF_11 (.D(mx_ctrl_r_1), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(sinromoutsel)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(247[13] 248[26])
    defparam FF_11.GSR = "DISABLED";
    MUX21 muxb_19 (.D0(rom_dout), .D1(rom_dout_n), .SD(sinromoutsel), 
          .Z(rom_dout_10)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_9 (.D0(rom_dout_10), .D1(GND_net), .SD(out_sel), .Z(sinout_pre)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    FD1P3DX FF_8 (.D(sinout_pre_1), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(\ori_out_9__N_296[1] )) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(306[13] 307[21])
    defparam FF_8.GSR = "DISABLED";
    FD1P3DX FF_7 (.D(sinout_pre_2), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(\ori_out_9__N_296[2] )) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(310[13] 311[21])
    defparam FF_7.GSR = "DISABLED";
    FD1P3DX FF_6 (.D(sinout_pre_3), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(\ori_out_9__N_296[3] )) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(314[13] 315[21])
    defparam FF_6.GSR = "DISABLED";
    FD1P3DX FF_5 (.D(sinout_pre_4), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(\ori_out_9__N_296[4] )) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(318[13] 319[21])
    defparam FF_5.GSR = "DISABLED";
    FD1P3DX FF_4 (.D(sinout_pre_5), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(\ori_out_9__N_296[5] )) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(322[13] 323[21])
    defparam FF_4.GSR = "DISABLED";
    FD1P3DX FF_3 (.D(sinout_pre_6), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(\ori_out_9__N_296[6] )) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(326[13] 327[21])
    defparam FF_3.GSR = "DISABLED";
    FD1P3DX FF_2 (.D(sinout_pre_7), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(\ori_out_9__N_296[7] )) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(330[13] 331[21])
    defparam FF_2.GSR = "DISABLED";
    FD1P3DX FF_1 (.D(sinout_pre_8), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(\ori_out_9__N_296[8] )) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(334[13] 335[21])
    defparam FF_1.GSR = "DISABLED";
    FD1P3DX FF_0 (.D(sinout_pre_9), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(\dds_out_sin_temp[9] )) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(338[13] 339[21])
    defparam FF_0.GSR = "DISABLED";
    FADD2B neg_rom_addr0_r_n_0 (.A0(GND_net), .A1(rom_addr0_r_inv), .B0(GND_net), 
           .B1(VCC_net), .CI(GND_net), .COUT(co0), .S1(rom_addr0_r_n)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    FADD2B neg_rom_addr0_r_n_1 (.A0(rom_addr0_r_1_inv), .A1(rom_addr0_r_2_inv), 
           .B0(GND_net), .B1(GND_net), .CI(co0), .COUT(co1), .S0(rom_addr0_r_n_1), 
           .S1(rom_addr0_r_n_2)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    FADD2B neg_rom_addr0_r_n_2 (.A0(rom_addr0_r_3_inv), .A1(rom_addr0_r_4_inv), 
           .B0(GND_net), .B1(GND_net), .CI(co1), .COUT(co2), .S0(rom_addr0_r_n_3), 
           .S1(rom_addr0_r_n_4)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    FADD2B neg_rom_addr0_r_n_3 (.A0(rom_addr0_r_5_inv), .A1(GND_net), .B0(GND_net), 
           .B1(GND_net), .CI(co2), .S0(rom_addr0_r_n_5)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    ROM64X1A triglut_1_0_9 (.AD0(rom_addr0_r_n_6), .AD1(rom_addr0_r_n_7), 
            .AD2(rom_addr0_r_n_8), .AD3(rom_addr0_r_n_9), .AD4(rom_addr0_r_n_10), 
            .AD5(rom_addr0_r_n_11), .DO0(rom_dout_9_ffin)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    defparam triglut_1_0_9.initval = 64'b0000000000000000000000000000000000000000000000000000000000000000;
    FADD2B neg_rom_dout_n_0 (.A0(GND_net), .A1(rom_dout_inv), .B0(GND_net), 
           .B1(VCC_net), .CI(GND_net), .COUT(co0_1), .S1(rom_dout_n)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    FADD2B neg_rom_dout_n_1 (.A0(rom_dout_1_inv), .A1(rom_dout_2_inv), .B0(GND_net), 
           .B1(GND_net), .CI(co0_1), .COUT(co1_1), .S0(rom_dout_n_1), 
           .S1(rom_dout_n_2)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    FADD2B neg_rom_dout_n_2 (.A0(rom_dout_3_inv), .A1(rom_dout_4_inv), .B0(GND_net), 
           .B1(GND_net), .CI(co1_1), .COUT(co2_1), .S0(rom_dout_n_3), 
           .S1(rom_dout_n_4)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    FADD2B neg_rom_dout_n_3 (.A0(rom_dout_5_inv), .A1(rom_dout_6_inv), .B0(GND_net), 
           .B1(GND_net), .CI(co2_1), .COUT(co3), .S0(rom_dout_n_5), 
           .S1(rom_dout_n_6)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    FADD2B neg_rom_dout_n_4 (.A0(rom_dout_7_inv), .A1(rom_dout_8_inv), .B0(GND_net), 
           .B1(GND_net), .CI(co3), .COUT(co4), .S0(rom_dout_n_7), .S1(rom_dout_n_8)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    FADD2B neg_rom_dout_n_5 (.A0(rom_dout_9_inv), .A1(GND_net), .B0(GND_net), 
           .B1(GND_net), .CI(co4), .S0(rom_dout_n_9)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_16 (.A(rom_addr0_r_4), .Z(rom_addr0_r_4_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_17 (.A(rom_addr0_r_5), .Z(rom_addr0_r_5_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_15 (.A(rom_addr0_r_3), .Z(rom_addr0_r_3_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_14 (.A(rom_addr0_r_2), .Z(rom_addr0_r_2_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_13 (.A(rom_addr0_r_1), .Z(rom_addr0_r_1_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_12 (.A(rom_addr0_r), .Z(rom_addr0_r_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_11 (.A(rom_dout_9), .Z(rom_dout_9_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_10 (.A(rom_dout_8), .Z(rom_dout_8_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_9 (.A(rom_dout_7), .Z(rom_dout_7_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_8 (.A(rom_dout_6), .Z(rom_dout_6_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_7 (.A(rom_dout_5), .Z(rom_dout_5_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_6 (.A(rom_dout_4), .Z(rom_dout_4_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_5 (.A(rom_dout_3), .Z(rom_dout_3_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_4 (.A(rom_dout_2), .Z(rom_dout_2_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_3 (.A(rom_dout_1), .Z(rom_dout_1_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_2 (.A(rom_dout), .Z(rom_dout_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    ROM16X1A LUT4_1 (.AD0(rom_addr0_r_n_9), .AD1(rom_addr0_r_n_8), .AD2(rom_addr0_r_n_7), 
            .AD3(rom_addr0_r_n_6), .DO0(func_or_inet)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    defparam LUT4_1.initval = 16'b1111111111111110;
    ROM16X1A LUT4_0 (.AD0(GND_net), .AD1(rom_addr0_r_n_11), .AD2(rom_addr0_r_n_10), 
            .AD3(func_or_inet), .DO0(lx_ne0)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    defparam LUT4_0.initval = 16'b1111111111111110;
    INV INV_1 (.A(lx_ne0), .Z(lx_ne0_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    INV INV_0 (.A(mx_ctrl_r), .Z(mx_ctrl_r_inv)) /* synthesis LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    AND2 AND2_t0 (.A(mx_ctrl_r_inv), .B(lx_ne0_inv), .Z(out_sel_i)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(163[10:68])
    FD1P3DX FF_29 (.D(\cnt[24] ), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(rom_addr0_r)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(165[13:86])
    defparam FF_29.GSR = "DISABLED";
    MUX21 muxb_24 (.D0(rom_addr0_r_n_1), .D1(rom_addr0_r_1), .SD(mx_ctrl_r), 
          .Z(rom_addr0_r_n_7)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_23 (.D0(rom_addr0_r_n_2), .D1(rom_addr0_r_2), .SD(mx_ctrl_r), 
          .Z(rom_addr0_r_n_8)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_22 (.D0(rom_addr0_r_n_3), .D1(rom_addr0_r_3), .SD(mx_ctrl_r), 
          .Z(rom_addr0_r_n_9)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_21 (.D0(rom_addr0_r_n_4), .D1(rom_addr0_r_4), .SD(mx_ctrl_r), 
          .Z(rom_addr0_r_n_10)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_20 (.D0(rom_addr0_r_n_5), .D1(rom_addr0_r_5), .SD(mx_ctrl_r), 
          .Z(rom_addr0_r_n_11)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    FD1P3DX FF_21 (.D(rom_dout_9_ffin), .SP(VCC_net), .CK(dac_clk_c), 
            .CD(GND_net), .Q(rom_dout_9)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(207[13] 208[24])
    defparam FF_21.GSR = "DISABLED";
    MUX21 muxb_18 (.D0(rom_dout_1), .D1(rom_dout_n_1), .SD(sinromoutsel), 
          .Z(rom_dout_11)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_17 (.D0(rom_dout_2), .D1(rom_dout_n_2), .SD(sinromoutsel), 
          .Z(rom_dout_12)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_16 (.D0(rom_dout_3), .D1(rom_dout_n_3), .SD(sinromoutsel), 
          .Z(rom_dout_13)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_15 (.D0(rom_dout_4), .D1(rom_dout_n_4), .SD(sinromoutsel), 
          .Z(rom_dout_14)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_14 (.D0(rom_dout_5), .D1(rom_dout_n_5), .SD(sinromoutsel), 
          .Z(rom_dout_15)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_13 (.D0(rom_dout_6), .D1(rom_dout_n_6), .SD(sinromoutsel), 
          .Z(rom_dout_16)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_12 (.D0(rom_dout_7), .D1(rom_dout_n_7), .SD(sinromoutsel), 
          .Z(rom_dout_17)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_11 (.D0(rom_dout_8), .D1(rom_dout_n_8), .SD(sinromoutsel), 
          .Z(rom_dout_18)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_10 (.D0(rom_dout_9), .D1(rom_dout_n_9), .SD(sinromoutsel), 
          .Z(rom_dout_19)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    FD1P3DX FF_10 (.D(out_sel_i), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(out_sel)) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(280[13:83])
    defparam FF_10.GSR = "DISABLED";
    MUX21 muxb_8 (.D0(rom_dout_11), .D1(GND_net), .SD(out_sel), .Z(sinout_pre_1)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_7 (.D0(rom_dout_12), .D1(GND_net), .SD(out_sel), .Z(sinout_pre_2)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_6 (.D0(rom_dout_13), .D1(GND_net), .SD(out_sel), .Z(sinout_pre_3)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_5 (.D0(rom_dout_14), .D1(GND_net), .SD(out_sel), .Z(sinout_pre_4)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_4 (.D0(rom_dout_15), .D1(GND_net), .SD(out_sel), .Z(sinout_pre_5)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_3 (.D0(rom_dout_16), .D1(GND_net), .SD(out_sel), .Z(sinout_pre_6)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_2 (.D0(rom_dout_17), .D1(GND_net), .SD(out_sel), .Z(sinout_pre_7)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_1 (.D0(rom_dout_18), .D1(GND_net), .SD(out_sel), .Z(sinout_pre_8)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    MUX21 muxb_0 (.D0(rom_dout_19), .D1(GND_net), .SD(out_sel), .Z(sinout_pre_9)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    FD1P3DX FF_9 (.D(sinout_pre), .SP(VCC_net), .CK(dac_clk_c), .CD(GND_net), 
            .Q(\ori_out_9__N_296[0] )) /* synthesis GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_sin_table.v(303[13:83])
    defparam FF_9.GSR = "DISABLED";
    ROM64X1A triglut_1_0_8 (.AD0(rom_addr0_r_n_6), .AD1(rom_addr0_r_n_7), 
            .AD2(rom_addr0_r_n_8), .AD3(rom_addr0_r_n_9), .AD4(rom_addr0_r_n_10), 
            .AD5(rom_addr0_r_n_11), .DO0(rom_dout_8_ffin)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    defparam triglut_1_0_8.initval = 64'b0000000000000000000000000000000000000000000000000000000000000111;
    ROM64X1A triglut_1_0_7 (.AD0(rom_addr0_r_n_6), .AD1(rom_addr0_r_n_7), 
            .AD2(rom_addr0_r_n_8), .AD3(rom_addr0_r_n_9), .AD4(rom_addr0_r_n_10), 
            .AD5(rom_addr0_r_n_11), .DO0(rom_dout_7_ffin)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    defparam triglut_1_0_7.initval = 64'b0000000000000000000001111111111111111111111111111111111111111000;
    ROM64X1A triglut_1_0_6 (.AD0(rom_addr0_r_n_6), .AD1(rom_addr0_r_n_7), 
            .AD2(rom_addr0_r_n_8), .AD3(rom_addr0_r_n_9), .AD4(rom_addr0_r_n_10), 
            .AD5(rom_addr0_r_n_11), .DO0(rom_dout_6_ffin)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    defparam triglut_1_0_6.initval = 64'b0000000000111111111110000000000000111111111111111111111111111000;
    ROM64X1A triglut_1_0_5 (.AD0(rom_addr0_r_n_6), .AD1(rom_addr0_r_n_7), 
            .AD2(rom_addr0_r_n_8), .AD3(rom_addr0_r_n_9), .AD4(rom_addr0_r_n_10), 
            .AD5(rom_addr0_r_n_11), .DO0(rom_dout_5_ffin)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    defparam triglut_1_0_5.initval = 64'b0000011111000001111110000001111111000000000111111111111111111000;
    ROM64X1A triglut_1_0_4 (.AD0(rom_addr0_r_n_6), .AD1(rom_addr0_r_n_7), 
            .AD2(rom_addr0_r_n_8), .AD3(rom_addr0_r_n_9), .AD4(rom_addr0_r_n_10), 
            .AD5(rom_addr0_r_n_11), .DO0(rom_dout_4_ffin)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    defparam triglut_1_0_4.initval = 64'b0011100111001110001110001110001111000011111000000111111111111000;
    ROM64X1A triglut_1_0_3 (.AD0(rom_addr0_r_n_6), .AD1(rom_addr0_r_n_7), 
            .AD2(rom_addr0_r_n_8), .AD3(rom_addr0_r_n_9), .AD4(rom_addr0_r_n_10), 
            .AD5(rom_addr0_r_n_11), .DO0(rom_dout_3_ffin)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    defparam triglut_1_0_3.initval = 64'b0101101011010010110110110110010011001100111000111000011111111000;
    ROM64X1A triglut_1_0_2 (.AD0(rom_addr0_r_n_6), .AD1(rom_addr0_r_n_7), 
            .AD2(rom_addr0_r_n_8), .AD3(rom_addr0_r_n_9), .AD4(rom_addr0_r_n_10), 
            .AD5(rom_addr0_r_n_11), .DO0(rom_dout_2_ffin)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    defparam triglut_1_0_2.initval = 64'b1100111001100110010011010010110101010101011011011001100011111000;
    ROM64X1A triglut_1_0_1 (.AD0(rom_addr0_r_n_6), .AD1(rom_addr0_r_n_7), 
            .AD2(rom_addr0_r_n_8), .AD3(rom_addr0_r_n_9), .AD4(rom_addr0_r_n_10), 
            .AD5(rom_addr0_r_n_11), .DO0(rom_dout_1_ffin)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    defparam triglut_1_0_1.initval = 64'b1010110101010101001010011001100001111100001101101010101100111000;
    ROM64X1A triglut_1_0_0 (.AD0(rom_addr0_r_n_6), .AD1(rom_addr0_r_n_7), 
            .AD2(rom_addr0_r_n_8), .AD3(rom_addr0_r_n_9), .AD4(rom_addr0_r_n_10), 
            .AD5(rom_addr0_r_n_11), .DO0(rom_dout_ffin)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=6, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=26, LSE_RLINE=32 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds.v(26[15] 32[2])
    defparam triglut_1_0_0.initval = 64'b0111100000000000011100101010101110000011001011011111100101011000;
    
endmodule
//
// Verilog Description of module \button(N=2'b10) 
//

module \button(N=2'b10)  (clk_c, key_sec_pre, key_sec, key_c_0, GND_net, 
            key_c_1, n1653, \curr_wave_st[0] , n1654, n1649, n1647) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    output [1:0]key_sec_pre;
    output [1:0]key_sec;
    input key_c_0;
    input GND_net;
    input key_c_1;
    output n1653;
    input \curr_wave_st[0] ;
    input n1654;
    output n1649;
    output n1647;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(3[8:11])
    wire [1:0]key_rst_pre;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(10[19:30])
    wire [1:0]key_rst;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(11[19:26])
    
    wire clk_c_enable_3, n21, n34, n30, n22;
    wire [17:0]cnt;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(30[14:17])
    
    wire n31, n28, n1367;
    wire [17:0]n77;
    
    wire n1368, n1363, n1364, n1362, cnt_17__N_86, n1366, n1365, 
        n1370, n1369;
    
    FD1S3AY key_rst_pre_i0 (.D(key_rst[0]), .CK(clk_c), .Q(key_rst_pre[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=26, LSE_RCOL=6, LSE_LLINE=163, LSE_RLINE=168 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(22[8] 25[6])
    defparam key_rst_pre_i0.GSR = "ENABLED";
    FD1S3AY key_sec_pre_i0 (.D(key_sec[0]), .CK(clk_c), .Q(key_sec_pre[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=26, LSE_RCOL=6, LSE_LLINE=163, LSE_RLINE=168 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(60[4:27])
    defparam key_sec_pre_i0.GSR = "ENABLED";
    FD1S3AY key_rst_i0 (.D(key_c_0), .CK(clk_c), .Q(key_rst[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=26, LSE_RCOL=6, LSE_LLINE=163, LSE_RLINE=168 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(22[8] 25[6])
    defparam key_rst_i0.GSR = "ENABLED";
    FD1P3AY key_sec_i0_i0 (.D(key_c_0), .SP(clk_c_enable_3), .CK(clk_c), 
            .Q(key_sec[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=26, LSE_RCOL=6, LSE_LLINE=163, LSE_RLINE=168 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(52[8] 53[19])
    defparam key_sec_i0_i0.GSR = "ENABLED";
    LUT4 i17_4_lut (.A(n21), .B(n34), .C(n30), .D(n22), .Z(clk_c_enable_3)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i17_4_lut.init = 16'h8000;
    LUT4 i3_2_lut (.A(cnt[13]), .B(cnt[8]), .Z(n21)) /* synthesis lut_function=(A (B)) */ ;
    defparam i3_2_lut.init = 16'h8888;
    LUT4 i16_4_lut (.A(n31), .B(cnt[9]), .C(n28), .D(cnt[2]), .Z(n34)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i16_4_lut.init = 16'h8000;
    CCU2D cnt_220_add_4_13 (.A0(cnt[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt[12]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1367), .COUT(n1368), .S0(n77[11]), .S1(n77[12]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220_add_4_13.INIT0 = 16'hfaaa;
    defparam cnt_220_add_4_13.INIT1 = 16'hfaaa;
    defparam cnt_220_add_4_13.INJECT1_0 = "NO";
    defparam cnt_220_add_4_13.INJECT1_1 = "NO";
    LUT4 i12_4_lut (.A(cnt[3]), .B(cnt[10]), .C(cnt[5]), .D(cnt[0]), 
         .Z(n30)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i12_4_lut.init = 16'h8000;
    LUT4 i4_2_lut (.A(cnt[7]), .B(cnt[12]), .Z(n22)) /* synthesis lut_function=(A (B)) */ ;
    defparam i4_2_lut.init = 16'h8888;
    LUT4 i13_4_lut (.A(cnt[17]), .B(cnt[15]), .C(cnt[16]), .D(cnt[4]), 
         .Z(n31)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i13_4_lut.init = 16'h8000;
    CCU2D cnt_220_add_4_5 (.A0(cnt[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n1363), 
          .COUT(n1364), .S0(n77[3]), .S1(n77[4]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220_add_4_5.INIT0 = 16'hfaaa;
    defparam cnt_220_add_4_5.INIT1 = 16'hfaaa;
    defparam cnt_220_add_4_5.INJECT1_0 = "NO";
    defparam cnt_220_add_4_5.INJECT1_1 = "NO";
    LUT4 i10_4_lut (.A(cnt[1]), .B(cnt[6]), .C(cnt[14]), .D(cnt[11]), 
         .Z(n28)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i10_4_lut.init = 16'h8000;
    CCU2D cnt_220_add_4_3 (.A0(cnt[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n1362), 
          .COUT(n1363), .S0(n77[1]), .S1(n77[2]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220_add_4_3.INIT0 = 16'hfaaa;
    defparam cnt_220_add_4_3.INIT1 = 16'hfaaa;
    defparam cnt_220_add_4_3.INJECT1_0 = "NO";
    defparam cnt_220_add_4_3.INJECT1_1 = "NO";
    FD1S3IX cnt_220__i0 (.D(n77[0]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[0])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i0.GSR = "ENABLED";
    FD1P3AY key_sec_i0_i1 (.D(key_c_1), .SP(clk_c_enable_3), .CK(clk_c), 
            .Q(key_sec[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=26, LSE_RCOL=6, LSE_LLINE=163, LSE_RLINE=168 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(52[8] 53[19])
    defparam key_sec_i0_i1.GSR = "ENABLED";
    CCU2D cnt_220_add_4_11 (.A0(cnt[9]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n1366), 
          .COUT(n1367), .S0(n77[9]), .S1(n77[10]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220_add_4_11.INIT0 = 16'hfaaa;
    defparam cnt_220_add_4_11.INIT1 = 16'hfaaa;
    defparam cnt_220_add_4_11.INJECT1_0 = "NO";
    defparam cnt_220_add_4_11.INJECT1_1 = "NO";
    CCU2D cnt_220_add_4_9 (.A0(cnt[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n1365), 
          .COUT(n1366), .S0(n77[7]), .S1(n77[8]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220_add_4_9.INIT0 = 16'hfaaa;
    defparam cnt_220_add_4_9.INIT1 = 16'hfaaa;
    defparam cnt_220_add_4_9.INJECT1_0 = "NO";
    defparam cnt_220_add_4_9.INJECT1_1 = "NO";
    CCU2D cnt_220_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n1362), 
          .S1(n77[0]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220_add_4_1.INIT0 = 16'hF000;
    defparam cnt_220_add_4_1.INIT1 = 16'h0555;
    defparam cnt_220_add_4_1.INJECT1_0 = "NO";
    defparam cnt_220_add_4_1.INJECT1_1 = "NO";
    FD1S3AY key_rst_i1 (.D(key_c_1), .CK(clk_c), .Q(key_rst[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=26, LSE_RCOL=6, LSE_LLINE=163, LSE_RLINE=168 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(22[8] 25[6])
    defparam key_rst_i1.GSR = "ENABLED";
    FD1S3AY key_sec_pre_i1 (.D(key_sec[1]), .CK(clk_c), .Q(key_sec_pre[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=26, LSE_RCOL=6, LSE_LLINE=163, LSE_RLINE=168 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(60[4:27])
    defparam key_sec_pre_i1.GSR = "ENABLED";
    FD1S3AY key_rst_pre_i1 (.D(key_rst[1]), .CK(clk_c), .Q(key_rst_pre[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=26, LSE_RCOL=6, LSE_LLINE=163, LSE_RLINE=168 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(22[8] 25[6])
    defparam key_rst_pre_i1.GSR = "ENABLED";
    FD1S3IX cnt_220__i17 (.D(n77[17]), .CK(clk_c), .CD(cnt_17__N_86), 
            .Q(cnt[17])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i17.GSR = "ENABLED";
    CCU2D cnt_220_add_4_19 (.A0(cnt[17]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1370), .S0(n77[17]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220_add_4_19.INIT0 = 16'hfaaa;
    defparam cnt_220_add_4_19.INIT1 = 16'h0000;
    defparam cnt_220_add_4_19.INJECT1_0 = "NO";
    defparam cnt_220_add_4_19.INJECT1_1 = "NO";
    CCU2D cnt_220_add_4_17 (.A0(cnt[15]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt[16]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1369), .COUT(n1370), .S0(n77[15]), .S1(n77[16]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220_add_4_17.INIT0 = 16'hfaaa;
    defparam cnt_220_add_4_17.INIT1 = 16'hfaaa;
    defparam cnt_220_add_4_17.INJECT1_0 = "NO";
    defparam cnt_220_add_4_17.INJECT1_1 = "NO";
    CCU2D cnt_220_add_4_15 (.A0(cnt[13]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt[14]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1368), .COUT(n1369), .S0(n77[13]), .S1(n77[14]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220_add_4_15.INIT0 = 16'hfaaa;
    defparam cnt_220_add_4_15.INIT1 = 16'hfaaa;
    defparam cnt_220_add_4_15.INJECT1_0 = "NO";
    defparam cnt_220_add_4_15.INJECT1_1 = "NO";
    FD1S3IX cnt_220__i16 (.D(n77[16]), .CK(clk_c), .CD(cnt_17__N_86), 
            .Q(cnt[16])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i16.GSR = "ENABLED";
    FD1S3IX cnt_220__i15 (.D(n77[15]), .CK(clk_c), .CD(cnt_17__N_86), 
            .Q(cnt[15])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i15.GSR = "ENABLED";
    FD1S3IX cnt_220__i14 (.D(n77[14]), .CK(clk_c), .CD(cnt_17__N_86), 
            .Q(cnt[14])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i14.GSR = "ENABLED";
    FD1S3IX cnt_220__i13 (.D(n77[13]), .CK(clk_c), .CD(cnt_17__N_86), 
            .Q(cnt[13])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i13.GSR = "ENABLED";
    FD1S3IX cnt_220__i12 (.D(n77[12]), .CK(clk_c), .CD(cnt_17__N_86), 
            .Q(cnt[12])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i12.GSR = "ENABLED";
    FD1S3IX cnt_220__i11 (.D(n77[11]), .CK(clk_c), .CD(cnt_17__N_86), 
            .Q(cnt[11])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i11.GSR = "ENABLED";
    FD1S3IX cnt_220__i10 (.D(n77[10]), .CK(clk_c), .CD(cnt_17__N_86), 
            .Q(cnt[10])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i10.GSR = "ENABLED";
    FD1S3IX cnt_220__i9 (.D(n77[9]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[9])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i9.GSR = "ENABLED";
    FD1S3IX cnt_220__i8 (.D(n77[8]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[8])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i8.GSR = "ENABLED";
    FD1S3IX cnt_220__i7 (.D(n77[7]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[7])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i7.GSR = "ENABLED";
    FD1S3IX cnt_220__i6 (.D(n77[6]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[6])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i6.GSR = "ENABLED";
    FD1S3IX cnt_220__i5 (.D(n77[5]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[5])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i5.GSR = "ENABLED";
    FD1S3IX cnt_220__i4 (.D(n77[4]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[4])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i4.GSR = "ENABLED";
    FD1S3IX cnt_220__i3 (.D(n77[3]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[3])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i3.GSR = "ENABLED";
    FD1S3IX cnt_220__i2 (.D(n77[2]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[2])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i2.GSR = "ENABLED";
    FD1S3IX cnt_220__i1 (.D(n77[1]), .CK(clk_c), .CD(cnt_17__N_86), .Q(cnt[1])) /* synthesis syn_use_carry_chain=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220__i1.GSR = "ENABLED";
    CCU2D cnt_220_add_4_7 (.A0(cnt[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n1364), 
          .COUT(n1365), .S0(n77[5]), .S1(n77[6]));   // c:/users/10798/desktop/fpga/dds_demo02/button.v(40[10:20])
    defparam cnt_220_add_4_7.INIT0 = 16'hfaaa;
    defparam cnt_220_add_4_7.INIT1 = 16'hfaaa;
    defparam cnt_220_add_4_7.INJECT1_0 = "NO";
    defparam cnt_220_add_4_7.INJECT1_1 = "NO";
    LUT4 key_sec_pre_1__I_0_i2_2_lut_rep_19 (.A(key_sec_pre[1]), .B(key_sec[1]), 
         .Z(n1653)) /* synthesis lut_function=(!((B)+!A)) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(62[21:45])
    defparam key_sec_pre_1__I_0_i2_2_lut_rep_19.init = 16'h2222;
    LUT4 i717_3_lut_rep_15_4_lut (.A(key_sec_pre[1]), .B(key_sec[1]), .C(\curr_wave_st[0] ), 
         .D(n1654), .Z(n1649)) /* synthesis lut_function=(!(A (B (C (D))+!B !(C+!(D)))+!A (C (D)))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(62[21:45])
    defparam i717_3_lut_rep_15_4_lut.init = 16'h2dff;
    LUT4 mux_131_i3_3_lut_4_lut_3_lut_rep_13_4_lut (.A(key_sec_pre[1]), .B(key_sec[1]), 
         .C(\curr_wave_st[0] ), .D(n1654), .Z(n1647)) /* synthesis lut_function=(A (B (C+(D))+!B !(C (D)+!C !(D)))+!A (C+(D))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(62[21:45])
    defparam mux_131_i3_3_lut_4_lut_3_lut_rep_13_4_lut.init = 16'hdff0;
    LUT4 key_edge_1__I_0_i1_4_lut (.A(key_rst_pre[0]), .B(key_rst_pre[1]), 
         .C(key_rst[0]), .D(key_rst[1]), .Z(cnt_17__N_86)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A ((D)+!B))) */ ;   // c:/users/10798/desktop/fpga/dds_demo02/button.v(37[11:19])
    defparam key_edge_1__I_0_i1_4_lut.init = 16'h0ace;
    
endmodule
//
// Verilog Description of module dds_pll
//

module dds_pll (clk_c, dac_clk_c, GND_net) /* synthesis NGD_DRC_MASK=1, syn_module_defined=1 */ ;
    input clk_c;
    output dac_clk_c;
    input GND_net;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(3[8:11])
    wire dac_clk_c /* synthesis SET_AS_NETWORK=dac_clk_c, is_clock=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(11[13:20])
    
    EHXPLLJ PLLInst_0 (.CLKI(clk_c), .CLKFB(dac_clk_c), .PHASESEL0(GND_net), 
            .PHASESEL1(GND_net), .PHASEDIR(GND_net), .PHASESTEP(GND_net), 
            .LOADREG(GND_net), .STDBY(GND_net), .PLLWAKESYNC(GND_net), 
            .RST(GND_net), .RESETC(GND_net), .RESETD(GND_net), .RESETM(GND_net), 
            .ENCLKOP(GND_net), .ENCLKOS(GND_net), .ENCLKOS2(GND_net), 
            .ENCLKOS3(GND_net), .PLLCLK(GND_net), .PLLRST(GND_net), .PLLSTB(GND_net), 
            .PLLWE(GND_net), .PLLDATI0(GND_net), .PLLDATI1(GND_net), .PLLDATI2(GND_net), 
            .PLLDATI3(GND_net), .PLLDATI4(GND_net), .PLLDATI5(GND_net), 
            .PLLDATI6(GND_net), .PLLDATI7(GND_net), .PLLADDR0(GND_net), 
            .PLLADDR1(GND_net), .PLLADDR2(GND_net), .PLLADDR3(GND_net), 
            .PLLADDR4(GND_net), .CLKOP(dac_clk_c)) /* synthesis FREQUENCY_PIN_CLKOP="120.000000", FREQUENCY_PIN_CLKI="12.000000", ICP_CURRENT="7", LPF_RESISTOR="8", syn_instantiated=1, LSE_LINE_FILE_ID=3, LSE_LCOL=10, LSE_RCOL=52, LSE_LLINE=207, LSE_RLINE=207 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(207[10:52])
    defparam PLLInst_0.CLKI_DIV = 1;
    defparam PLLInst_0.CLKFB_DIV = 10;
    defparam PLLInst_0.CLKOP_DIV = 4;
    defparam PLLInst_0.CLKOS_DIV = 1;
    defparam PLLInst_0.CLKOS2_DIV = 1;
    defparam PLLInst_0.CLKOS3_DIV = 1;
    defparam PLLInst_0.CLKOP_ENABLE = "ENABLED";
    defparam PLLInst_0.CLKOS_ENABLE = "DISABLED";
    defparam PLLInst_0.CLKOS2_ENABLE = "DISABLED";
    defparam PLLInst_0.CLKOS3_ENABLE = "DISABLED";
    defparam PLLInst_0.VCO_BYPASS_A0 = "DISABLED";
    defparam PLLInst_0.VCO_BYPASS_B0 = "DISABLED";
    defparam PLLInst_0.VCO_BYPASS_C0 = "DISABLED";
    defparam PLLInst_0.VCO_BYPASS_D0 = "DISABLED";
    defparam PLLInst_0.CLKOP_CPHASE = 3;
    defparam PLLInst_0.CLKOS_CPHASE = 0;
    defparam PLLInst_0.CLKOS2_CPHASE = 0;
    defparam PLLInst_0.CLKOS3_CPHASE = 0;
    defparam PLLInst_0.CLKOP_FPHASE = 0;
    defparam PLLInst_0.CLKOS_FPHASE = 0;
    defparam PLLInst_0.CLKOS2_FPHASE = 0;
    defparam PLLInst_0.CLKOS3_FPHASE = 0;
    defparam PLLInst_0.FEEDBK_PATH = "CLKOP";
    defparam PLLInst_0.FRACN_ENABLE = "DISABLED";
    defparam PLLInst_0.FRACN_DIV = 0;
    defparam PLLInst_0.CLKOP_TRIM_POL = "RISING";
    defparam PLLInst_0.CLKOP_TRIM_DELAY = 0;
    defparam PLLInst_0.CLKOS_TRIM_POL = "FALLING";
    defparam PLLInst_0.CLKOS_TRIM_DELAY = 0;
    defparam PLLInst_0.PLL_USE_WB = "DISABLED";
    defparam PLLInst_0.PREDIVIDER_MUXA1 = 0;
    defparam PLLInst_0.PREDIVIDER_MUXB1 = 0;
    defparam PLLInst_0.PREDIVIDER_MUXC1 = 0;
    defparam PLLInst_0.PREDIVIDER_MUXD1 = 0;
    defparam PLLInst_0.OUTDIVIDER_MUXA2 = "DIVA";
    defparam PLLInst_0.OUTDIVIDER_MUXB2 = "DIVB";
    defparam PLLInst_0.OUTDIVIDER_MUXC2 = "DIVC";
    defparam PLLInst_0.OUTDIVIDER_MUXD2 = "DIVD";
    defparam PLLInst_0.PLL_LOCK_MODE = 0;
    defparam PLLInst_0.STDBY_ENABLE = "DISABLED";
    defparam PLLInst_0.DPHASE_SOURCE = "DISABLED";
    defparam PLLInst_0.PLLRST_ENA = "DISABLED";
    defparam PLLInst_0.MRST_ENA = "DISABLED";
    defparam PLLInst_0.DCRST_ENA = "DISABLED";
    defparam PLLInst_0.DDRST_ENA = "DISABLED";
    defparam PLLInst_0.INTFB_WAKE = "DISABLED";
    
endmodule
//
// Verilog Description of module dds_am
//

module dds_am (dds_am_factor, clk_c, dds_am_factor_7__N_231, enc_pulse_r, 
            enc_pulse_l, GND_net) /* synthesis syn_module_defined=1 */ ;
    output [7:0]dds_am_factor;
    input clk_c;
    input dds_am_factor_7__N_231;
    input enc_pulse_r;
    input enc_pulse_l;
    input GND_net;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/main.v(3[8:11])
    wire [7:0]dds_am_factor_7__N_232;
    
    wire n1343, n1344, n1342, n1345;
    
    FD1P3AY dds_am_factor_i0 (.D(dds_am_factor_7__N_232[0]), .SP(dds_am_factor_7__N_231), 
            .CK(clk_c), .Q(dds_am_factor[0])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=195, LSE_RLINE=202 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_am.v(19[3] 29[10])
    defparam dds_am_factor_i0.GSR = "ENABLED";
    CCU2D add_219_5 (.A0(enc_pulse_r), .B0(enc_pulse_l), .C0(dds_am_factor[3]), 
          .D0(GND_net), .A1(dds_am_factor[4]), .B1(enc_pulse_l), .C1(GND_net), 
          .D1(GND_net), .CIN(n1343), .COUT(n1344), .S0(dds_am_factor_7__N_232[3]), 
          .S1(dds_am_factor_7__N_232[4]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_am.v(23[10] 26[37])
    defparam add_219_5.INIT0 = 16'hd2d2;
    defparam add_219_5.INIT1 = 16'h5666;
    defparam add_219_5.INJECT1_0 = "NO";
    defparam add_219_5.INJECT1_1 = "NO";
    FD1P3AY dds_am_factor_i7 (.D(dds_am_factor_7__N_232[7]), .SP(dds_am_factor_7__N_231), 
            .CK(clk_c), .Q(dds_am_factor[7])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=195, LSE_RLINE=202 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_am.v(19[3] 29[10])
    defparam dds_am_factor_i7.GSR = "ENABLED";
    FD1P3AY dds_am_factor_i6 (.D(dds_am_factor_7__N_232[6]), .SP(dds_am_factor_7__N_231), 
            .CK(clk_c), .Q(dds_am_factor[6])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=195, LSE_RLINE=202 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_am.v(19[3] 29[10])
    defparam dds_am_factor_i6.GSR = "ENABLED";
    FD1P3AY dds_am_factor_i5 (.D(dds_am_factor_7__N_232[5]), .SP(dds_am_factor_7__N_231), 
            .CK(clk_c), .Q(dds_am_factor[5])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=195, LSE_RLINE=202 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_am.v(19[3] 29[10])
    defparam dds_am_factor_i5.GSR = "ENABLED";
    FD1P3AY dds_am_factor_i4 (.D(dds_am_factor_7__N_232[4]), .SP(dds_am_factor_7__N_231), 
            .CK(clk_c), .Q(dds_am_factor[4])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=195, LSE_RLINE=202 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_am.v(19[3] 29[10])
    defparam dds_am_factor_i4.GSR = "ENABLED";
    FD1P3AY dds_am_factor_i3 (.D(dds_am_factor_7__N_232[3]), .SP(dds_am_factor_7__N_231), 
            .CK(clk_c), .Q(dds_am_factor[3])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=195, LSE_RLINE=202 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_am.v(19[3] 29[10])
    defparam dds_am_factor_i3.GSR = "ENABLED";
    FD1P3AY dds_am_factor_i2 (.D(dds_am_factor_7__N_232[2]), .SP(dds_am_factor_7__N_231), 
            .CK(clk_c), .Q(dds_am_factor[2])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=195, LSE_RLINE=202 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_am.v(19[3] 29[10])
    defparam dds_am_factor_i2.GSR = "ENABLED";
    FD1P3AY dds_am_factor_i1 (.D(dds_am_factor_7__N_232[1]), .SP(dds_am_factor_7__N_231), 
            .CK(clk_c), .Q(dds_am_factor[1])) /* synthesis LSE_LINE_FILE_ID=3, LSE_LCOL=9, LSE_RCOL=3, LSE_LLINE=195, LSE_RLINE=202 */ ;   // c:/users/10798/desktop/fpga/dds_demo02/dds_am.v(19[3] 29[10])
    defparam dds_am_factor_i1.GSR = "ENABLED";
    CCU2D add_219_1 (.A0(enc_pulse_l), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(enc_pulse_r), .B1(enc_pulse_l), .C1(dds_am_factor[0]), .D1(GND_net), 
          .COUT(n1342), .S1(dds_am_factor_7__N_232[0]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_am.v(23[10] 26[37])
    defparam add_219_1.INIT0 = 16'h5000;
    defparam add_219_1.INIT1 = 16'hd2d2;
    defparam add_219_1.INJECT1_0 = "NO";
    defparam add_219_1.INJECT1_1 = "NO";
    CCU2D add_219_9 (.A0(dds_am_factor[7]), .B0(enc_pulse_l), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n1345), .S0(dds_am_factor_7__N_232[7]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_am.v(23[10] 26[37])
    defparam add_219_9.INIT0 = 16'h5666;
    defparam add_219_9.INIT1 = 16'h0000;
    defparam add_219_9.INJECT1_0 = "NO";
    defparam add_219_9.INJECT1_1 = "NO";
    CCU2D add_219_7 (.A0(dds_am_factor[5]), .B0(enc_pulse_l), .C0(GND_net), 
          .D0(GND_net), .A1(dds_am_factor[6]), .B1(enc_pulse_l), .C1(GND_net), 
          .D1(GND_net), .CIN(n1344), .COUT(n1345), .S0(dds_am_factor_7__N_232[5]), 
          .S1(dds_am_factor_7__N_232[6]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_am.v(23[10] 26[37])
    defparam add_219_7.INIT0 = 16'h5666;
    defparam add_219_7.INIT1 = 16'h5666;
    defparam add_219_7.INJECT1_0 = "NO";
    defparam add_219_7.INJECT1_1 = "NO";
    CCU2D add_219_3 (.A0(enc_pulse_r), .B0(enc_pulse_l), .C0(dds_am_factor[1]), 
          .D0(GND_net), .A1(enc_pulse_r), .B1(enc_pulse_l), .C1(dds_am_factor[2]), 
          .D1(GND_net), .CIN(n1342), .COUT(n1343), .S0(dds_am_factor_7__N_232[1]), 
          .S1(dds_am_factor_7__N_232[2]));   // c:/users/10798/desktop/fpga/dds_demo02/dds_am.v(23[10] 26[37])
    defparam add_219_3.INIT0 = 16'hd2d2;
    defparam add_219_3.INIT1 = 16'hd2d2;
    defparam add_219_3.INJECT1_0 = "NO";
    defparam add_219_3.INJECT1_1 = "NO";
    
endmodule
