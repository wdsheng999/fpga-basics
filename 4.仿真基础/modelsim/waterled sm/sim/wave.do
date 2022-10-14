onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group tb -radix hexadecimal /tb_waterled/clk
add wave -noupdate -expand -group tb -radix hexadecimal /tb_waterled/rstn
add wave -noupdate -expand -group tb -radix hexadecimal /tb_waterled/led_pluse
add wave -noupdate -expand -group tb -radix binary /tb_waterled/led
add wave -noupdate -radix hexadecimal /tb_waterled/waterled/statue_trig_2d
add wave -noupdate -expand -group waterled -radix hexadecimal /tb_waterled/waterled/clk
add wave -noupdate -expand -group waterled -radix hexadecimal /tb_waterled/waterled/rstn
add wave -noupdate -expand -group waterled -radix hexadecimal /tb_waterled/waterled/led_pluse
add wave -noupdate -expand -group waterled -radix hexadecimal /tb_waterled/waterled/led
add wave -noupdate -expand -group waterled -radix hexadecimal /tb_waterled/waterled/waterled_cnt
add wave -noupdate -expand -group waterled -radix hexadecimal /tb_waterled/waterled/statue_trig
add wave -noupdate -expand -group waterled -radix hexadecimal /tb_waterled/waterled/statue_trig_1d
add wave -noupdate -expand -group btnled -radix hexadecimal /tb_waterled/waterled/btnled/clk
add wave -noupdate -expand -group btnled -radix hexadecimal /tb_waterled/waterled/btnled/btn_in
add wave -noupdate -expand -group btnled -radix hexadecimal /tb_waterled/waterled/btnled/btnled
add wave -noupdate -expand -group btnled -radix hexadecimal /tb_waterled/waterled/btnled/time_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {189598 ps} 0} {{Cursor 2} {1214330000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 328
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1025392 ps}
