read_libs /home/ms2025019_vaishnavi/cadence/pdks/cadence_45nm/lib/fast_vdd1v0_basicCells.lib
read_hdl /home/ms2025019_vaishnavi/counter_pd_flow/counter.v
elaborate
read_sdc /home/ms2025019_vaishnavi/counter_pd_flow/counter_synth.sdc
set_db syn_generic_effort high
set_db syn_map_effort high
set_db syn_opt_effort high
syn_generic
syn_map
syn_opt
write_hdl -lec > /home/ms2025019_vaishnavi/counter_pd_flow/hdl_synth.v
write_do_lec -golden_design /home/ms2025019_vaishnavi/counter_pd_flow/counter.v -revised_design /home/ms2025019_vaishnavi/counter_pd_flow/hdl_synth_netlist.v > /home/ms2025019_vaishnavi/counter_pd_flow/counter_opt.do
lec -lpgx -nogui -dofile /home/ms2025019_vaishnavi/counter_pd_flow/counter_opt.do

