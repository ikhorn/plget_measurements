set ylabel 'packets period (between packet time, gap), us'
set xlabel 'packet number'

set key box
set grid

file_name1 = 'am572_ipgap_CBS_CPDMA_classA_parB_parEth1A_parEth1B_1000.data'
file_name2 = 'am572_ipgap_CBS_CPDMA_classA_parB_parEth0A_parEth0B_100.data'
file_name3 = 'am572_ipgap_CBS_CPDMA_classB_parA_parEth1A_parEth1B_1000.data'
file_name4 = 'am572_ipgap_CBS_CPDMA_classB_parA_parEth0A_parEth0B_100.data'

set title "am572x, \
class A0+B0+A1+B1, \
CBS, \
CPDMA, \
Eth0 1000Mbps, Eth1 100Mbps, \
packet = `sed -n '/packet\ size/s/\(^.*\): \(.\)/\2/p' "@file_name1"`B, \
\nrate A0 = `sed -n '/RATE/s/\(^.*\)PPS = \(.\)/\2/p' "@file_name1"`pps, \
`sed -n '/RATE\ =/s/\(^.*\)= \(.*\),\(.*\)/\2/p' "@file_name1"`, \
min A0 = `sed -n '/min\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name1"`, \
max A0 = `sed -n '/max\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name1"`, \
p-t-p A0 = `sed -n '/peak-to-peak/s/\(^.*\)= \(.\)/\2/p' "@file_name1"`, \
\nrate A1 = `sed -n '/RATE/s/\(^.*\)PPS = \(.\)/\2/p' "@file_name2"`pps, \
`sed -n '/RATE\ =/s/\(^.*\)= \(.*\),\(.*\)/\2/p' "@file_name2"`, \
min A1 = `sed -n '/min\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name2"`, \
max A1 = `sed -n '/max\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name2"`, \
p-t-p A1 = `sed -n '/peak-to-peak/s/\(^.*\)= \(.\)/\2/p' "@file_name2"`, \
\nrate B0 = `sed -n '/RATE/s/\(^.*\)PPS = \(.\)/\2/p' "@file_name3"`pps, \
`sed -n '/RATE\ =/s/\(^.*\)= \(.*\),\(.*\)/\2/p' "@file_name3"`, \
min B0 = `sed -n '/min\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name3"`, \
max B0 = `sed -n '/max\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name3"`, \
p-t-p B0 = `sed -n '/peak-to-peak/s/\(^.*\)= \(.\)/\2/p' "@file_name3"`, \
\nrate B1 = `sed -n '/RATE/s/\(^.*\)PPS = \(.\)/\2/p' "@file_name4"`pps, \
`sed -n '/RATE\ =/s/\(^.*\)= \(.*\),\(.*\)/\2/p' "@file_name4"`, \
min B1 = `sed -n '/min\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name4"`, \
max B1 = `sed -n '/max\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name4"`, \
p-t-p B1 = `sed -n '/peak-to-peak/s/\(^.*\)= \(.\)/\2/p' "@file_name4"`"

set terminal qt 0
plot[4000:4050] "< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name1 \
with points pointtype 7 black title "class A Eth0 period, us", \
"< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name2 \
with points pointtype 5 lc rgb "red" title "class A Eth1 period, us", \
"< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name3 \
with points pointtype 3 lc rgb "blue" title "class B Eth0 period, us", \
"< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name4 \
with points pointtype 1 lc rgb "green" title "class B Eth1 period, us", \

set terminal qt 1
plot[4950:5050] "< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name1 \
with points pointtype 7 black title "class A Eth0 period, us", \
"< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name2 \
with points pointtype 5 lc rgb "red" title "class A Eth1 period, us", \
"< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name3 \
with points pointtype 3 lc rgb "blue" title "class B Eth0 period, us", \
"< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name4 \
with points pointtype 1 lc rgb "green" title "class B Eth1 period, us", \

set terminal qt 2
plot[6950:7050] "< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name1 \
with points pointtype 7 black title "class A Eth0 period, us", \
"< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name2 \
with points pointtype 5 lc rgb "red" title "class A Eth1 period, us", \
"< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name3 \
with points pointtype 3 lc rgb "blue" title "class B Eth0 period, us", \
"< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name4 \
with points pointtype 1 lc rgb "green" title "class B Eth1 period, us", \

set terminal qt 3
plot[1:10000] "< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name1 \
with points pointtype 7 black title "class A Eth0 period, us", \
"< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name2 \
with points pointtype 5 lc rgb "red" title "class A Eth1 period, us", \
"< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name3 \
with points pointtype 3 lc rgb "blue" title "class B Eth0 period, us", \
"< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name4 \
with points pointtype 1 lc rgb "green" title "class B Eth1 period, us", \
