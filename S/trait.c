#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

// Structure d'un nœud dans l'arbre AVL
struct Node {
    struct Info *ville;
    struct Node *left;
    struct Node *right;
    int height;
};

struct Chainon {
    float distance;
    struct Chainon * suivant;
};



struct Info {
    int trajet;
    struct Chainon *parcour;
    float moyenne;
    float min;
    float max;
};





struct CityWithTrajets {
    int trajet;
    float moyenne;
    float min;
    float max;
};




// Fonction pour trier le tableau des villes selon le nombre de trajets
void sortCitiesArray(struct CityWithTrajets *citiesArray, int size) {
    for (int i = 0; i < size - 1; i++) {
        for (int j = 0; j < size - i - 1; j++) {
            if ((citiesArray[j].max - citiesArray[j].min) < (citiesArray[j + 1].max - citiesArray[j+1].min)) {
                struct CityWithTrajets temp = citiesArray[j];
                citiesArray[j] = citiesArray[j + 1];
                citiesArray[j + 1] = temp;
            }
        }
    }
}



void getTopTenCities(struct CityWithTrajets *sortedCities, struct CityWithTrajets *topTen) {
    for (int i = 0; i < 50; i++) {
        topTen[i].trajet= sortedCities[i].trajet;
        topTen[i].moyenne = sortedCities[i].moyenne;
        topTen[i].min = sortedCities[i].min;
        topTen[i].max = sortedCities[i].max;
    }
}














void storeCitiesInArray(struct Node *root, struct CityWithTrajets *citiesArray, int *index) {
    if (root != NULL && *index < 300000) {
        storeCitiesInArray(root->left, citiesArray, index);

        citiesArray[*index].trajet = root->ville->trajet;
        citiesArray[*index].moyenne = root->ville->moyenne;
        citiesArray[*index].min= root->ville->min;
        citiesArray[*index].max= root->ville->max;
        (*index)++;

        storeCitiesInArray(root->right, citiesArray, index);
    }
}
/*
// Fonction pour trier le tableau des villes selon le nombre de trajets
void sortCitiesArray(struct CityWithTrajets *citiesArray, int size) {
    for (int i = 0; i < size - 1; i++) {
        for (int j = 0; j < size - i - 1; j++) {
            if (citiesArray[j].trajet < citiesArray[j + 1].trajet) {
                struct CityWithTrajets temp = citiesArray[j];
                citiesArray[j] = citiesArray[j + 1];
                citiesArray[j + 1] = temp;
            }
        }
    }
}

*/



















int nombre_elements(struct Chainon* debut) {
    int count = 0;
    struct Chainon* courant = debut;

    // Parcours de la liste jusqu'à la fin en comptant chaque élément
    while (courant != NULL) {
        count++;
        courant = courant->suivant;
    }

    return count;
}


struct Chainon* rechercheliste(struct Chainon* debut, float nom_recherche){

    struct Chainon* courant = debut;
    struct Chainon* precedent = NULL;

    // Parcours de la liste jusqu'à la fin ou jusqu'à ce que le nom soit trouvé
    while (courant != NULL) {
        // Vérification si le nom correspond
        if( courant->distance == nom_recherche) {
            // Nom trouvé, donc on arrête ici
            return debut;
        }
        // Déplacer au prochain maillon
        precedent = courant;
        courant = courant->suivant;
    }

    // Si le nom n'a pas été trouvé dans la liste, on l'ajoute à la fin
    struct Chainon* nouveau = malloc(sizeof(struct Chainon));
    nouveau->distance = nom_recherche;
    nouveau->suivant = NULL;

    // Si la liste était vide, le nouveau maillon devient le début de la liste
    if (debut == NULL) {
        debut = nouveau;
    } else {
        // Sinon, on l'ajoute à la fin de la liste
        precedent->suivant = nouveau;
    }

    return debut;
}


int counts(struct Chainon* debut) {
    int count = 0;
    struct Chainon* courant = debut;

    // Parcours de la liste jusqu'à la fin en comptant chaque élément
    while (courant != NULL) {
        count= count + courant->distance;
        courant = courant->suivant;
    }

    return count;
}




int rechercheAVL(struct Node *node, int k1, float k2) {
int index=0;
    if (node == NULL) {
        return 0; // Si l'arbre est vide, la valeur n'est pas présente
    }

    if (node->ville != NULL && node->ville->trajet == k1) {
       if(node->ville->max < k2){
        node->ville->max = k2;
}
      if(node->ville->min > k2){
        node->ville->min = k2;
}
    
    
    
    
    node->ville->parcour = rechercheliste(node->ville->parcour, k2);
    int count=nombre_elements(node->ville->parcour);
    node->ville->moyenne= (counts(node->ville->parcour)/count);
    
  
  /*     // Vérification des limites du tableau avant d'accéder à ses éléments
        while (index < 1000 && node->ville->distance[index] != NULL) {
            index++;
        }
 //node->ville->driver[index] = malloc(strlen(k2) + 1);       
node->ville->distance[index]= k2;
 for(int i=0; i<index; i++){
 valeur += node->ville->distance[index];
 }
 node->ville->moyenne =valeur/ index;

       
   */  
    } else if (k1 < node->ville->trajet) {
        return rechercheAVL(node->left, k1, k2); // Recherche dans le sous-arbre gauche
    } else {
        return rechercheAVL(node->right, k1, k2); // Recherche dans le sous-arbre droit
    }
}


void freeChainon(struct Chainon *debut) {
    while (debut != NULL) {
        struct Chainon *temp = debut;
        debut = debut->suivant;
        free(temp);
    }
}

void freeTree(struct Node *root) {
    if (root != NULL) {
        freeTree(root->left);
        freeTree(root->right);
        freeChainon(root->ville->parcour); // Libérer la liste chaînée parcour pour chaque nœud
        free(root->ville); // Libérer la mémoire pour node->ville
        free(root); // Libérer la mémoire pour le nœud
    }
}


// Fonction pour obtenir la hauteur d'un nœud
int getHeight(struct Node *N) {
    if (N == NULL)
        return 0;
    return N->height;
}

// Fonction pour obtenir le maximum de deux entiers
int max(int a, int b) {
    return (a > b) ? a : b;
}

struct Node *newNode(struct Info ville) {
    struct Node *node = (struct Node *)malloc(sizeof(struct Node));
    if (node == NULL) {
        // Gestion de l'échec d'allocation pour le nœud
        return NULL;
    }

    node->ville = (struct Info *)malloc(sizeof(struct Info));
    if (node->ville == NULL) {
        // Gestion de l'échec d'allocation pour node->ville
      free(node); // Libération de la mémoire allouée pour le nœud
        return NULL;
    }

    node->ville->parcour = malloc(sizeof(struct Chainon));
    if (node->ville->parcour == NULL) {
        // Gestion de l'échec d'allocation pour node->ville->driver[0]
        free(node->ville); // Libération de la mémoire allouée pour node->ville
       free(node); // Libération de la mémoire allouée pour le nœud
        return NULL;
    }
    node->ville->parcour = ville.parcour;
    node->ville->trajet = ville.trajet;
    node->ville->moyenne = ville.parcour->distance;
    node->ville->min = ville.parcour->distance;
    node->ville->max = ville.parcour->distance;

    node->left = NULL;
    node->right = NULL;
    node->height = 1;
    
    return node;
}






// Fonction pour faire une rotation droite
struct Node *rightRotate(struct Node *y) {
    struct Node *x = y->left;
    struct Node *T2 = x->right;

    // Rotation
    x->right = y;
    y->left = T2;

    // Mise à jour des hauteurs
    y->height = max(getHeight(y->left), getHeight(y->right)) + 1;
    x->height = max(getHeight(x->left), getHeight(x->right)) + 1;

    return x;
}

// Fonction pour faire une rotation gauche
struct Node *leftRotate(struct Node *x) {
    struct Node *y = x->right;
    struct Node *T2 = y->left;

    // Rotation
    y->left = x;
    x->right = T2;

    // Mise à jour des hauteurs
    x->height = max(getHeight(x->left), getHeight(x->right)) + 1;
    y->height = max(getHeight(y->left), getHeight(y->right)) + 1;

    return y;
}

// Obtenir le facteur d'équilibre d'un nœud
int getBalance(struct Node *N) {
    if (N == NULL)
        return 0;
    return getHeight(N->left) - getHeight(N->right);
}

// Fonction pour insérer un nœud dans un AVL
struct Node *insertNode(struct Node *node, struct Info ville) {
    // Étape d'insertion standard pour un BST
    if (node == NULL)
        return newNode(ville);

    if (ville.trajet < node->ville->trajet)
        node->left = insertNode(node->left, ville);
    else if (ville.trajet > node->ville->trajet)
        node->right = insertNode(node->right, ville);
    else {// Les éléments déjà présents ne sont pas autorisés
      
        return node;
}
    // Mise à jour de la hauteur du nœud parent
    node->height = 1 + max(getHeight(node->left), getHeight(node->right));

    // Obtenir le facteur d'équilibre de ce nœud pour vérifier l'équilibre
    int balance = getBalance(node);

    // Cas de déséquilibre : à gauche gauche
    if (balance > 1 && ville.trajet < node->left->ville->trajet)
        return rightRotate(node);

    // Cas de déséquilibre : à droite droite
    if (balance < -1 && ville.trajet > node->right->ville->trajet)
        return leftRotate(node);

    // Cas de déséquilibre : gauche droite
    if (balance > 1 && ville.trajet > node->left->ville->trajet) {
        node->left = leftRotate(node->left);
        return rightRotate(node);
    }

    // Cas de déséquilibre : droite gauche
    if (balance < -1 && ville.trajet < node->right->ville->trajet) {
        node->right = rightRotate(node->right);
        return leftRotate(node);
    }

    // Si le nœud est déjà équilibré
    return node;
}










// Fonction utilitaire pour afficher l'arbre AVL en ordre croissant
void inorderTraversal(struct Node *root) {
    if (root != NULL) {
        inorderTraversal(root->left);
        printf("%d ", root->ville->trajet);
        printf("%f ", root->ville->moyenne);
        printf("%f ", root->ville->min);
        printf("%f \n", root->ville->max);
        /*for(int i =0; i<1000;i++){
        printf("%s \n", root->ville->driver[i]);
        }*/
        inorderTraversal(root->right);
    }
}






int main(){
//char * main(int argc, char *argv[]) {
//char * c = "temp.txt";
    // Initialisation de l'arbre AVL
    struct Info ville;
    struct Node *root = NULL;

 //   int number_of_lines = atoi(argv[1]);
    FILE *file = fopen("temp.csv", "r");

    if (file == NULL) {
        perror("Erreur lors de l'ouverture du fichier");
        return 0;
    }

    int k1; // Variable pour stocker la valeur de la première colonne (K1)
    float k2; // Variable pour stocker la valeur de la deuxième colonne (K2)
    int index = 0;
   

for (int i = 0; i < 6365541; i++) {
  // for (int i = 0; i < number_of_lines; i++) {
        if (fscanf(file, "%d;%f\n", &k1, &k2) == 2) {
            if (rechercheAVL(root, k1, k2) == 0) {
                
                ville.trajet = k1;
                ville.parcour = malloc(sizeof(struct Chainon));
                ville.parcour->distance=k2;;
               root = insertNode(root, ville);
                     // Libération de la mémoire alloué
                   
                }
                
            }
        printf("%d\n", i); 
        } 
    

 inorderTraversal(root);
  
        






 

    struct CityWithTrajets cities[300000]; 
    index = 0;
    struct CityWithTrajets topTen[50];
    storeCitiesInArray(root, cities, &index);
    freeTree(root);
    sortCitiesArray(cities, index);
    getTopTenCities(cities, topTen);
    
    
    

  
    
    
    
    
    
 
    
    
    
    
    // Afficher les 10 villes avec le plus grand nombre de trajets
 /*   printf("Top 10 des villes avec le plus de trajets :\n");
    for (int i = 0; i < 10 && i < index; i++) {
        printf("Ville : %s | Nombre de trajets : %d, Nombre de chauffeurs %d\n", cities[i].nom, cities[i].nombre_trajet, cities[i].nombre_chauffeur);
    }*/
    
    for (int i = 0; i < 50; i++) {
        printf("trajet id : %d | moyenne : %f, min : %f, max : %f\n", topTen[i].trajet, topTen[i].moyenne, topTen[i].max, topTen[i].min);
    }



    FILE *fichier = fopen("tmp.txt", "w"); // Ouvre le fichier en mode écriture

    if (fichier != NULL) {
        fclose(fichier); // Ferme le fichier pour le vider
        printf("Le fichier CSV a été vidé avec succès.\n");
    } else {
        printf("Erreur lors de l'ouverture du fichier.\n");
    }
    
  

 
 
 
 
 
 
 
 
 
 
 
 
 
 FILE *files = fopen("tmp.txt", "w");

    if (files == NULL) {
        printf("Erreur lors de l'ouverture du fichier.\n");
        return 0;
    }

    

    for (int i = 0; i < 50; i++) {
        fprintf(files, "%d;%f;%f;%f\n", topTen[i].trajet, topTen[i].moyenne, topTen[i].max, topTen[i].min);
    }

    fclose(files);
    printf("Les données ont été écrites avec succès dans txt.csv");


  
free(ville.parcour);
  
  
  
  

    return 0;
}
   
    
    








      
