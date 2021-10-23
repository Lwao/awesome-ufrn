onerror {quit -f}
vlib work
vlog -work work project3.vo
vlog -work work project3.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.project3_vlg_vec_tst
vcd file -direction project3.msim.vcd
vcd add -internal project3_vlg_vec_tst/*
vcd add -internal project3_vlg_vec_tst/i1/*
add wave /*
run -all
