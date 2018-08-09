set ylabel 'packets period (between packet time, gap), us'
set xlabel 'packet number'

set key box
set grid

file_name1 = 'am572_ipgap_swCBS_CPDMA_classA_parB_parBE_1000.data'
file_name2 = 'am572_ipgap_swCBS_CPDMA_classB_parA_parBE_1000.data'

set title "am572x, \
class A+B+BE, \
ptpl2, \
CBS, \
CPDMA limit, \
itf speed = 1000Mbps, \
packet = `sed -n '/packet\ size/s/\(^.*\): \(.\)/\2/p' "@file_name1"`B, \
\nrate A = `sed -n '/RATE/s/\(^.*\)PPS = \(.\)/\2/p' "@file_name1"`pps, \
`sed -n '/RATE\ =/s/\(^.*\)= \(.*\),\(.*\)/\2/p' "@file_name1"`, \
min A = `sed -n '/min\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name1"`, \
max A = `sed -n '/max\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name1"`, \
p-t-p A = `sed -n '/peak-to-peak/s/\(^.*\)= \(.\)/\2/p' "@file_name1"`, \
\nrate B = `sed -n '/RATE/s/\(^.*\)PPS = \(.\)/\2/p' "@file_name2"`pps, \
`sed -n '/RATE\ =/s/\(^.*\)= \(.*\),\(.*\)/\2/p' "@file_name2"`, \
min B = `sed -n '/min\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name2"`, \
max B = `sed -n '/max\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name2"`, \
p-t-p B = `sed -n '/peak-to-peak/s/\(^.*\)= \(.\)/\2/p' "@file_name2"`"

set terminal qt 0
plot[4000:4050] "< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name1 \
with points pointtype 7 black title "class A period, us", \
"< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name2 \
with points pointtype 7 lc rgb "red" title "class B period, us", \

set terminal qt 1
plot[4950:5050] "< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name1 \
with points pointtype 7 black title "class A period, us", \
"< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name2 \
with points pointtype 7 lc rgb "red" title "class B period, us", \

set terminal qt 2
plot[6950:7050] "< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name1 \
with points pointtype 7 black title "class A period, us", \
"< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name2 \
with points pointtype 7 lc rgb "red" title "class B period, us", \

set terminal qt 3
plot[1:10000] "< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name1 \
with points pointtype 7 black title "class A period, us", \
"< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name2 \
with points pointtype 7 lc rgb "red" title "class B period, us", \
