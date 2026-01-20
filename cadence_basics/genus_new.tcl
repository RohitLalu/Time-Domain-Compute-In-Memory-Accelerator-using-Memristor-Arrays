read_libs /home/rohit/project/cadence_basics/cadence_45nm/lib/fast_vdd1v0_basicCells.lib
read_hdl home/rohit/project/cadence_basics/counter.v
elaborate
read_sdc home/rohit/project/cadence_basics/counter_synth.sdc
set_db syn_generic_effort high
set_db syn_map_effort high
set_db syn_opt_effort high
syn_generic
syn_map
syn_opt
write_hdl -lec > home/rohit/project/cadence_basics/hdl_synth.v
write_do_lec -golden_design home/rohit/project/cadence_basics/counter.v -revised_design home/rohit/project/cadence_basics/hdl_synth_netlist.v > home/rohit/project/cadence_basics/counter_opt.do
lec -lpgx -nogui -dofile /home/rohit/project/cadence_basics/counter_opt.do

