#!/bin/bash

#Sert a compter le nombre de secondes de l'execution du programme
start=$(echo $SECONDS ); #Recupere le nombre de seconde a partir duquel le terminal a ete ouvert

fichier="$1"
echo "--- Chargement en cours du traitement L ---"
echo "▒▒▒▒▒▒▒▒▒▒ 0%"

echo "██▒▒▒▒▒▒▒▒ 20%"
# ici le awk du traitement L qui va trier le fichier puis un sort 
LC_NUMERIC=C awk -F';' 'NR>1 {distances[$1] += $5 } END { for (i in distances) printf "%s;%.2f\n", i, distances[i] }' $fichier | LC_NUMERIC=C sort -t';' -k2,2nr | head -n 10 | LC_NUMERIC=C sort -t ';' -k1n > tmp/L.txt

echo "████████▒▒ 80%"
#___________________________________________________________________________________________
#                                         GNUPLOT
#___________________________________________________________________________________________
# Création d'un fichier de script temporaire pour gnuplot
cat <<EOF > tmp/plotscript.gnu
set terminal pngcairo enhanced font 'Verdana,12'

set output 'image/L.png'  #fichier de sortie format png
set datafile separator ';' #; defini comme le separateur des fichiers 

#Style de l'histogramme
set style fill solid
set style data histograms
set boxwidth 0.5
set xtics rotate by -45

set title "Histogramme des distances par identifiant de trajet" #titre
set xlabel "Identifiant du trajet" #legende
set ylabel "Distance (km)" #legende

#Affichage de l'histogramme
plot 'tmp/L.txt' using 2:xtic(1) with histograms title 'Distance'
EOF

#___________________________________________________________________________________________
#                                    Dernieres commandes
#___________________________________________________________________________________________

#Exécution de gnuplot avec le script créé
gnuplot tmp/plotscript.gnu
echo "█████████▒ 90%"
xdg-open image/L.png
echo "██████████ 100%"
#Suppression du fichier de script temporaire
rm tmp/plotscript.gnu tmp/L.txt

#Sert a compter le nombre de secondes de l'execution du programme
end=$(echo $SECONDS );

#Fais la soustraction finale pour recuperer le nombre de seconde exacte du temps d'execution
echo "Le programme a ete execute en $(($end - $start)) secondes."
