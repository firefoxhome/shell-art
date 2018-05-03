#!/bin/bash

#tee命令用于将数据重定向到文件，另一方面还可以提供一份重定向数据的副本作为后续命令的stdin。
#简单的说就是把数据重定向到给定文件和屏幕上。

#serial datas into files
cu -l /dev/ttyUSB0 -s 115200 | tee files
