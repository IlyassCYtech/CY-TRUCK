#!/bin/bash



# Vérification de l'existence du fichier data.csv
if [ ! -f "data.csv" ]; then
    echo "Le fichier data.csv est introuvable."
    exit 1
fi

cut -d ';' -f 1,5 data.csv >temp.csv
sed -i '1d' temp.csv



nb_lines=$(wc -l < "temp.csv")
echo "$nb_lines"
gcc -o trait trait.c


#data_file=$(./trait "$nb_lines" )










gnuplot_commands="graph_commands.gp"

{
    echo "set terminal pngcairo enhanced font 'Verdana,12'"
    echo "set output 'graphique_errorbars.png'"
    echo "set title 'Courbes Min-Max-Moyenne'"
    echo "set xlabel 'Identifiant de trajet'"
    echo "set ylabel 'Distances en km'"
    echo "set xtics nomirror rotate by -45 scale 0 font ',8'"
    echo "set ytics nomirror"
    echo "set grid xtics ytics"
    echo "set datafile separator ';'"

    echo "plot 'tmp.txt' using 0:2:4:3:xticlabels(1) with yerrorbars title 'Moyenne' lt -1 lw 1 smooth unique,\
    'tmp.txt' using 0:4 with lines title 'Max' lt 2,\
    'tmp.txt' using 0:3 with lines title 'Min' lt 3"
} > "$gnuplot_commands"

gnuplot "$gnuplot_commands"
xdg-open "graphique_errorbars.png" &
echo "Le graphique a été créé : graphique_errorbars.png"

rm -f  "$gnuplot_commands"












