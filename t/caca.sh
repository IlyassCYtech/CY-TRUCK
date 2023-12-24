#!/bin/bash




awk -F';' '{count[$4]++} END {for (val in count) print val ";" count[val]}' T/data/data.csv > T/tmp/donne.csv
awk -F';' '$2 == 1 {count[$3]++} END {for (val in count) print val ";" count[val]}' T/data/data.csv > T/tmp/file.csv
awk -F ';' 'BEGIN {OFS=";"} NR==FNR {data[$1]=$2; next} ($1 in data) {print $1, data[$1], $2}' T/tmp/donne.csv tmp/file.csv > T/tmp/fusionne.csv

nb_lines=$(wc -l < "T/tmp/fusionne.csv")
echo "$nb_lines"
gcc -o feur T/feur.c

 
data_file=$(T/./feur "$nb_lines" )


# Nom du fichier contenant les données
data_file="T/tmp/tmp.txt"

# Fichier temporaire pour le formatage des données
formatted_data="T/tmp/tmp1.txt"

# Fichier de commandes pour Gnuplot
gnuplot_commands="T/demo/graph_commands.gp"

# Fichier de sortie pour le graphique
output_file="T/demo/graphique.png"
sed -i 's/ //g' T/tmp/tmp.txt

# Formater les données pour Gnuplot
awk -F ';' '{ print $1, $2, $3 }' "$data_file" > "$formatted_data"

# Création du fichier de commandes pour Gnuplot
{
    echo "set terminal pngcairo enhanced font 'Verdana,12'"
    echo "set output '$output_file'"
    echo "set title 'Graphique des trajets et conducteurs par ville'"
    echo "set xlabel 'Villes'"
    echo "set ylabel 'Nombre de trajets / Nombre de conducteurs'"
    echo "set xtics rotate"
    echo "set style data histograms"
    echo "set style fill solid"
    
    echo "plot '$formatted_data' using 2:xtic(1) title 'Nombre de trajets' lt 3, '' using 3:xticlabels(1) title 'Départ' lt 1"
} > "$gnuplot_commands"

# Exécution du script Gnuplot
gnuplot "$gnuplot_commands"
xdg-open "T/demo/graphique.png" &

echo "Le graphique a été créé : $output_file"


rm -f "$formatted_data" "$gnuplot_commands"











