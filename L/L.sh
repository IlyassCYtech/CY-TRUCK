#!/bin/bash


start=$(echo $SECONDS );

fichier="$1"
echo "--- chargement en cours du traitement L ---"
echo "▒▒▒▒▒▒▒▒▒▒ 0%"
# Triez le fichier CSV en fonction de la colonne du numéro d'identifiant de trajet croissant

#sort -t ';' -k1,1n data/data.csv > tmp/data_trie.csv

# Utilisez awk pour calculer la distance totale de chaque trajet et stocker les résultats dans un fichier temporaire
#awk -F';' 'NR>1 {distances[$1] += $5 } END { for (i in distances) print i";"distances[i] }' data/data.csv | sort -t';' -k2,2nr |  head -n 10 | sort -t ';' -k1n > photo/L.txt


#awk -F';' 'NR>1 {distances[$1] += $5 } END { for (i in distances) printf "%s;%.2f\n", i, distances[i] }' data/data.csv | sort -t';' -k2,2nr | head -n 10 | sort -t ';' -k1n > photo/L.txt
echo "██▒▒▒▒▒▒▒▒ 20%"
LC_NUMERIC=C awk -F';' 'NR>1 {distances[$1] += $5 } END { for (i in distances) printf "%s;%.2f\n", i, distances[i] }' $fichier | LC_NUMERIC=C sort -t';' -k2,2nr | head -n 10 | LC_NUMERIC=C sort -t ';' -k1n > demo/L.txt

echo "████████▒▒ 80%"










# Création d'un fichier de script temporaire pour gnuplot
cat <<EOF > tmp/plotscript.gnu
set terminal pngcairo enhanced font 'Verdana,12'

set output 'demo/L.png'
set datafile separator ';'

set style fill solid
set style data histograms
set boxwidth 0.5
set xtics rotate by -45

set title "Histogramme des distances par identifiant de trajet"
set xlabel "Identifiant du trajet"
set ylabel "Distance (km)"

plot 'demo/L.txt' using 2:xtic(1) with histograms title 'Distance'
EOF

# Exécution de gnuplot avec le script créé
gnuplot tmp/plotscript.gnu
echo "█████████▒ 90%"
xdg-open demo/L.png
echo "██████████ 100%"
# Suppression du fichier de script temporaire
rm tmp/plotscript.gnu

end=$(echo $SECONDS );

echo "Le programme a ete execute en $(($end - $start)) secondes."

