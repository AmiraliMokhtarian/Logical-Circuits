# read design 
read_verilog comparartor.v

# generic synthesis
synth -top comp4

# mapping to mycells.lib
dfflibmap -liberty mycells.lib
abc -liberty mycells.lib
clean

# write synthesized design
write_verilog -noattr synth.v
