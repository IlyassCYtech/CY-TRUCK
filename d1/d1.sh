#!/bin/bash
start=$(echo $SECONDS );
fichier="$1"
echo "--- chargement en cours du traitement D1 ---"
echo "▒▒▒▒▒▒▒▒▒▒ 0%"
#Creation de la liste trie par ordre decroissant

premiere_liste=$(awk -F';' 'NR>1 && !seen[$1] {count[$6]++; seen[$1]=1} END {for (driver in count) print driver ";" count[driver]}' $fichier | sort -t';' -k2nr | head -n10)
echo "█████▒▒▒▒▒ 50%"
#Sauvegarde de la liste triee par ordre decroissant
echo  "$premiere_liste" > tmp/premiere_liste

#Creation de la liste de data pour l'histogramme par ordre croissant
liste_data=$(echo "$premiere_liste" | sort  -t';' -k2n)

echo "███████▒▒▒ 70%"
echo  "$liste_data" > demo/d1.txt


#Histogramme horizontale

gnuplot_script="tmp/gnuplotscript.txt"
cat <<'EQF' > "$gnuplot_script" # debut du gnuplot_script

#On s'occupe du ficher qu'on va creer, ici un png
set terminal png
set output "demo/d1.png"

set title "Nombre de trajets par conducteur" #Titre

set datafile separator ';' #Separation des colonnes par des ;

set yrange [0:*]      #Commence a zero, trouve le max depuis les data
set style fill solid  #Boites solides colorees
unset key             #Supprime tous les titres

myBoxWidth = 0.6      #Largeur des boites
set offsets 0,0,0.5-myBoxWidth/2.,0.5  # Emplacement des boites

#myColor = "rgb '#FF0000'"

#Affichage de l'histogramme par gnuplot
plot "demo/d1.txt" using (0.5*$2):0:(0.5*$2):(myBoxWidth/2):($0+1):ytic(1) with boxxy lc var

#Fin du gnuplot_script

EQF


#Execution du gnuplot avec le script cree
gnuplot "$gnuplot_script"
echo "████████▒▒ 80%"
xdg-open "demo/d1.png"

#Suppression du fichier de script temporaire
rm "$gnuplot_script" tmp/premiere_liste

echo "██████████ 100%"
end=$(echo $SECONDS );

echo "Le programme a ete execute en $(($end - $start)) secondes."
