if {[catch {

# define run engine funtion
source [file join {D:/lscc/radiant/3.0} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) 1
set para(prj_dir) "E:/back/fpgaproject/ice40/RGB_led_lattice"
# synthesize IPs
# synthesize VMs
# synthesize top design
file delete -force -- RGB_led_lattice_impl_1.vm RGB_led_lattice_impl_1.ldc
run_engine_newmsg synthesis -f "RGB_led_lattice_impl_1_lattice.synproj"
run_postsyn [list -a iCE40UP -p iCE40UP5K -t SG48 -sp High-Performance_1.2V -oc Industrial -top -w -o RGB_led_lattice_impl_1_syn.udb RGB_led_lattice_impl_1.vm] "E:/back/fpgaproject/ice40/RGB_led_lattice/impl_1/RGB_led_lattice_impl_1.ldc"

} out]} {
   runtime_log $out
   exit 1
}
