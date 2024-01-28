#!/bin/bash

# Triez le fichier CSV en fonction de la colonne du numéro d'identifiant de trajet croissant
chmod 600 data_trie.csv
sort -t ';' -k1,1n data.csv > data_trie.csv
chmod 600 distances_temp.csv
chmod 600 distances_triees.csv

# Utilisez awk pour calculer la distance totale de chaque trajet et stocker les résultats dans un fichier temporaire

awk -F';' 'NR>1 {distances[$1] += $5 } END { for (i in distances) print i";"distances[i] }' data_trie.csv > distances_temp.csv

# Triez les distances totales par trajet en ordre décroissant
sort -t ';' -k2,2nr distances_temp.csv > distances_triees.csv
sort -t ';' -k2,2nr distances_temp.csv | head -10

#sort -r -t';' -k2 distances_temp.csv
# Affichez les 10 distances les plus grandes avec leurs identifiants de trajet correspondants

head -10 distances_triees.csv > distances.csv


# Création d'un fichier de script temporaire pour gnuplot
cat <<EOF > plotscript.gnu
set terminal pngcairo enhanced font 'Verdana,12'

set output 'histogramme_distances.png'
set datafile separator ';'

set style fill solid
set style data histograms
set boxwidth 0.5
set xtics rotate by -45

set title "Histogramme des distances par identifiant de trajet"
set xlabel "Identifiant du trajet"
set ylabel "Distance (km)"


plot 'distances.csv' using 2:xtic(1) with histograms title 'Distance'
EOF

# Exécution de gnuplot avec le script créé
gnuplot plotscript.gnu
xdg-open histogramme_distances.png


# Suppression du fichier de script temporaire
rm plotscript.gnu



   
