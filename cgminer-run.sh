#!/bin/bash
# The middle can't note

./cgminer \
    -o stratum+tcp://stratum.kano.is:3333 -u canaan.3333 -p 1234 \
    --api-allow W:127.0.0.1 \
    --avalon8-fan 100 \
    --avalon8-voltage-level-offset 0 \
    --api-listen \
    $@ 2>./cg841log

#    -o stratum+tcp://192.168.1.200:3334 -O pvt \
#    --api-allow W:127.0.0.1,W:192.168.33.1 \
#    --avalon8-nonce-mask 32 \
#    --avalon8-smart-speed 1 \
#    --api-port 4028 \
#    --avalon8-freq 600 \
#    --avalon8-freq-sel 3 \
#    --avalon8-fan 100 \
#    --avalon8-voltage-level 0 \
#    --avalon8-voltage-level-offset 0 \
#    --api-listen \
#    $@ 2>./cg841log

#./cgminer8/cgminer -o stratum+tcp://192.168.1.200:3334 -O pvt \
# --avalon8-smart-speed 0 \
# --api-allow W:127.0.0.1,W:192.168.33.1 \
# --api-port 4028 --api-listen
# --avalon8-freq-sel 0
# --avalon8-th-pass 4096
# --avalon8-th-fail 4096
# --avalon8-th-init 32767
# --avalon8-th-ms 0
# --avalon8-th-timeout 0
# --avalon8-nonce-mask 32
# --avalon8-freq 100
