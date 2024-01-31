#!/bin/bash

if [ ! -d "image" ]; then
    echo "Le dossier 'image' n'existe pas. Création du dossier..."
    mkdir "image"
    echo "Dossier 'image' créé avec succès."
else
    echo "Le dossier 'image' existe déjà."
fi

# Vérifier l'existence du dossier "tmp"
if [ ! -d "tmp" ]; then
    echo "Le dossier 'tmp' n'existe pas. Création du dossier..."
    mkdir "tmp"
    echo "Dossier 'tmp' créé avec succès."
else
    echo "Le dossier 'tmp' existe déjà."
fi




if [ $# -eq 0 ]; then
# Chemin du dossier contenant le fichier
dossier="data"






# Fonction pour afficher le deuxième menu
afficher_menu_2() {
   local tableau=("$@") 
    # Ajoutez ici les options de votre deuxième menu


# Variable value
value=0

while true; do
    clear

#affichage du menu
    case $value in
        0)
  echo -e "\e[33m"
  echo "      ██████╗██╗   ██╗  ████████╗██████╗ ██╗   ██╗ ██████╗██╗  ██╗"
  echo "     ██╔════╝╚██╗ ██╔╝  ╚══██╔══╝██╔══██╗██║   ██║██╔════╝██║ ██╔╝"
  echo "     ██║      ╚████╔╝█████╗██║   ██████╔╝██║   ██║██║     █████╔╝ "
  echo "     ██║       ╚██╔╝ ╚════╝██║   ██╔══██╗██║   ██║██║     ██╔═██╗ "
  echo "     ╚██████╗   ██║        ██║   ██║  ██║╚██████╔╝╚██████╗██║  ██╗"
  echo "      ╚═════╝   ╚═╝        ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝"
            
  echo -e "                  \xF0\x9F\x94\xB6 Conducteurs avec le plus de trajets \xF0\x9F\x94\xB6"
  echo "                   Conducteurs et la plus grande distance"
  echo "                       Les 10 trajets les plus longs"
  echo "                    Les 10 villes les plus traversées"
  echo "                      Statistiques sur les étapes"
  echo "              [Bonus] Conducteur avec le plus de ville traversé "



            ;;
        1)
              echo -e "\e[33m"
  echo "      ██████╗██╗   ██╗  ████████╗██████╗ ██╗   ██╗ ██████╗██╗  ██╗"
  echo "     ██╔════╝╚██╗ ██╔╝  ╚══██╔══╝██╔══██╗██║   ██║██╔════╝██║ ██╔╝"
  echo "     ██║      ╚████╔╝█████╗██║   ██████╔╝██║   ██║██║     █████╔╝ "
  echo "     ██║       ╚██╔╝ ╚════╝██║   ██╔══██╗██║   ██║██║     ██╔═██╗ "
  echo "     ╚██████╗   ██║        ██║   ██║  ██║╚██████╔╝╚██████╗██║  ██╗"
  echo "      ╚═════╝   ╚═╝        ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝"
            
            
 echo "                     Conducteurs avec le plus de trajets "
 echo -e "                \xF0\x9F\x94\xB6 Conducteurs et la plus grande distance \xF0\x9F\x94\xB6"
 echo "                       Les 10 trajets les plus longs"
 echo "                    Les 10 villes les plus traversées"
 echo "                      Statistiques sur les étapes"
 echo "              [Bonus] Conducteur avec le plus de ville traversé "
            ;;
        2)  
              echo -e "\e[33m"
  echo "      ██████╗██╗   ██╗  ████████╗██████╗ ██╗   ██╗ ██████╗██╗  ██╗"
  echo "     ██╔════╝╚██╗ ██╔╝  ╚══██╔══╝██╔══██╗██║   ██║██╔════╝██║ ██╔╝"
  echo "     ██║      ╚████╔╝█████╗██║   ██████╔╝██║   ██║██║     █████╔╝ "
  echo "     ██║       ╚██╔╝ ╚════╝██║   ██╔══██╗██║   ██║██║     ██╔═██╗ "
  echo "     ╚██████╗   ██║        ██║   ██║  ██║╚██████╔╝╚██████╗██║  ██╗"
  echo "      ╚═════╝   ╚═╝        ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝"
            
  echo "                     Conducteurs avec le plus de trajets"
  echo "                   Conducteurs et la plus grande distance"
  echo -e "                    \xF0\x9F\x94\xB6 Les 10 trajets les plus longs \xF0\x9F\x94\xB6"
  echo "                    Les 10 villes les plus traversées"
  echo "                      Statistiques sur les étapes"
  echo "              [Bonus] Conducteur avec le plus de ville traversé "
            ;;
         3)  
              echo -e "\e[33m"
  echo "      ██████╗██╗   ██╗  ████████╗██████╗ ██╗   ██╗ ██████╗██╗  ██╗"
  echo "     ██╔════╝╚██╗ ██╔╝  ╚══██╔══╝██╔══██╗██║   ██║██╔════╝██║ ██╔╝"
  echo "     ██║      ╚████╔╝█████╗██║   ██████╔╝██║   ██║██║     █████╔╝ "
  echo "     ██║       ╚██╔╝ ╚════╝██║   ██╔══██╗██║   ██║██║     ██╔═██╗ "
  echo "     ╚██████╗   ██║        ██║   ██║  ██║╚██████╔╝╚██████╗██║  ██╗"
  echo "      ╚═════╝   ╚═╝        ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝"
            
  echo "                     Conducteurs avec le plus de trajets"
  echo "                   Conducteurs et la plus grande distance"
  echo "                       Les 10 trajets les plus longs"
  echo -e "                 \xF0\x9F\x94\xB6 Les 10 villes les plus traversées \xF0\x9F\x94\xB6"
  echo "                      Statistiques sur les étapes"
  echo "              [Bonus] Conducteur avec le plus de ville traversé "
            ;;
           
          4)  
              echo -e "\e[33m"
  echo "      ██████╗██╗   ██╗  ████████╗██████╗ ██╗   ██╗ ██████╗██╗  ██╗"
  echo "     ██╔════╝╚██╗ ██╔╝  ╚══██╔══╝██╔══██╗██║   ██║██╔════╝██║ ██╔╝"
  echo "     ██║      ╚████╔╝█████╗██║   ██████╔╝██║   ██║██║     █████╔╝ "
  echo "     ██║       ╚██╔╝ ╚════╝██║   ██╔══██╗██║   ██║██║     ██╔═██╗ "
  echo "     ╚██████╗   ██║        ██║   ██║  ██║╚██████╔╝╚██████╗██║  ██╗"
  echo "      ╚═════╝   ╚═╝        ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝"
            
  echo "                     Conducteurs avec le plus de trajets"
  echo "                   Conducteurs et la plus grande distance"
  echo "                       Les 10 trajets les plus longs"
  echo "                    Les 10 villes les plus traversées "
  echo -e "                   \xF0\x9F\x94\xB6 Statistiques sur les étapes \xF0\x9F\x94\xB6"
  echo "              [Bonus] Conducteur avec le plus de ville traversé "
            ;;
           5)  
              echo -e "\e[33m"
  echo "      ██████╗██╗   ██╗  ████████╗██████╗ ██╗   ██╗ ██████╗██╗  ██╗"
  echo "     ██╔════╝╚██╗ ██╔╝  ╚══██╔══╝██╔══██╗██║   ██║██╔════╝██║ ██╔╝"
  echo "     ██║      ╚████╔╝█████╗██║   ██████╔╝██║   ██║██║     █████╔╝ "
  echo "     ██║       ╚██╔╝ ╚════╝██║   ██╔══██╗██║   ██║██║     ██╔═██╗ "
  echo "     ╚██████╗   ██║        ██║   ██║  ██║╚██████╔╝╚██████╗██║  ██╗"
  echo "      ╚═════╝   ╚═╝        ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝"
            
  echo "                     Conducteurs avec le plus de trajets"
  echo "                   Conducteurs et la plus grande distance"
  echo "                       Les 10 trajets les plus longs"
  echo "                    Les 10 villes les plus traversées "
  echo "                      Statistiques sur les étapes"
  echo -e "           \xF0\x9F\x94\xB6 [Bonus] Conducteur avec le plus de ville traversé   \xF0\x9F\x94\xB6"


            ;;
 
            
            
        *)
            echo "La valeur nest pas dans la plage définie"
            ;;
    esac

#se promener dans le menu
    echo "Utilisez les touches z et s pour modifier la valeur. Appuyez sur entrée pour quitter."
    echo "h pour aide"
    read -s -n 1 key

    case $key in
            $'\033') # Check if the first character is the escape character
            read -s -n 2 key  # Read the next two characters
            case $key in
                '[A')  # Up arrow key
                    if [ $value -gt 0 ]; then
                        ((value--))
                    fi
                    ;;
                '[B')  # Down arrow key
                    if [ $value -lt 6 ]; then
                        ((value++))
                    fi
                    ;;
            esac
            ;;
          "s")  # Touche z
            if [ $value -lt 6 ]; then
                ((value++))
            fi
            ;;
	 "h") 
  		clear
                echo -e "Avec interface :"
		echo -e ""
		echo -e ""
		echo -e "Utilisation :"
		echo -e ""
		echo -e "\t 🔼 Pour monter dans l'interface"
		echo -e "\t 🔽 Pour descendre dans l'interface"
		echo -e "\t Appuyer sur Entré pour validé"
		echo -e ""
		echo -e "Liste des traitements disponibles :"
		echo -e ""
		echo -e "\t 🟦 Traitement -d1    |  Conducteur avec le plus de trajets       |  Temps d'execution 6 à 8 secondes"
		echo -e "\t 🟩 Traitement -d2    |  Conducteurs et la plus grande disctance  |  Temps d'execution 3 à 5 secondes"  
		echo -e "\t 🟨 Traitement -L     |  Les 10 trajets les plus longs            |  Temps d'execution 6 à 8 secondes"
		echo -e "\t 🟧 Traitement -T     |  Les 10 villes les plus traversées        |  Temps d'execution 14 à 16 secondes"
		echo -e "\t 🟥 Traitement -S     |  Statistiques sur les étapes              |  Temps d'execution 25 à 30 secondes"
		echo -e "\t 🟪 Traitement -Bonus |  Conducteur avec le plus de trajet        |  Temps d'execution 26 à 30 secondes"
		echo -e ""
		echo -e ""
		echo -e "Ajouter 5 sec en appuyant sur 'Entré'"
  		sleep 5
          "z")  # Touche s
            if [ $value -gt 0 ]; then
                ((value--))
            fi
            ;;
         $'\0')  # Touche r
           existe=false
for element in "${tableau[@]}"; do
    if [ "$element" == "$value" ]; then
        existe=true
        break  # Sortir de la boucle dès que la valeur est trouvée
    fi
done
if $existe; then
    echo "Le traitement est deja choisi"
else
    return $value
fi
            ;;

    esac
done
}








attendre_touche() {
value=0  # Déclaration de la variable value

while true; do
    clear

    case $value in
        0)
              echo -e "\e[33m"
  echo "      ██████╗██╗   ██╗  ████████╗██████╗ ██╗   ██╗ ██████╗██╗  ██╗"
  echo "     ██╔════╝╚██╗ ██╔╝  ╚══██╔══╝██╔══██╗██║   ██║██╔════╝██║ ██╔╝"
  echo "     ██║      ╚████╔╝█████╗██║   ██████╔╝██║   ██║██║     █████╔╝ "
  echo "     ██║       ╚██╔╝ ╚════╝██║   ██╔══██╗██║   ██║██║     ██╔═██╗ "
  echo "     ╚██████╗   ██║        ██║   ██║  ██║╚██████╔╝╚██████╗██║  ██╗"
  echo "      ╚═════╝   ╚═╝        ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝"
            
  echo -e "                           \xF0\x9F\x94\xB6 Traitement \xF0\x9F\x94\xB6"
  echo "                        Vérification de fichier"
  echo "                               Quitter"
  echo "                                Help"



            ;;
        1)
              echo -e "\e[33m"
  echo "      ██████╗██╗   ██╗  ████████╗██████╗ ██╗   ██╗ ██████╗██╗  ██╗"
  echo "     ██╔════╝╚██╗ ██╔╝  ╚══██╔══╝██╔══██╗██║   ██║██╔════╝██║ ██╔╝"
  echo "     ██║      ╚████╔╝█████╗██║   ██████╔╝██║   ██║██║     █████╔╝ "
  echo "     ██║       ╚██╔╝ ╚════╝██║   ██╔══██╗██║   ██║██║     ██╔═██╗ "
  echo "     ╚██████╗   ██║        ██║   ██║  ██║╚██████╔╝╚██████╗██║  ██╗"
  echo "      ╚═════╝   ╚═╝        ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝"
            
  echo "                              Traitement"
  echo -e "                     \xF0\x9F\x94\xB6 Vérification de fichier \xF0\x9F\x94\xB6"
  echo "                               Quitter"
  echo "                                Help"
            ;;
        2)  
              echo -e "\e[33m"
  echo "      ██████╗██╗   ██╗  ████████╗██████╗ ██╗   ██╗ ██████╗██╗  ██╗"
  echo "     ██╔════╝╚██╗ ██╔╝  ╚══██╔══╝██╔══██╗██║   ██║██╔════╝██║ ██╔╝"
  echo "     ██║      ╚████╔╝█████╗██║   ██████╔╝██║   ██║██║     █████╔╝ "
  echo "     ██║       ╚██╔╝ ╚════╝██║   ██╔══██╗██║   ██║██║     ██╔═██╗ "
  echo "     ╚██████╗   ██║        ██║   ██║  ██║╚██████╔╝╚██████╗██║  ██╗"
  echo "      ╚═════╝   ╚═╝        ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝"
            
  echo "                              Traitement"
  echo "                        Vérification de fichier"
  echo -e "                            \xF0\x9F\x94\xB6 Quitter \xF0\x9F\x94\xB6"
  echo "                                Help"
            ;;
        
            3)  
              echo -e "\e[33m"
  echo "      ██████╗██╗   ██╗  ████████╗██████╗ ██╗   ██╗ ██████╗██╗  ██╗"
  echo "     ██╔════╝╚██╗ ██╔╝  ╚══██╔══╝██╔══██╗██║   ██║██╔════╝██║ ██╔╝"
  echo "     ██║      ╚████╔╝█████╗██║   ██████╔╝██║   ██║██║     █████╔╝ "
  echo "     ██║       ╚██╔╝ ╚════╝██║   ██╔══██╗██║   ██║██║     ██╔═██╗ "
  echo "     ╚██████╗   ██║        ██║   ██║  ██║╚██████╔╝╚██████╗██║  ██╗"
  echo "      ╚═════╝   ╚═╝        ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝"
            
  echo "                              Traitement"
  echo "                        Vérification de fichier"
  echo "                               Quitter "
  echo -e "                            \xF0\x9F\x94\xB6  Help \xF0\x9F\x94\xB6"
            ;;
        *)
  echo "La valeur nest pas dans la plage définie"
            ;;
    esac
    
  echo -e "                                 \xF0\x9F\x9A\x9B"
  echo "Utilisez les touches flèche vers le haut et vers le bas pour modifier la valeur Entrée pour terminer"
  read -s -n 1 key

  case $key in
        $'\033') # Check if the first character is the escape character
            read -s -n 2 key  # Read the next two characters
            case $key in
                '[A')  # Up arrow key
                    if [ $value -gt 0 ]; then
                        ((value--))
                    fi
                    ;;
                '[B')  # Down arrow key
                    if [ $value -lt 3 ]; then
                        ((value++))
                    fi
                    ;;
            esac
            ;;
            
        "s")  # Flèche vers le haut
            if [ $value -lt 3 ]; then
                ((value++))
            fi
            ;;
       "z")  # Flèche vers le bas
            if [ $value -gt 0 ]; then
                ((value--))
            fi
            ;;
        $'\0')    # Touche Entrée pour terminer
        	if [ $value -eq 2 ]; then
        	echo "Fin du programme."
        	exit 0
   		 fi
   		if [ $value -eq 0 ]; then
        	#afficher_menu_2
   		 return $value
   		 fi
   		 if [ $value -eq 3 ]; then
        	clear
        	echo -e "Avec interface :"
		echo -e ""
		echo -e ""
		echo -e "Utilisation :"
		echo -e ""
		echo -e "\t 🔼 Pour monter dans l'interface"
		echo -e "\t 🔽 Pour descendre dans l'interface"
		echo -e "\t Appuyer sur Entré pour validé"
		echo -e ""
		echo -e "Liste des traitements disponibles :"
		echo -e ""
		echo -e "\t 🟦 Traitement -d1    |  Conducteur avec le plus de trajets       |  Temps d'execution 6 à 8 secondes"
		echo -e "\t 🟩 Traitement -d2    |  Conducteurs et la plus grande disctance  |  Temps d'execution 3 à 5 secondes"  
		echo -e "\t 🟨 Traitement -L     |  Les 10 trajets les plus longs            |  Temps d'execution 6 à 8 secondes"
		echo -e "\t 🟧 Traitement -T     |  Les 10 villes les plus traversées        |  Temps d'execution 14 à 16 secondes"
		echo -e "\t 🟥 Traitement -S     |  Statistiques sur les étapes              |  Temps d'execution 25 à 30 secondes"
		echo -e "\t 🟪 Traitement -Bonus |  Conducteur avec le plus de trajet        |  Temps d'execution 26 à 30 secondes"
		echo -e ""
		echo -e ""
		echo -e "Ajouter 5 sec en appuyant sur 'Entré'"
   		sleep 5
   		
   		fi
   		if [ $value -eq 1 ]; then
        # Vérification du nombre de fichiers dans le dossier
        nb_fichiers=$(ls -1 "$dossier" | wc -l)
        if [ "$nb_fichiers" -ne 1 ]; then
            echo "Le dossier $dossier ne doit contenir qu'un seul fichier."
            exit 1
        fi

        # Vérification si le fichier est un .csv
        fichier=$(ls "$dossier"/*.csv 2>/dev/null)
        if [ -z "$fichier" ]; then
            echo "Le fichier dans $dossier n'est pas un fichier .csv ou n'existe pas."
            exit 1
        fi
        tempfile="tmp/tmp.txt"

        # Supprimer la première ligne (en-tête)
        sed '1d' "$fichier" > "$tempfile"

        # Utiliser awk pour la vérification
        awk -F ';' '
{
    if (!($1 ~ /^[0-9]+(\.[0-9]+)?$/ && $2 ~ /^[0-9]+(\.[0-9]+)?$/ && $5 ~ /^[0-9]+(\.[0-9]+)?$/)) {
        print "Erreur : k1, k2 ou k5 n'est pas un nombre valide."
        exit 1
    }
    if (!($3 ~ /^[A-Za-z]+$/ && $4 ~ /^[A-Za-z]+$/ && $6 ~ /^[A-Za-z]+$/)) {
        print "Erreur : k3, k4 ou k6 n'est pas un caractère valide."
        exit 1
    }
}
' "$tempfile"

        clear
        echo "Le fichier '$fichier' est valide."
        sleep 1
        rm -f tmp/tmp.txt
                fi

            ;;
    esac
done
}




  clear
  echo -e "\e[33m"
  echo "      ██████╗██╗   ██╗  ████████╗██████╗ ██╗   ██╗ ██████╗██╗  ██╗"
  echo "     ██╔════╝╚██╗ ██╔╝  ╚══██╔══╝██╔══██╗██║   ██║██╔════╝██║ ██╔╝"
  echo "     ██║      ╚████╔╝█████╗██║   ██████╔╝██║   ██║██║     █████╔╝ "
  echo "     ██║       ╚██╔╝ ╚════╝██║   ██╔══██╗██║   ██║██║     ██╔═██╗ "
  echo "     ╚██████╗   ██║        ██║   ██║  ██║╚██████╔╝╚██████╗██║  ██╗"
  echo "      ╚═════╝   ╚═╝        ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝"
  echo "Bienvenue,appuyez sur Entrée pour ouvrir le menu."
  read nom
  clear
  echo -e "\e[33m"
  echo "      ██████╗██╗   ██╗  ████████╗██████╗ ██╗   ██╗ ██████╗██╗  ██╗"
  echo "     ██╔════╝╚██╗ ██╔╝  ╚══██╔══╝██╔══██╗██║   ██║██╔════╝██║ ██╔╝"
  echo "     ██║      ╚████╔╝█████╗██║   ██████╔╝██║   ██║██║     █████╔╝ "
  echo "     ██║       ╚██╔╝ ╚════╝██║   ██╔══██╗██║   ██║██║     ██╔═██╗ "
  echo "     ╚██████╗   ██║        ██║   ██║  ██║╚██████╔╝╚██████╗██║  ██╗"
  echo "      ╚═════╝   ╚═╝        ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝"
  
  
 



  
  
  
  
  attendre_touche
  value=$?
  
  if [ $value -eq 0 ]; then
  		
	while true; do
   	 read -p "Entrez la taille du tableau (entre 1 et 6) : " taille
  	  if [[ "$taille" =~ ^[1-6]$ ]]; then
   	     break
  	  else
  	      echo "Veuillez entrer une valeur entre 1 et 6."
	    fi
	done
	tableau=()
    for ((i=1; i<=$taille; i++)); do
    afficher_menu_2 "${tableau[@]}"
    tableau[$((i-1))]=$?
done

        	
fi

        



# Vérification du nombre de fichiers dans le dossier
nb_fichiers=$(ls -1 "$dossier" | wc -l)
if [ "$nb_fichiers" -ne 1 ]; then
    echo "Le dossier $dossier ne doit contenir qu'un seul fichier."
    exit 1
fi

# Vérification si le fichier est un .csv
fichier=$(ls "$dossier"/*.csv 2>/dev/null)
if [ -z "$fichier" ]; then
    echo "Le fichier dans $dossier n'est pas un fichier .csv ou n'existe pas."
    exit 1
fi
tempfile="tmp/tmp.txt"
sed '1d' "$fichier" > "$tempfile"
        
        # Lire chaque ligne du fichier
        awk -F ';' '
{
    if (!($1 ~ /^[0-9]+(\.[0-9]+)?$/ && $2 ~ /^[0-9]+(\.[0-9]+)?$/ && $5 ~ /^[0-9]+(\.[0-9]+)?$/)) {
        print "Erreur : k1, k2 ou k5 n'est pas un nombre valide."
        exit 1
    }
    if (!($3 ~ /^[A-Za-z]+$/ && $4 ~ /^[A-Za-z]+$/ && $6 ~ /^[A-Za-z]+$/)) {
        print "Erreur : k3, k4 ou k6 n'est pas un caractère valide."
        exit 1
    }
}
' "$tempfile"


           
      
  

rm -f tmp/tmp.txt
clear


for ((i=1; i<=$taille; i++)); do



 case "${tableau[i-1]}" in
    0)
        chemin_du_script="d1/d1.sh"  # Chemin complet vers le script à exécuter
        if [ -f "$chemin_du_script" ]; then  # Vérifier si le fichier existe
            bash "$chemin_du_script" "$fichier" # Exécuter le script avec bash
        else
            echo "Le fichier feur.sh n'existe pas dans le dossier spécifié."
        fi
        ;;
    
    
    
    
    
    
    1)
        chemin_du_script="d2/d2.sh"  # Chemin complet vers le script à exécuter
        if [ -f "$chemin_du_script" ]; then  # Vérifier si le fichier existe
            bash "$chemin_du_script" "$fichier" # Exécuter le script avec bash
        else
            echo "Le fichier feur.sh n'existe pas dans le dossier spécifié."
        fi
        ;;
    
    2)
        chemin_du_script="L/L.sh"  # Chemin complet vers le script à exécuter
        if [ -f "$chemin_du_script" ]; then  # Vérifier si le fichier existe
            bash "$chemin_du_script" "$fichier" # Exécuter le script avec bash
        else
            echo "Le fichier feur.sh n'existe pas dans le dossier spécifié."
        fi
        ;;
    3)
        script="T/T.sh"  # Chemin complet vers le script à exécuter
        if [ -f "$script" ]; then  # Vérifier si le fichier existe
            bash "$script" "$fichier" # Exécuter le script avec bash
        else
            echo "Le fichier T.sh n'existe pas dans le dossier spécifié."
        fi
        ;;
     4)
        chemin_du_script="S/S.sh"  # Chemin complet vers le script à exécuter
        if [ -f "$chemin_du_script" ]; then  # Vérifier si le fichier existe
            bash "$chemin_du_script" "$fichier" # Exécuter le script avec bash
        else
            echo "Le fichier S.sh n'existe pas dans le dossier spécifié."
        fi
        ;;   
    5)
        chemin_du_script="bonus/bonus.sh"  # Chemin complet vers le script à exécuter
        if [ -f "$chemin_du_script" ]; then  # Vérifier si le fichier existe
            bash "$chemin_du_script" "$fichier" # Exécuter le script avec bash
        else
            echo "Le fichier bonus.sh n'existe pas dans le dossier spécifié."
        fi
        ;;
    
    
    *)
        echo "La valeur de result n'est ni 2 ni 3."
        ;;
esac
done

fi



for arg in "$@"; do
        if [ "$arg" = "-h" ]; then
            # Votre code à exécuter si -h est passé en argument
                echo -e ""
		echo -e ""
		echo -e ""

		echo -e "Sans interface :"
		echo -e ""
		echo -e ""
		echo -e "Utilisation :"
		echo -e ""
		echo -e "Ecrire './Home.sh' avec différents arguments"
		echo -e ""
		echo -e "\tPremière argument          :  Chemin ou se trouve le fichier 'data.csv'"
		echo -e "\tArguments supplémentaires  :  Indiquer les traitements souhaité"
		echo -e ""
		echo -e "\t 🟦 Pour executer traitement -d1 ajouter l'argument '-d1'"
		echo -e "\t 🟩 Pour executer traitement -d2 ajouter l'argument '-d2'"
		echo -e "\t 🟨 Pour executer traitement -l ajouter l'argument '-l'"
		echo -e "\t 🟧 Pour executer traitement -t ajouter l'argument '-t'"
		echo -e "\t 🟥 Pour executer traitement -s ajouter l'argument '-s'"
		echo -e "\t 🟪 Pour executer traitement -bonus ajouter l'argument '-bonus'"


            exit 0
        fi
    done
 
 if [ "$#" -lt 1 ]; then

    exit 1
fi

dossier="data"
 
 # Vérification de l'existence du dossier
if [ ! -d "$dossier" ]; then
    echo "Le dossier $dossier n'existe pas."
    exit 1
fi


# Récupérer le premier argument
chemin_fichier="$1" 

# Vérifier si le fichier existe et a l'extension .csv
if [ -f "$chemin_fichier" ] && [[ "$chemin_fichier" == *.csv ]]; then
    echo "Le fichier $chemin_fichier est un fichier .csv valide."

    # Copier le fichier vers le dossier "data/"
    dossier_data="data/"
    mkdir -p "$dossier_data"  # Créer le dossier s'il n'existe pas
    cp "$chemin_fichier" "$dossier_data"
    echo "Le fichier a été copié vers $dossier_data."
else
    echo "Le fichier $chemin_fichier n'existe pas ou n'a pas l'extension .csv."
    exit 1
fi



 

# Vérification du nombre de fichiers dans le dossier
nb_fichiers=$(ls -1 "$dossier" | wc -l)
if [ "$nb_fichiers" -ne 1 ]; then
    echo "Le dossier $dossier ne doit contenir qu'un seul fichier."
    exit 1
fi

# Vérification si le fichier est un .csv
fichier=$(ls "$dossier"/*.csv 2>/dev/null)
if [ -z "$fichier" ]; then
    echo "Le fichier dans $dossier n'est pas un fichier .csv ou n'existe pas."
    exit 1
fi

# Vérification du nombre de fichiers dans le dossier
nb_fichiers=$(ls -1 "$dossier" | wc -l)
if [ "$nb_fichiers" -ne 1 ]; then
    echo "Le dossier $dossier ne doit contenir qu'un seul fichier."
    exit 1
fi

# Vérification si le fichier est un .csv
fichier=$(ls "$dossier"/*.csv 2>/dev/null)
if [ -z "$fichier" ]; then
    echo "Le fichier dans $dossier n'est pas un fichier .csv ou n'existe pas."
    exit 1
fi
tempfile="tmp/tmp.txt"
sed '1d' "$fichier" > "$tempfile"
        
        # Lire chaque ligne du fichier
        awk -F ';' '
{
    if (!($1 ~ /^[0-9]+(\.[0-9]+)?$/ && $2 ~ /^[0-9]+(\.[0-9]+)?$/ && $5 ~ /^[0-9]+(\.[0-9]+)?$/)) {
        print "Erreur : k1, k2 ou k5 n'est pas un nombre valide."
        exit 1
    }
    if (!($3 ~ /^[A-Za-z]+$/ && $4 ~ /^[A-Za-z]+$/ && $6 ~ /^[A-Za-z]+$/)) {
        print "Erreur : k3, k4 ou k6 n'est pas un caractère valide."
        exit 1
    }
}
' "$tempfile"


           
      
  

rm -f tmp/tmp.txt
clear


   clear
  echo -e "\e[33m"
  echo "      ██████╗██╗   ██╗  ████████╗██████╗ ██╗   ██╗ ██████╗██╗  ██╗"
  echo "     ██╔════╝╚██╗ ██╔╝  ╚══██╔══╝██╔══██╗██║   ██║██╔════╝██║ ██╔╝"
  echo "     ██║      ╚████╔╝█████╗██║   ██████╔╝██║   ██║██║     █████╔╝ "
  echo "     ██║       ╚██╔╝ ╚════╝██║   ██╔══██╗██║   ██║██║     ██╔═██╗ "
  echo "     ╚██████╗   ██║        ██║   ██║  ██║╚██████╔╝╚██████╗██║  ██╗"
  echo "      ╚═════╝   ╚═╝        ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝"

shift
for arg in "$@"; do
        case "$arg" in
    -d1 | -D1)
        chemin_du_script="d1/d1.sh"  # Chemin complet vers le script à exécuter
        if [ -f "$chemin_du_script" ]; then  # Vérifier si le fichier existe
            bash "$chemin_du_script" "$fichier" # Exécuter le script avec bash
        else
            echo "Le fichier feur.sh n'existe pas dans le dossier spécifié."
        fi
        ;;
  
    -d2 | -D2)
        chemin_du_script="d2/d2.sh"  # Chemin complet vers le script à exécuter
        if [ -f "$chemin_du_script" ]; then  # Vérifier si le fichier existe
            bash "$chemin_du_script" "$fichier" # Exécuter le script avec bash
        else
            echo "Le fichier feur.sh n'existe pas dans le dossier spécifié."
        fi
        ;;
    
    -L| -l)
        chemin_du_script="L/L.sh"  # Chemin complet vers le script à exécuter
        if [ -f "$chemin_du_script" ]; then  # Vérifier si le fichier existe
            bash "$chemin_du_script" "$fichier" # Exécuter le script avec bash
        else
            echo "Le fichier L.sh n'existe pas dans le dossier spécifié."
        fi
        ;;
    -t | -T)
        script="T/T.sh"  # Chemin complet vers le script à exécuter
        if [ -f "$script" ]; then  # Vérifier si le fichier existe
            bash "$script" "$fichier" # Exécuter le script avec bash
        else
            echo "Le fichier T.sh n'existe pas dans le dossier spécifié."
        fi
        ;;
     -S| -s)
        chemin_du_script="S/S.sh"  # Chemin complet vers le script à exécuter
        if [ -f "$chemin_du_script" ]; then  # Vérifier si le fichier existe
            bash "$chemin_du_script" "$fichier" # Exécuter le script avec bash
        else
            echo "Le fichier S.sh n'existe pas dans le dossier spécifié."
        fi
        ;;   
    -bonus | -Bonus | -BONUS)
        chemin_du_script="bonus/bonus.sh"  # Chemin complet vers le script à exécuter
        if [ -f "$chemin_du_script" ]; then  # Vérifier si le fichier existe
            bash "$chemin_du_script" "$fichier" # Exécuter le script avec bash
        else
            echo "Le fichier bonus.sh n'existe pas dans le dossier spécifié."
        fi
        ;;
    
    
    *)
        echo "erreur d'argument"
        exit 0
        ;;
esac
    done
