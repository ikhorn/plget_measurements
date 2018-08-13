set ylabel 'packets period (between packet time, gap), us'
set xlabel 'packet number'

set key box
set grid

file_name1 = 'am572_ipgap_CBS_CPDMA_classA_parEth1A_1000.data'
file_name2 = 'am572_ipgap_CBS_CPDMA_classA_parEth0A_100.data'

set title "am572x, cpsw, \
class AEth0 + AEth1, \
ptpl2, \
CBS, \
CPDMA, \
itf speed = 1000,100Mbps, \
packet = `sed -n '/packet\ size/s/\(^.*\): \(.\)/\2/p' "@file_name1"`B, \
\nrate AEth0 = `sed -n '/RATE/s/\(^.*\)PPS = \(.\)/\2/p' "@file_name1"`pps, \
`sed -n '/RATE\ =/s/\(^.*\)= \(.*\),\(.*\)/\2/p' "@file_name1"`, \
min AEth0 = `sed -n '/min\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name1"`, \
max AEth0 = `sed -n '/max\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name1"`, \
p-t-p AEth0 = `sed -n '/peak-to-peak/s/\(^.*\)= \(.\)/\2/p' "@file_name1"`, \
\nrate AEth1 = `sed -n '/RATE/s/\(^.*\)PPS = \(.\)/\2/p' "@file_name2"`pps, \
`sed -n '/RATE\ =/s/\(^.*\)= \(.*\),\(.*\)/\2/p' "@file_name2"`, \
min AEth1 = `sed -n '/min\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name2"`, \
max AEth1 = `sed -n '/max\ val/s/\(^.*\)= \(.\)/\2/p' "@file_name2"`, \
p-t-p AEth1 = `sed -n '/peak-to-peak/s/\(^.*\)= \(.\)/\2/p' "@file_name2"`"

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
