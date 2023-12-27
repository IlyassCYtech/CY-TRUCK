#!/bin/bash


#Creation de la liste trie par ordre decroissant

premiere_liste=$(awk -F';' 'NR>1 && !seen[$1] {count[$6]++; seen[$1]=1} END {for (driver in count) print driver ";" count[driver]}' data/data.csv | sort -t';' -k2nr | head -n10)

#Sauvegarde de la liste triee par ordre decroissant
echo  "$premiere_liste" > d1/tmp/premiere_liste

#Creation de la liste de data pour l'histogramme par ordre croissant
liste_data=$(echo "$premiere_liste" | sort  -t';' -k2n)

echo "Contenu de liste_data : $liste_data"
echo  "$liste_data" > d1/tmp/liste_data


#Histogramme horizontale

gnuplot_script="d1/tmp/gnuplotscript.txt"
cat <<'EQF' > "$gnuplot_script" # debut du gnuplot_script

#On s'occupe du ficher qu'on va creer, ici un png
set terminal png
set output "d1/demo/traitementd1.png"

set title "Nombre de trajets par conducteur" #Titre

set datafile separator ';' #Separation des colonnes par des ;

set yrange [0:*]      #Commence a zero, trouve le max depuis les donnees
set style fill solid  #Boites solides colorees
unset key             #Supprime tous les titres

myBoxWidth = 0.6      #Largeur des boites
set offsets 0,0,0.5-myBoxWidth/2.,0.5  # Emplacement des boites

#myColor = "rgb '#FF0000'"

#Affichage de l'histogramme par gnuplot
plot "d1/tmp/liste_data" using (0.5*$2):0:(0.5*$2):(myBoxWidth/2):($0+1):ytic(1) with boxxy lc var

#Fin du gnuplot_script

EQF


#Execution du gnuplot avec le script cree
gnuplot "$gnuplot_script"
xdg-open "d1/demo/traitementd1.png"

#Suppression du fichier de script temporaire
rm "$gnuplot_script"

