#!/bin/bash

#Prends le temps au debut du programme
start=$(echo $SECONDS );

#Vérifiez si le fichier data.csv existe
if [ ! -f "data/data.csv" ]; then
	echo "Le fichier data.csv n'existe pas."
	exit 1
fi

#1) Commande qui compte le nomrbe de fois qu'une ville est une ville d'arrive
arrive_csv=$(awk -F';' '$2 == 1 { villedarrive_nb[$4]++ } END { for (ville in villedarrive_nb) print ville";"villedarrive_nb[ville] }' data/data.csv)

echo -e "$arrive_csv" > arrive_csv #On enregistre dans un fichier temporaire nos resultats


#2) Commande qui compte le nomrbe de fois qu'une ville est une ville de depart
depart_csv=$(awk -F';' '$2 == 1 { villedepart_nb[$3]++ } END { for (ville in villedepart_nb) print ville";"villedepart_nb[ville] }' data/data.csv)

echo -e "$depart_csv" > depart_csv #On enregistre dans un fichier temporaire nos resultats


#3) On combine 1) et 2) dans un meme fichier qui sera envoyer au programme c
awk 'BEGIN{FS=OFS=";"} NR==FNR{arr[$1]=$2; next} {print $1, $2, ($1 in arr ? arr[$1] : 0)}' depart_csv arrive_csv > "result.csv"


#4) On lance le programme c
gcc -o exe traitement-t.c	#compilation du programme c
./exe				#execution du programme c

#5) Creation de l'histogramme avec gnuplot

#Creation du gnuplot_sript
gnuplot_scriptt="/home/legrosgabr/projet/gnuplot_scriptt.txt"

#Utilisation de Gnuplot pour creer le graphique
cat << 'EQF' > "$gnuplot_scriptt"

set terminal png					#format png
set output "/home/legrosgabr/projet/traitement-t.png"	#chemin du fichier de sortie

set title "Histogramme traitement -t"			
set style data histogram
set style fill solid
set style histogram clustered
unset key

set datafile separator ";"			#indique que separateur des donnees est ";"

#Affichage de l'histogramme
plot for [COL=2:3] 'result_sortie.csv' using COL:xtic(1) #title columnheader(COL) rotate by -45

EQF

#Execution du gnuplot avec le sript cree
gnuplot "$gnuplot_scriptt"
xdg-open "/home/legrosgabr/projet/traitement-t.png"

#Suppression du fichier de script temporaire
rm "$gnuplot_scriptt"

#Prends le temps a la fin du programme
end=$(echo $SECONDS );

echo "Le programme a ete execute en $(($end - $start)) secondes."

