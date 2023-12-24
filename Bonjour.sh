#!/bin/bash

# Chemin du dossier contenant le fichier
dossier="data"

#!/bin/bash





# Boucle pour manipuler la variable value et afficher les textes correspondants



# Fonction pour afficher le deuxième menu
afficher_menu_2() {
    
    # Ajoutez ici les options de votre deuxième menu


# Variable value
value=0

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
            
            echo -e "                  \xF0\x9F\x94\xB6 Conducteurs avec le plus de trajets \xF0\x9F\x94\xB6"
            echo "                   Conducteurs et la plus grande distance"
            echo "                       Les 10 trajets les plus longs"
            echo "                    Les 10 villes les plus traversées"
            echo "                      Statistiques sur les étapes"
            echo "                            Page précédente "



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
            echo "                            Page précédente "
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
            echo "                            Page précédente "
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
            echo "                            Page précédente "
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
            echo "                            Page précédente "
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
            echo -e "                         \xF0\x9F\x94\xB6 Page précédente \xF0\x9F\x94\xB6"
            ;;
            
            
            
        *)
            echo "La valeur nest pas dans la plage définie"
            ;;
    esac

    echo "Utilisez les touches z et s pour modifier la valeur. Appuyez sur r pour quitter."
    read -s -n 1 key

    case $key in
        "s")  # Touche z
            if [ $value -lt 5 ]; then
                ((value++))
            fi
            ;;
        "z")  # Touche s
            if [ $value -gt 0 ]; then
                ((value--))
            fi
            ;;
        "r")  # Touche r pour quitter
            if [ $value -eq 5 ]; then
                attendre_touche
            fi
            return $value
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
            ;;
        *)
            echo "La valeur nest pas dans la plage définie"
            ;;
    esac
    
    echo -e "                                 \xF0\x9F\x9A\x9B"
    echo "Utilisez les touches flèche vers le haut et vers le bas pour modifier la valeur Entrée pour terminer"
    read -s -n 1 key

    case $key in
        "s")  # Flèche vers le haut
            if [ $value -lt 2 ]; then
                ((value++))
            fi
            ;;
       "z")  # Flèche vers le bas
            if [ $value -gt 0 ]; then
                ((value--))
            fi
            ;;
        "r")    # Touche Entrée pour terminer
        	if [ $value -eq 2 ]; then
        	echo "La valeur est égale à 2. Fin du programme."
        	exit 0
   		 fi
   		if [ $value -eq 0 ]; then
        	afficher_menu_2
   		 fi

            return $value
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
  result=$?
  if [ $value -eq 0 ]; then
        	afficher_menu_2
        	result=$?
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


case "$result" in
    0)
        chemin_du_script="d1/d1.sh"  # Chemin complet vers le script à exécuter
        if [ -f "$chemin_du_script" ]; then  # Vérifier si le fichier existe
            bash "$chemin_du_script"  # Exécuter le script avec bash
        else
            echo "Le fichier feur.sh n'existe pas dans le dossier spécifié."
        fi
        ;;
    
    
    
    
    
    
    1)
        chemin_du_script="d2/d2.sh"  # Chemin complet vers le script à exécuter
        if [ -f "$chemin_du_script" ]; then  # Vérifier si le fichier existe
            bash "$chemin_du_script"  # Exécuter le script avec bash
        else
            echo "Le fichier feur.sh n'existe pas dans le dossier spécifié."
        fi
        ;;
    
    2)
        chemin_du_script="traitement/feur.sh"  # Chemin complet vers le script à exécuter
        if [ -f "$chemin_du_script" ]; then  # Vérifier si le fichier existe
            bash "$chemin_du_script"  # Exécuter le script avec bash
        else
            echo "Le fichier feur.sh n'existe pas dans le dossier spécifié."
        fi
        ;;
    3)
        script="T/caca.sh"  # Chemin complet vers le script à exécuter
        if [ -f "$script" ]; then  # Vérifier si le fichier existe
            bash "$script"  # Exécuter le script avec bash
        else
            echo "Le fichier caca.sh n'existe pas dans le dossier spécifié."
        fi
        ;;
    *)
        echo "La valeur de result n'est ni 2 ni 3."
        ;;
esac
