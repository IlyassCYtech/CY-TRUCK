#include "S.h"



//_________________________________________________________________
//                             MAIN
//_________________________________________________________________


int main() {

    // Initialisation de l'arbre AVL
    struct Info ville;
    struct Node *root = NULL;


    // Ouverture du fichier CSV
    FILE *file = fopen("tmp/done.csv", "r");

    if (file == NULL) {
        perror("Erreur lors de l'ouverture du fichier");
        return 0;
    }

    // Déclaration de variables pour stocker les valeurs des colonnes du fichier CSV
    int k1; // Variable pour stocker la valeur de la première colonne (K1)
    float k2, k3, k4; // Variable pour stocker la valeur de la deuxième colonne (K2)
    int index = 0;
    char line[1024]; // Buffer pour stocker chaque ligne lue
    int lineNum = 0;
   

 // Lecture des lignes du fichiers CSV 
     while (fgets(line, 1024, file)) {
        lineNum++;
        // Essayer de lire les 4 valeurs attendues
        if (sscanf(line, "%d;%f;%f;%f", &k1, &k2, &k3, &k4) == 4) {
            ville.trajet = k1;
            ville.diff = k4 - k3;
            ville.min = k3;
            ville.max = k4;
            ville.moyenne = k2;
            root = insertNode(root, ville);
        } else {
            fprintf(stderr, "Erreur de format à la ligne %d : contenu ignoré.\n", lineNum);
            freeNode(root);
            fclose(file);
            return 1;
        }
    }
// Fermeture du fichier après avoir terminer la lecture
 fclose(file); 
    
    index = 0;
    struct CityWithTrajets topTen[50];            // Déclaration d'un tableau de structures pour stocker les dix premières villes
    storeCitiesInArray(root, topTen, &index);     // Stockage des informations des villes dans le tableau
    freeNode(root);                               // Libération de la mémoire allouée
    
    FILE *fichier = fopen("tmp/S.txt", "w"); // Ouvre le fichier en mode écriture

    if (fichier != NULL) {
        fclose(fichier); // Ferme le fichier pour le vider
        printf("Le fichier CSV a été vidé avec succès.\n");
    } else {
        printf("Erreur lors de l'ouverture du fichier.\n");
    }

 FILE *files = fopen("tmp/S.txt", "w");                        // Ouvre le fichier en mode écriture

    // Vérification de la réussite d'ouverture du fichier ou non
    if (files == NULL) {
        printf("Erreur lors de l'ouverture du fichier.\n");
        return 0;
    }
    
    // Boucle qui écrit les données fans le fichier
    for (int i = 0; i < 50; i++) {
        fprintf(files, "%d;%d;%f;%f;%f;0\n", i, topTen[i].trajet, topTen[i].moyenne, topTen[i].max, topTen[i].min);
    }

    fclose(files);                        // Ferme le fichier après écriture                                                               
   
    printf("Les données ont été écrites avec succès dans txt.csv \n");


    return 0;
}
   
