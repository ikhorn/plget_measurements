set ylabel 'packets period (between packet time, gap), us'
set xlabel 'packet number'

set key box
set grid

file_name1 = 'am572_ipgap_noCBS_CPDMA_classA_parBE_1000_2.data'

set title "am572x, cpsw, \
class A + BE, \
ptpl2, \
no CBS, \
CPDMA limit, \
itf speed = 1000Mbps, \
packet = `sed -n '/packet\ size/s/\(^.*\): \(.\)/\2/p' "@file_name1"`B, \
\nrate A = `sed -n '/RATE/s/\(^.*\)PPS = \(.\)/\2/p' "@file_name1"`pps, \
`sed -n '/RATE\ =/s/\(^.*\)= \(.*\),\(.*\)/\2/p' "@file_name1"`, \
min A = `sed -n '/min\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name1"`, \
max A = `sed -n '/max\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name1"`, \
p-t-p A = `sed -n '/peak-to-peak/s/\(^.*\)= \(.\)/\2/p' "@file_name1"`"

set terminal qt 0
plot[4000:4050] "< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name1 \
with points pointtype 7 black title "class A period, us"

set terminal qt 1
plot[4950:5050] "< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name1 \
with points pointtype 7 black title "class A period, us"

set terminal qt 2
plot[6950:7050] "< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name1 \
with points pointtype 7 black title "class A period, us"

set terminal qt 3
plot[1:10000] "< sed -e '0,/----/ d' -e '/----/,$ d' ". file_name1 \
with points pointtype 7 black title "class A period, us"
