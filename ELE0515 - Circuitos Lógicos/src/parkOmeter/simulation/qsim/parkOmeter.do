onerror {quit -f}
vlib work
vlog -work work parkOmeter.vo
vlog -work work parkOmeter.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.parkOmeter_vlg_vec_tst
vcd file -direction parkOmeter.msim.vcd
vcd add -internal parkOmeter_vlg_vec_tst/*
vcd add -internal parkOmeter_vlg_vec_tst/i1/*
add wave /*
run -all
