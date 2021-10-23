onerror {quit -f}
vlib work
vlog -work work reg_mult.vo
vlog -work work reg_mult.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.reg_mult_vlg_vec_tst
vcd file -direction reg_mult.msim.vcd
vcd add -internal reg_mult_vlg_vec_tst/*
vcd add -internal reg_mult_vlg_vec_tst/i1/*
add wave /*
run -all
