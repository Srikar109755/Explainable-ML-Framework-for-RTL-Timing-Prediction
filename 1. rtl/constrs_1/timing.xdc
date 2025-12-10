# Define a 100 MHz clock on port clk
create_clock -period 10.000 -name sys_clk [get_ports clk]
