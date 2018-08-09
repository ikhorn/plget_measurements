set ylabel 'packets period (between packet time, gap), us'
set xlabel 'packet number'

set key box
set grid

file_name = 'am572_ipgap_swCBS_CPDMA_classA_1000.data'

set title "am572x, cpsw, \
class A, \
ptpl2, \
CBS, \
CPDMA limit, \
itf speed = 1000Mbps, \
\npacket = `sed -n '/packet\ size/s/\(^.*\): \(.\)/\2/p' "@file_name"`B, \
rate = `sed -n '/RATE/s/\(^.*\)PPS = \(.\)/\2/p' "@file_name"`pps, \
`sed -n '/RATE\ =/s/\(^.*\)= \(.*\),\(.*\)/\2/p' "@file_name"`, \
min = `sed -n '/min\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name"`, \
max = `sed -n '/max\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name"`, \
p-t-p = `sed -n '/peak-to-peak/s/\(^.*\)= \(.\)/\2/p' "@file_name"`"

set terminal qt 0
plot[4000:4050] "< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name \
with points pointtype 7 black title "period, us"

set terminal qt 1
plot[4950:5050] "< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name \
with points pointtype 7 black title "period, us"

set terminal qt 2
plot[503:10000] "< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name \
with points pointtype 7 black title "period, us"

set terminal qt 3
plot[1:10000] "< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name \
with points pointtype 7 black title "period, us"
