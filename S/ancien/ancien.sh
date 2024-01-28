#!/bin/bash

awk -F';' 'BEGIN { OFS=";" } NR>1 { 
    gsub(",", ".", avg)

    if (!($1 in min_distance) || $5 + 0 < min_distance[$1] + 0) {
        min_distance[$1] = $5
    }
    if (!($1 in max_distance) || $5 + 0 > max_distance[$1] + 0) {
        max_distance[$1] = $5
    }
    total_distance[$1] += $5
    count[$1]++
} END {
    for (i in total_distance) {
        avg = total_distance[i] / count[i]
       gsub(",", ".", avg)  # Si nécessaire, remplacez les virgules par des points pour la moyenne
        printf "%s;%s;%s;%s\n", i, avg, min_distance[i], max_distance[i]
    }
}' data/data.csv > S/done.csv

touch S/tmp/tmp.txt
nb_lines=$(wc -l < "S/done.csv")
echo "$nb_lines"
gcc -o S/tmp/version S/traitS.c
  #  gsub("\\.", ".", $5)  # Remplacez les points par des virgules
  #  gsub("_", ".", $5)  # Remettez le caractère temporaire par des points

data_file=$(./version "$nb_lines" )



gnuplot_commands="S/graph_commands.gp"

{
    echo "set terminal pngcairo size 1500,800 enhanced font 'Verdana,12'"
    echo "set output 'S/demo/graphique_errorbars.png'"
    echo "set title 'Courbes Min-Max-Moyenne'"
    echo "set xlabel 'Identifiant de trajet'"
    echo "set ylabel 'Distances en km'"
    echo "set xtics nomirror rotate by -45 scale 0 font ',8'"
    echo "set ytics nomirror"
    echo "set grid xtics ytics"
    echo "set datafile separator ';'"

    echo "plot 'S/tmp/tmp.txt' using 1:6:xtic(2) with yerrorbars title 'Moyenne' lt -1 lw 1, \
0 with lines title '' lt -1 lw 1, \
'S/tmp/tmp.txt' using 1:5 with lines title 'Min' lt 3, \
'S/tmp/tmp.txt' using 1:4 with lines title 'Max' lt 2, \
'S/tmp/tmp.txt' using 1:3 with lines title 'Moyenne' lt -1 lw 2"

} > "$gnuplot_commands"

gnuplot "$gnuplot_commands"
xdg-open "S/demo/graphique_errorbars.png" &
echo "Le graphique a été créé : graphique_errorbars.png"

rm -f "$gnuplot_commands" 









