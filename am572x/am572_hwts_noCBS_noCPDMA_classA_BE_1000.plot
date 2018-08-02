set ylabel 'packet size (for marking), Bytes'
set xlabel 'hw timestamp (PHC), us'

set key box
set grid

file_name = 'am572_hwts_noCBS_noCPDMA_classA_parBE_1000.data'

set title "am572x, cpsw, \
class A + BE, \
ptpl2, \
no CBS, \
no CPDMA limit, \
itf speed = 1000Mbps, \
\npacket = `sed -n '/packet\ size/s/\(^.*\): \(.\)/\2/p' "@file_name"`B (+ tag), \
A rate = `sed -n '/RATE/s/\(^.*\)PPS = \(.\)/\2/p' "@file_name"`pps, \
`sed -n '/RATE\ =/s/\(^.*\)= \(.*\),\(.*\)/\2/p' "@file_name"`"

set terminal qt 0
plot[47899:48659] "< sed -e '0,/----/ d' -e '/----/,$ d' -n -e '/[0-9]/s/$/ 516/p' ". file_name \
with points pointtype 7 black title "Class A packet"

set terminal qt 1
plot[48659:50659] "< sed -e '0,/----/ d' -e '/----/,$ d' -n -e '/[0-9]/s/$/ 516/p' ". file_name \
with points pointtype 7 black title "Class A packet"

set terminal qt 2
plot[51000:56000] "< sed -e '0,/----/ d' -e '/----/,$ d' -n -e '/[0-9]/s/$/ 516/p' ". file_name \
with points pointtype 7 black title "Class A packet"

set terminal qt 3
plot[50000:100000] "< sed -e '0,/----/ d' -e '/----/,$ d' -n -e '/[0-9]/s/$/ 516/p' ". file_name \
with points pointtype 7 black title "Class A packet"

set terminal qt 4
plot[60000:61000] "< sed -e '0,/----/ d' -e '/----/,$ d' -n -e '/[0-9]/s/$/ 516/p' ". file_name \
with points pointtype 7 black title "Class A packet"
