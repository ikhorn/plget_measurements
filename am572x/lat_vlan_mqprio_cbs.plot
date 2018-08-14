set ylabel 'latency, us'
set xlabel 'packet number'

set key box
set grid

file_name = 'lat_vlan_mqprio_cbs.data'

set title "am572x, cpsw, \
ptpl2, \
itf speed = 1000Mbps, \
\npacket = `sed -n '/packet\ size/s/\(^.*\): \(.\)/\2/p' "@file_name"`B, \
rate = `sed -n '/RATE/s/\(^.*\)PPS = \(.\)/\2/p' "@file_name"`pps, \
`sed -n '/RATE\ =/s/\(^.*\)= \(.*\),\(.*\)/\2/p' "@file_name"`, \
\nCompl: min = `sed -n '/min\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name" | sed -n '1p'`, \
max = `sed -n '/max\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name" | sed -n '1p'`, \
p-t-p = `sed -n '/peak-to-peak/s/\(^.*\)= \(.\)/\2/p' "@file_name" | sed -n '1p'` \
mean+-RMS = `sed -n '/mean\ +-\ RMS/s/\(^.*\)= \(.\)/\2/p' "@file_name" | sed -n '1p'` \
\nStack: min = `sed -n '/min\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name" | sed -n '2p'`, \
max = `sed -n '/max\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name" | sed -n '2p'`, \
p-t-p = `sed -n '/peak-to-peak/s/\(^.*\)= \(.\)/\2/p' "@file_name" | sed -n '2p'` \
mean+-RMS = `sed -n '/mean\ +-\ RMS/s/\(^.*\)= \(.\)/\2/p' "@file_name" | sed -n '2p'` \
\nVlan: min = `sed -n '/min\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name" | sed -n '3p'`, \
max = `sed -n '/max\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name" | sed -n '3p'`, \
p-t-p = `sed -n '/peak-to-peak/s/\(^.*\)= \(.\)/\2/p' "@file_name" | sed -n '3p'` \
mean+-RMS = `sed -n '/mean\ +-\ RMS/s/\(^.*\)= \(.\)/\2/p' "@file_name" | sed -n '3p'` \
\nDriver: min = `sed -n '/min\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name" | sed -n '4p'`, \
max = `sed -n '/max\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name" | sed -n '4p'`, \
p-t-p = `sed -n '/peak-to-peak/s/\(^.*\)= \(.\)/\2/p' "@file_name" | sed -n '4p'`, \
mean+-RMS = `sed -n '/mean\ +-\ RMS/s/\(^.*\)= \(.\)/\2/p' "@file_name" | sed -n '4p'`"

set terminal qt 0
plot[4000:4050] "< sed -e '0,/complete tx latency, us/ d' -e '/max/,$ d' -e '/----/ d' ". file_name \
with points pointtype 7 black title "complete tx latency (app -> wire), us", \
"< sed -e '0,/stack tx latency, us/ d' -e '/max/,$ d' -e '/----/ d' ". file_name \
with points pointtype 5 lc rgb "red" title "stack tx latency (app -> packet scheduler), us", \
"< sed -e '0,/between device (sched) tx latency, us/ d' -e '/max/,$ d' -e '/----/ d' ". file_name \
with points pointtype 3 lc rgb "blue" title "vlan layer tx latency (packet scheduler entrance -> driver entrance) , us", \
"< sed -e '0,/driver + packet scheduler tx latency, us/ d' -e '/max/,$ d' -e '/----/ d' ". file_name \
with points pointtype 1 lc rgb "green" title "driver tx latency (driver entrance -> wire) , us"

set terminal qt 1
plot[4950:5050] "< sed -e '0,/complete tx latency/ d' -e '/max/,$ d' -e '/----/ d' ". file_name \
with points pointtype 7 black title "complete tx latency (app -> wire), us", \
"< sed -e '0,/stack tx latency, us/ d' -e '/max/,$ d' -e '/----/ d' ". file_name \
with points pointtype 5 lc rgb "red" title "stack tx latency (app -> packet scheduler), us", \
"< sed -e '0,/between device (sched) tx latency, us/ d' -e '/max/,$ d' -e '/----/ d' ". file_name \
with points pointtype 3 lc rgb "blue" title "vlan layer tx latency (packet scheduler entrance -> driver entrance) , us", \
"< sed -e '0,/driver + packet scheduler tx latency, us/ d' -e '/max/,$ d' -e '/----/ d' ". file_name \
with points pointtype 1 lc rgb "green" title "driver tx latency (driver entrance -> wire) , us"

set terminal qt 2
plot[1:10000] "< sed -e '0,/complete tx latency/ d' -e '/max/,$ d' -e '/----/ d' ". file_name \
with points pointtype 7 black title "complete tx latency (app -> wire), us", \
"< sed -e '0,/stack tx latency, us/ d' -e '/max/,$ d' -e '/----/ d' ". file_name \
with points pointtype 5 lc rgb "red" title "stack tx latency (app -> packet scheduler), us", \
"< sed -e '0,/between device (sched) tx latency, us/ d' -e '/max/,$ d' -e '/----/ d' ". file_name \
with points pointtype 3 lc rgb "blue" title "vlan layer tx latency (packet scheduler entrance -> driver entrance) , us", \
"< sed -e '0,/driver + packet scheduler tx latency, us/ d' -e '/max/,$ d' -e '/----/ d' ". file_name \
with points pointtype 1 lc rgb "green" title "driver tx latency (driver entrance -> wire) , us"

set terminal qt 3
plot[1:100000] "< sed -e '0,/complete tx latency/ d' -e '/max/,$ d' -e '/----/ d' ". file_name \
with points pointtype 7 black title "complete tx latency (app -> wire), us", \
"< sed -e '0,/stack tx latency, us/ d' -e '/max/,$ d' -e '/----/ d' ". file_name \
with points pointtype 5 lc rgb "red" title "stack tx latency (app -> packet scheduler), us", \
"< sed -e '0,/between device (sched) tx latency, us/ d' -e '/max/,$ d' -e '/----/ d' ". file_name \
with points pointtype 3 lc rgb "blue" title "vlan layer tx latency (packet scheduler entrance -> driver entrance) , us", \
"< sed -e '0,/driver + packet scheduler tx latency, us/ d' -e '/max/,$ d' -e '/----/ d' ". file_name \
with points pointtype 1 lc rgb "green" title "driver tx latency (driver entrance -> wire) , us"
