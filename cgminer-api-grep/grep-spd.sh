#!/bin/bash

# C_0: 0 is miner id.
# mask, check, roll, pass, fail, gate, pll0, pll1, pll2, pll3, pll4, pll5, pll6
./cgminer-api estats | grep "MM\ ID1\=Ver" | grep C_0 |sed 's/C_0_00/\nC_0_mask/g' | sed 's/C_0_01/\nC_0_check/g' | sed 's/C_0_02/\nC_0_roll/g' |  sed 's/C_0_03/\nC_0_pass/g' | sed 's/C_0_04/\nC_0_fail/g' | sed 's/C_0_05/\nC_0_gate/g' | sed 's/C_0_06/\nC_0_pll0/g' | sed 's/C_0_07/\nC_0_pll1/g' | sed 's/C_0_08/\nC_0_pll2/g'| sed 's/C_0_09/\nC_0_pll3/g' | sed 's/C_0_10/\nC_0_pll4/g' | sed 's/C_0_11/\nC_0_pll5/g' | sed 's/C_0_12/\nC_0_pll6/g' | sed 's/GHSmm00/\n/g' | grep C\_0
