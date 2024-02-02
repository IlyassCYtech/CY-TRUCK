#include "T.h"

//_________________________________________________________________
//                             MAIN
//_________________________________________________________________

int main() {
    
    struct Info ville;
    struct Node *root = NULL;

    //Ouverture du fichier csv recuperer par le shell
    FILE *file = fopen("tmp/fusionne.csv", "r");

    //Erreur si ouverture mal effectue
    if (file == NULL) {
        perror("Erreur lors de l'ouverture du fichier");
        return 0;
    }

    char k1[50]; // Variable pour stocker la valeur de la première colonne (K1)
    int k2, k3;  // Variable pour stocker la valeur de la deuxième colonne (K2)
    int index = 0;
    char line[1024]; // Buffer pour stocker chaque ligne lue
    int lineNum = 0;

    //On insere notre fichier csv d'entree dans l'avl
      while (fgets(line, 1024, file)) {
        lineNum++;
             if (sscanf(line, "%[^;];%d;%d\n", k1, &k2, &k3) == 3) {
                strcpy(ville.nom, k1);
                ville.nombre_trajet = k2;
                ville.depart = k3;
                root = insertNode(root, ville);
             } else {
             fprintf(stderr, "Erreur de format à la ligne %d : contenu ignoré.\n", lineNum);
             freeTree(root);
             fclose(file);
             return 1;
        }
    }
    index = 0;
    struct CityWithTrajets topTen[10];
     
    storeCitiesInArray(root, topTen, &index);  // Enregistre les 10 plus grandes valeurs dans le tableau 'topTen'
    freeTree(root);                            // Libere l'avl existant 
    trierParNom(topTen, 10);                   // On trie par ordre alphabetique les noms des 10 plus grandes valeurs  

    FILE *fichier = fopen("tmp/tmp.txt", "w"); // Ouvre le fichier en mode écriture

    if (fichier != NULL) {
        fclose(fichier); // Ferme le fichier pour le vider
        printf("Le fichier CSV a été vidé avec succès.\n");
    } else {
        printf("Erreur lors de l'ouverture du fichier.\n");
    }
    
    FILE *files = fopen("tmp/tmp.txt", "w");    // Ouverture du fichier de sortie

    if (files == NULL) {
        printf("Erreur lors de l'ouverture du fichier.\n");
        return 0;
    }

    for (int i = 0; i < 10; i++) {
        fprintf(files, "%s;%d;%d\n", topTen[i].nom, topTen[i].nombre_trajet, topTen[i].depart);    // Remplissage du fichier de sortie
    }

    fclose(files);
    printf("Les données ont été écrites avec succès dans tmp.txt");

    return 0;

}
   
    
