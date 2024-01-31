#!/bin/bash
fichier="$1"
start=$(echo $SECONDS );
echo "--- chargement en cours du traitement D2 ---"
echo "▒▒▒▒▒▒▒▒▒▒ 0%"
# Commande awk

grandedistance_csv=$(LC_NUMERIC=C awk -F';' '{DistanceTotale[$6]+=$5} END {for (person in DistanceTotale) printf "%s;%.2f\n",person, DistanceTotale[person]}' $fichier | sort -t';' -k2nr | head -n 10)
echo "█████▒▒▒▒▒ 50%"
echo "$grandedistance_csv" > tmp/grandedistance_csv

listetriee_csv=$(echo "$grandedistance_csv" | sort -t';' -k2n)

echo "███████▒▒▒ 70%"
echo "$listetriee_csv" > demo/d2.txt 


#creation du gnuplot_sript
gnuplot_script="tmp/gnuplot_script.txt"


# Utilisez Gnuplot pour crÃ©er le graphique
cat << 'EQF' > "$gnuplot_script"

set terminal png
set output "demo/d2.png"

set datafile separator ";"

set title "Les 10 plus grandes distances"

set yrange [0:*]      # start at zero, find max from the data
set style fill solid  # solid color boxes
unset key             # turn off all titles

myBoxWidth = 0.8
set offsets 0,0,0.75-myBoxWidth/2.,0.75

plot "demo/d2.txt" using (0.5*$2):0:(0.5*$2):(myBoxWidth/2.):($0+1):ytic(1) with boxxy lc var
### end of script

EQF
echo "████████▒▒ 80%"
#Execution du gnuplot avec le sript cree
gnuplot "$gnuplot_script"
xdg-open "demo/d2.png"

rm "$gnuplot_script" tmp/grandedistance_csv
echo "██████████ 100%"
end=$(echo $SECONDS );

echo "Le programme a ete execute en $(($end - $start)) secondes."
