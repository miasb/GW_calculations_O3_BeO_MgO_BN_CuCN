#!/usr/bin/gnuplot

set terminal pdfcairo size 3,4 font "Latin Modern, 12"
set output "self_energy.pdf"

set format y "%4.0f"
set multiplot layout 3,1

sigxmvxc=-5.7119
escf=-4.7821 

set arrow from -6.7963, graph 0 to -6.7963, graph 1 nohead dt 3 lw 1
set arrow from -11.135, graph 0 to -11.135, graph 1 nohead dt 3 lw 1

set key top right

set xrange [-15:-5]

set yrange [-40:40]
set ytics 25
set xtics nomirror
set mxtics 2
set mytics 2
set format x ""
unset xlabel
set ylabel "Re {/Symbol S}_{Homo} [eV]"

set grid mxtics xtics mytics ytics lw 0.8 lc "#17c7f93" dt 1

set tmargin at screen 0.95
set bmargin at screen 0.67


plot "self_energy_re.dat" t "" w l lw 2 lc 6,\
x-sigxmvxc-escf w l dt 2 lc "black" lw 1.25 t "{/Symbol w} + v_s^{xc} - {/Symbol S}_s^x - {/Symbol e}_s^0"


set format y "%4.0f"

set yrange [-12:12]
set ytics 10
set tmargin at screen 0.67
set bmargin at screen 0.39

set ylabel "Im {/Symbol S}_{Homo} [eV]"
plot "self_energy_im.dat" w l lw 2 lc 6 t ""


set ytics 0.5
set yrange [0:2.25]
set tmargin at screen 0.39
set bmargin at screen 0.11

set format y "%4.1f"
set format x "%1.1f"
set xtics auto
set xlabel "Energy [eV]"
set ylabel "A_{Homo} [1/eV]"
plot "spectral.dat" w l lw 2 lc 6 t ""

