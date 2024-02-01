#!/bin/bash
start=$(echo $SECONDS );
fichier="$1"
#awk -F';' '{sum[$6]+=$2} END {for (k6 in sum) print k6";"sum[k6]}' data/data.csv | sort -t';' -k2,2nr | head -n 10 > photo/bonus.txt
echo "--- Chargement en cours du traitement Bonus ---"
echo "▒▒▒▒▒▒▒▒▒▒ 0%"

awk -F";" ' { count[$6";"$4]++ }  {count[$6";"$3]++} $6$4 == $6$3 { count[$6";"$4]-- } END { for (key in count) print key";"count[key]  }' $fichier > tmp/tmp.csv
echo "████▒▒▒▒▒▒ 40%"
awk -F';' '{count[$1]++} END {for (k1 in count) print k1";"count[k1]}' tmp/tmp.csv | sort -t';' -k2,2nr | head -n 10 > tmp/bonus.txt
sort -t';' -k2 tmp/bonus.txt > tmp/tmp.txt


gnuplot_script="tmp/gnuplot_script.txt"

echo "███████▒▒▒ 70%"
# Utilisez Gnuplot pour crÃ©er le graphique
cat << 'EQF' > "$gnuplot_script"

set terminal png
set output "image/bonus.png"

set datafile separator ";"

set title "Conducteur avec le plus de trajet"

set yrange [0:*]      # start at zero, find max from the data
set style fill solid  # solid color boxes
unset key             # turn off all titles
set xlabel 'Nb de Ville'
set ylabel 'Chauffeur'

myBoxWidth = 0.8
set offsets 0,0,0.75-myBoxWidth/2.,0.75

plot "tmp/tmp.txt" using (0.5*$2):0:(0.5*$2):(myBoxWidth/2.):($0+1):ytic(1) with boxxy lc var
### end of script

EQF
echo "████████▒▒ 80%"
#Execution du gnuplot avec le sript cree
gnuplot "$gnuplot_script"
xdg-open "image/bonus.png" 
echo "██████████ 100%"
end=$(echo $SECONDS );
rm "$gnuplot_script" tmp/tmp.csv tmp/bonus.txt tmp/tmp.txt
echo "Le programme a ete execute en $(($end - $start)) secondes."

