#!/bin/bash
source /home/eda/xilinx/Xilinx_Vivado_SDK_2017.2_0616_1/Vivado/2017.2/settings64.sh
vivado -mode batch -source ./gen_mcs.tcl
