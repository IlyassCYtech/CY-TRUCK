#!/bin/bash
clear
# Triez le fichier CSV en fonction de la colonne du numéro d'identifiant de trajet croissant
chmod 600 /home/ilyass/Documents/projet/shell/traitement/tmp/data_trie.csv
sort -t ';' -k1,1n /home/ilyass/Documents/projet/shell/traitement/data/data.csv > /home/ilyass/Documents/projet/shell/traitement/tmp/data_trie.csv
chmod 600 tmp/distances_temp.csv
chmod 600 tmp/distances_triees.csv

# Utilisez awk pour calculer la distance totale de chaque trajet et stocker les résultats dans un fichier temporaire
awk -F';' 'NR>1 {distances[$1] += $5 } END { for (i in distances) print i";"distances[i] }' /home/ilyass/Documents/projet/shell/traitement/tmp/data_trie.csv > /home/ilyass/Documents/projet/shell/traitement/tmp/distances_temp.csv

# Triez les distances totales par trajet en ordre décroissant
sort -t ';' -k2,2nr /home/ilyass/Documents/projet/shell/traitement/tmp/distances_temp.csv > /home/ilyass/Documents/projet/shell/traitement/tmp/distances_triees.csv
sort -t ';' -k2,2nr /home/ilyass/Documents/projet/shell/traitement/tmp/distances_temp.csv | head -10

# Affichez les 10 distances les plus grandes avec leurs identifiants de trajet correspondants
head -10 /home/ilyass/Documents/projet/shell/traitement/tmp/distances_triees.csv > /home/ilyass/Documents/projet/shell/traitement/tmp/distances.csv

# Création d'un fichier de script temporaire pour gnuplot
cat <<EOF > /home/ilyass/Documents/projet/shell/traitement/tmp/plotscript.gnu
set terminal pngcairo enhanced font 'Verdana,12'

set output '/home/ilyass/Documents/projet/shell/traitement/demo/histogramme_distances.png'
set datafile separator ';'

set style fill solid
set style data histograms
set boxwidth 0.5
set xtics rotate by -45

set title "Histogramme des distances par identifiant de trajet"
set xlabel "Identifiant du trajet"
set ylabel "Distance (km)"

plot '/home/ilyass/Documents/projet/shell/traitement/tmp/distances.csv' using 2:xtic(1) with histograms title 'Distance'
EOF

# Exécution de gnuplot avec le script créé
gnuplot /home/ilyass/Documents/projet/shell/traitement/tmp/plotscript.gnu
xdg-open /home/ilyass/Documents/projet/shell/traitement/demo/histogramme_distances.png

# Suppression du fichier de script temporaire
rm /home/ilyass/Documents/projet/shell/traitement/tmp/plotscript.gnu

