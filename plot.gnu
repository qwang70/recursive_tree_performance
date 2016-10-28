set terminal png
set output 'tree_level_vs_time.png'

set multiplot layout 1, 2 title "Runtime Comparison on Recursive Tree" font ",14"
set tmargin 2

set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically

unset logscale
set xlabel "Tree level"
set ylabel "Time (s)"
set title "Linear Scale"
plot "runtime_xsb_sql.txt" using 1:2 title "xsb" with linespoints, \
"runtime_xsb_sql.txt" using 1:3 title "sql" with linespoints

set title "Log Scale"
set logscale y
replot
