#!/bin/bash
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
    echo "Utilisez les touches z et s pour modifier la valeur. Appuyez sur r pour quitter."
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
        	echo "help"
        	echo " touche important :"
        	echo " z et s ou fleche: deplacement"
        	echo " entree valider un choix"
        	echo " traitement d1: "
   		sleep 5
   		
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
  


echo "$result"

# Vérification de l'existence du dossier
if [ ! -d "$dossier" ]; then
    echo "Le dossier $dossier n'existe pas."
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
            echo "Aide : Ce script prend en charge l'option -h."
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
