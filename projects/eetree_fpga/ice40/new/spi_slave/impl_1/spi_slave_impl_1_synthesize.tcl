if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/2022.1} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) 1
set para(prj_dir) "E:/embeded/fpga learning/fpga-basics/projects/eetree_fpga/ice40/new/spi_slave"
# synthesize IPs
# synthesize VMs
# synthesize top design
file delete -force -- spi_slave_impl_1.vm spi_slave_impl_1.ldc
run_engine_newmsg synthesis -f "spi_slave_impl_1_lattice.synproj"
run_postsyn [list -a iCE40UP -p iCE40UP5K -t SG48 -sp High-Performance_1.2V -oc Industrial -top -w -o spi_slave_impl_1_syn.udb spi_slave_impl_1.vm] "E:/embeded/fpga learning/fpga-basics/projects/eetree_fpga/ice40/new/spi_slave/impl_1/spi_slave_impl_1.ldc"

} out]} {
   runtime_log $out
   exit 1
}
