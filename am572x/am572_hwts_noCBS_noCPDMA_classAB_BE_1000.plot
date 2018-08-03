set ylabel 'packet size (for marking), Bytes'
set xlabel 'hw timestamp (PHC), us'

set key box
set grid

file_name = 'am572_hwts_noCBS_noCPDMA_classA_parB_parBE_1000.data'
file_name2 = 'am572_hwts_noCBS_noCPDMA_classB_parA_parBE_1000.data'

set title "am572x, cpsw, \
class A+B+BE, \
ptpl2, \
no CBS, \
no CPDMA limit, \
itf speed = 1000Mbps, \
\npacket = `sed -n '/packet\ size/s/\(^.*\): \(.\)/\2/p' "@file_name"`B (+ tag), \
A rate = `sed -n '/RATE/s/\(^.*\)PPS = \(.\)/\2/p' "@file_name"`pps, \
`sed -n '/RATE\ =/s/\(^.*\)= \(.*\),\(.*\)/\2/p' "@file_name"`, \
B rate = `sed -n '/RATE/s/\(^.*\)PPS = \(.\)/\2/p' "@file_name2"`pps, \
`sed -n '/RATE\ =/s/\(^.*\)= \(.*\),\(.*\)/\2/p' "@file_name2"`"

set terminal qt 0
plot[40081:42081] "< sed -e '0,/----/ d' -e '/----/,$ d' -n -e '/[0-9]/s/$/ 516/p' ". file_name \
with points pointtype 7 black title "Class A packet", \
"< sed -e '0,/----/ d' -e '/----/,$ d' -n -e '/[0-9]/s/$/ 516/p' ". file_name2 \
with points pointtype 7 lc rgb "red" title "Class B packet"

set terminal qt 1
plot[46659:48659] "< sed -e '0,/----/ d' -e '/----/,$ d' -n -e '/[0-9]/s/$/ 516/p' ". file_name \
with points pointtype 7 black title "Class A packet", \
"< sed -e '0,/----/ d' -e '/----/,$ d' -n -e '/[0-9]/s/$/ 516/p' ". file_name2 \
with points pointtype 7 lc rgb "red" title "Class B packet"

set terminal qt 2
plot[50000:55000] "< sed -e '0,/----/ d' -e '/----/,$ d' -n -e '/[0-9]/s/$/ 516/p' ". file_name \
with points pointtype 7 black title "Class A packet", \
"< sed -e '0,/----/ d' -e '/----/,$ d' -n -e '/[0-9]/s/$/ 516/p' ". file_name2 \
with points pointtype 7 lc rgb "red" title "Class B packet"

set terminal qt 3
plot[60000:61000] "< sed -e '0,/----/ d' -e '/----/,$ d' -n -e '/[0-9]/s/$/ 516/p' ". file_name \
with points pointtype 7 black title "Class A packet", \
"< sed -e '0,/----/ d' -e '/----/,$ d' -n -e '/[0-9]/s/$/ 516/p' ". file_name2 \
with points pointtype 7 lc rgb "red" title "Class B packet"

set terminal qt 4
plot[44659:1.06364e+06] "< sed -e '0,/----/ d' -e '/----/,$ d' -n -e '/[0-9]/s/$/ 516/p' ". file_name \
with points pointtype 7 black title "Class A packet", \
"< sed -e '0,/----/ d' -e '/----/,$ d' -n -e '/[0-9]/s/$/ 516/p' ". file_name2 \
with points pointtype 7 lc rgb "red" title "Class B packet"
