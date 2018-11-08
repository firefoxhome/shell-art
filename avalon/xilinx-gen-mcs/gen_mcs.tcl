#write_cfgmem -format mcs -interface SPIx1 -size 32 -loadbit "up 0x0 /home/fzx/fpga/a3206/p1/A3210-ap1.bit" -file /home/fzx/fpga/a3206/ap1/A3210-ap1.mcs
#write_cfgmem -format mcs -interface SPIx1 -size 32 -loadbit "up 0x0 /home/fzx/fpga/a3206/ap1.vcu110/A3210-ap1.bit" -file /home/fzx/fpga/a3206/ap1.vcu110/A3210-ap1.mcs
#write_cfgmem -format mcs -interface SPIx1 -size 32 -loadbit "up 0x0 /home/fzx/fpga/a3206/ap1_top/A3206-ap1-top.bit" -file /home/fzx/fpga/a3206/ap1_top/A3206-ap1-top.mcs
#write_cfgmem -format mcs -interface BPIx16 -size 128 -loadbit "up 0x0 /home/fzx/fpga/a3206/vc707/A3206-vc707.bit" -file /home/fzx/fpga/a3206/vc707/A3206-vc707.mcs
#write_cfgmem -format mcs -interface SPIx8 -size 32 -loadbit "up 0x0 /home/fzx/fpga/a3206/vcu110/A3206_vcu110.bit" -file /home/fzx/fpga/a3206/vcu110/A3206_vcu110.mcs
write_cfgmem -format mcs -interface SPIx1 -size 32 -loadbit "up 0x0 /home/fzx/fpga/a3206/ap1_top/A3210-ap1-top.bit" -file /home/fzx/fpga/a3206/ap1_top/A3210-ap1-top.mcs
