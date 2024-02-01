#!/bin/bash
fichier="$1"
start=$(echo $SECONDS );


echo "--- chargement en cours du traitement T ---"
echo "▒▒▒▒▒▒▒▒▒▒ 0%"




#awk -F";" ' { count[$1";"$4]++ }  END { for (key in count) print key";"count[key]  }' fichier="$1"  > tmp/feur.csv 
#awk -F';' '$2 == 1 {count[$1";"$3]++} END {for (val in count) print  val";"count[val] }' data/data.csv > tmp/file.csv
#awk -F ';' 'BEGIN {OFS=";"} NR==FNR {data[$1]=$2; next} ($1 in data) {print $1, data[$1], $2}' tmp/feur.csv tmp/file.csv > tmp/fusionne.csv
awk -F";" ' { count[$1";"$4]++ } 
            $2 == 1 { count[$1";"$3]++ } 
            $2 == 1 && $1$4 == $1$3 { count[$1";"$4]-- } 
            END { for (key in count) print key";"count[key] }' $fichier > tmp/feur.csv


echo "██▒▒▒▒▒▒▒▒ 20%"
            
awk -F';' '{count[$2]++} END {for (val in count) print val ";" count[val]}' tmp/feur.csv > tmp/donne.csv


echo "████▒▒▒▒▒▒ 40%"
awk -F';' '$2 == 1 {count[$3]++} END {for (val in count) print val ";" count[val]}' $fichier > tmp/file.csv


echo "███████▒▒▒ 70%"
awk -F ';' 'BEGIN {OFS=";"} NR==FNR {data[$1]=$2; next} ($1 in data) {print $1, data[$1], $2}' tmp/donne.csv tmp/file.csv > tmp/fusionne.csv


echo "████████▒▒ 80%"



touch tmp/tmp.txt
cd progc
make
cd ..
progc/./T
if [ $? -eq 0 ]; then
       echo "programme c fini"
    else
        echo "Erreur: Le programme c a crash"
        exit 1
fi
cd progc
make -f Makefile clean
cd ..
# Nom du fichier contenant les données
data_file="tmp/tmp.txt"


echo "█████████▒ 90%"
# Fichier temporaire pour le formatage des données
formatted_data="tmp/T.txt"

# Fichier de commandes pour Gnuplot
gnuplot_commands="tmp/graph_commands.gp"

# Fichier de sortie pour le graphique
output_file="image/T.png"
sed -i 's/ //g' tmp/tmp.txt

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
    
    echo "plot '$formatted_data' using 2:xtic(1) title 'Nombre de trajets' lt 3, '' using 3:xticlabels(1) title 'Nombre de conducteurs' lt 1"
} > "$gnuplot_commands"

# Exécution du script Gnuplot
gnuplot "$gnuplot_commands"
xdg-open "image/T.png" & 

echo "Le graphique a été créé : $output_file"


echo "██████████ 100%"


end=$(echo $SECONDS );

rm -f "$gnuplot_commands" tmp/feur.csv tmp/fusionne.csv tmp/tmp.txt tmp/donne.csv tmp/file.csv tmp/T.txt

echo "Le programme a ete execute en $(($end - $start)) secondes."








