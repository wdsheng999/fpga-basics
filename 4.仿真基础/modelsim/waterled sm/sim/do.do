quit -sim

vlib work
vmap work work 
vlog -novopt -incr -work work "../tb/tb_waterled.v"
vlog -novopt -incr -work work "../src/waterled.v"
vlog -novopt -incr -work work "../src/btndeb.v"

vsim -t 100ps -novopt work.tb_waterled

#add wave -noupdate /tb/*
do wave.do

run 2ms