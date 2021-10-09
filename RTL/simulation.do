force -freeze sim:/MIPSProcessor/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/MIPSProcessor/rst 0 0
force -freeze sim:/MIPSProcessor/rst 1 0
force -freeze sim:/MIPSProcessor/rst 0 10
force -freeze sim:/MIPSProcessor/rst 1 30
add wave -position insertpoint  \
sim:/MIPSProcessor/clk \
sim:/MIPSProcessor/rst \
sim:/MIPSProcessor/testDataOut