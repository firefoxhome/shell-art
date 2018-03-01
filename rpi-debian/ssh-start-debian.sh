#!/bin/bash

# Manually start ssh
sudo /etc/init.d/ssh start

# Auto start ssh
sudo update-rc.d ssh enable # enable ssh
sudo update-rc.d ssh disable # disable ssh
