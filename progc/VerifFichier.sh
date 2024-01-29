#!/bin/bash


#Verification de l'unique existence de l'argument
if [ $# -ne 1 ]; then
	echo "Pas d'argument ou plus d'un argument !"
	exit
fi


#Si le data.csv se trouve au mauvais endroit, on le met dans le dossier data
cd data
cheminDossierData=$(pwd)
cd ..

if [ $1 != $cheminDossierData ]; then
	mv data.csv $cheminDossierData 
	#echo "Fichier deplace"
fi 


#Si dans le dossier 'data' il y a un fichier csv avec un nom different, on fait une copie qu'on renomme data.csv 
supressionFichier=0
if [ -e data/data.csv ]; then
	#echo "Votre fichier existe"
else 
	#echo "Votre fichier n'existe pas"
	
	#Verification qu'il existe bien qu'un seul fichier dans le dossier data
	nombreFichier=$(find /home/legrosgabr/projet/data -type f | wc -l | awk '{print $1}')
	if [ $nombreFichier -ne 1 ]; then
		echo "Aucun fichier existant ou plus d'un fichier dans le fichier 'data', veuillez corriger cela"
		exit 
	fi
	
	fichier1=$(ls data/) #A cause du ls, la verification ci-dessus est obligatoire
	cp "data/$fichier1" "data/data.csv"
	#echo "Votre fichier a ete copie et renomme en data.csv"
	supressionFichier=1
fi






#S'il y a eu copie, suppression a la fin du programme 

#/!\ il faut attendre la fin du programme complet
if [ $supressionFichier -eq 1 ]; then
	rm data/data.csv
	#echo "La copie a ete supprime"
fi

