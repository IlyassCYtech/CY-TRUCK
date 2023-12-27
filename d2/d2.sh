#!/bin/bash
# Commande awk pour additionner les kilométrages en fonction d'une personne
grandedistance_csv=$(awk -F';' '{DistanceTotale[$6]+=$5} END {for (person in DistanceTotale) print person ";" DistanceTotale[person]}' data/data.csv | sort -t';' -k2nr | head -n 10)

#enregistre les donnees dans un fichier temporaire
echo "$grandedistance_csv" > d2/tmp/grandedistance_csv

listetriee_csv=$(echo "$grandedistance_csv" | sort -t';' -k2n)


echo "$listetriee_csv" > d2/tmp/listetriee_csv 


#creation du gnuplot_sript
gnuplot_script="d2/demo/gnuplot_script.txt"


# Utilisez Gnuplot pour creer le graphique
cat << 'EQF' > "$gnuplot_script"

set terminal png
set output "d2/demo/traitementd2.png"

set datafile separator ";"

set title "Les 10 plus grandes distances"

set yrange [0:*]      # start at zero, find max from the data
set style fill solid  # solid color boxes
unset key             # turn off all titles

myBoxWidth = 0.8
set offsets 0,0,0.75-myBoxWidth/2.,0.75

plot "d2/tmp/listetriee_csv" using (0.5*$2):0:(0.5*$2):(myBoxWidth/2.):($0+1):ytic(1) with boxxy lc var
### end of script

EQF

#Execution du gnuplot avec le sript cree
gnuplot "$gnuplot_script"
xdg-open "d2/demo/traitementd2.png"

#Suppression du fichier de script temporaire
rm "$gnuplot_script"
