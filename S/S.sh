#!/bin/bash

start=$(echo $SECONDS );
fichier="$1"


echo "--- chargement en cours du traitement S ---"
echo "▒▒▒▒▒▒▒▒▒▒ 0%"

LC_NUMERIC=C awk -F';' 'NR>1 {
    

    gsub(",", ".", avg)
id = $1
value = $5
    if (!($1 in min_distance) || $5 + 0 < min_distance[$1] + 0) {
        min_distance[$1] = $5
    }
    if (!($1 in max_distance) || $5 + 0 > max_distance[$1] + 0) {
        max_distance[$1] = $5
    }
   total_distances[id] += value;
    counts[id]++; 
} END {
    for (id in counts) {
        average_distance = (counts[id] > 0) ? total_distances[id] / counts[id] : 0;
        
       printf "%s;%0.3f;%0.3f;%0.3f\n", id, average_distance+0, min_distance[id]+0, max_distance[id]+0
    }
}' $fichier > tmp/done.csv



echo "█████▒▒▒▒▒ 50%"



touch tmp/S.txt


cd progc
make
cd ..
progc/./S
if [ $? -eq 0 ]; then
       echo "programme c fini"
    else
        echo "Erreur: Le programme c a crash"
        exit 1
fi
cd progc
make -f Makefile clean
cd ..


  #  gsub("\\.", ".", $5)  # Remplacez les points par des virgules
  #  gsub("_", ".", $5)  # Remettez le caractère temporaire par des points





echo "███████▒▒▒ 70%"

gnuplot_commands="tmp/graph_commands.gp"

{
    echo "set terminal pngcairo size 1500,800 enhanced font 'Verdana,12'"
    echo "set output 'image/S.png'"
    echo "set title 'Statistique sur les étapes'"
    echo "set xlabel 'Identifiant de trajet'"
    echo "set ylabel 'Distances en km'"
    echo "set xtics nomirror rotate by -45 scale 0 font ',8'"
    echo "set ytics nomirror"
    echo "set grid xtics ytics"
    echo "set datafile separator ';'"

    echo "plot 'tmp/S.txt' using 1:4:5 with filledcurves lc rgb '#cd7f32' title 'MaxMin' , \
     '' using 1:3 with lines title 'Moyenne' lt -1 lw 2 lc -1, \
      '' using 1:6:xtic(2) with lines notitle lt -1 lw 1"


} > "$gnuplot_commands"

gnuplot "$gnuplot_commands"
echo "████████▒▒ 80%"
xdg-open "image/S.png" &
echo "Le graphique a été créé : S.png"

rm -f "$gnuplot_commands" tmp/done.csv tmp/S.txt



echo "██████████ 100%"
end=$(echo $SECONDS );

echo "Le programme a ete execute en $(($end - $start)) secondes."






