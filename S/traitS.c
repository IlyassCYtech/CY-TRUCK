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





struct Info {
    float diff;
    int trajet;
    float moyenne;
    float min;
    float max;
};





struct CityWithTrajets {
    float diff;
    int trajet;
    float moyenne;
    float min;
    float max;
    
};






void storeCitiesInArray(struct Node *root, struct CityWithTrajets *citiesArray, int *index) {
    if (root != NULL && *index < 50) {
        storeCitiesInArray(root->right, citiesArray, index);

        citiesArray[*index].diff = root->ville->diff;
        citiesArray[*index].trajet = root->ville->trajet;
        citiesArray[*index].moyenne = root->ville->moyenne;
        citiesArray[*index].min= root->ville->min;
        citiesArray[*index].max= root->ville->max;
        (*index)++;

        storeCitiesInArray(root->left, citiesArray, index);
    }
}



void freeNode(struct Node *node) {
    if (node == NULL) {
        return;
    }
    
    // Libérer la mémoire récursivement pour les enfants (left et right)
    freeNode(node->left);
    freeNode(node->right);
    
    // Libérer la mémoire pour la structure Info à laquelle ville pointe
    free(node->ville);
    
    // Enfin, libérer la mémoire pour le nœud actuel
    free(node);
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

    
    
    node->ville->diff = ville.diff;
    node->ville->trajet = ville.trajet;
    node->ville->moyenne = ville.moyenne;
    node->ville->min = ville.min;
    node->ville->max = ville.max;

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

    if (ville.diff < node->ville->diff)
        node->left = insertNode(node->left, ville);
    else if (ville.diff > node->ville->diff)
        node->right = insertNode(node->right, ville);
    else {// Les éléments déjà présents ne sont pas autorisés
      
        return node;
}
    // Mise à jour de la hauteur du nœud parent
    node->height = 1 + max(getHeight(node->left), getHeight(node->right));

    // Obtenir le facteur d'équilibre de ce nœud pour vérifier l'équilibre
    int balance = getBalance(node);

    // Cas de déséquilibre : à gauche gauche
    if (balance > 1 && ville.diff < node->left->ville->diff)
        return rightRotate(node);

    // Cas de déséquilibre : à droite droite
    if (balance < -1 && ville.diff > node->right->ville->diff)
        return leftRotate(node);

    // Cas de déséquilibre : gauche droite
    if (balance > 1 && ville.diff > node->left->ville->diff) {
        node->left = leftRotate(node->left);
        return rightRotate(node);
    }

    // Cas de déséquilibre : droite gauche
    if (balance < -1 && ville.diff < node->right->ville->diff) {
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
        printf("%f ", root->ville->diff);
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







char * main(int argc, char *argv[]) {
char * c = "S/tmp/tmp.txt";
    // Initialisation de l'arbre AVL
    struct Info ville;
    struct Node *root = NULL;

   int number_of_lines = atoi(argv[1]);
    FILE *file = fopen("done.csv", "r");

    if (file == NULL) {
        perror("Erreur lors de l'ouverture du fichier");
        return 0;
    }

    int k1; // Variable pour stocker la valeur de la première colonne (K1)
    float k2, k3, k4; // Variable pour stocker la valeur de la deuxième colonne (K2)
    int index = 0;
   

//for (int i = 0; i < 299948; i++) {
  for (int i = 0; i < number_of_lines; i++) {
        fscanf(file, "%d;%f;%f;%f\n", &k1, &k2, &k3, &k4);
              ville.trajet = k1;
              ville.diff = k4-k3;
              ville.min=k3;
              ville.max=k4;
              ville.moyenne=k2;
              root = insertNode(root, ville);
                     
                   
                 
                
            
         
        } 
    

 inorderTraversal(root);
  
        






 

  
    index = 0;
    struct CityWithTrajets topTen[50];
    storeCitiesInArray(root, topTen, &index);
    freeNode(root);
    free(file);
    
    
    

  
    
    
    
    
    
 
    
    
    
    

    
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
        return c;
    }

    

    for (int i = 0; i < 50; i++) {
        fprintf(files, "%d;%d;%f;%f;%f;0\n", i, topTen[i].trajet, topTen[i].moyenne, topTen[i].max, topTen[i].min);
    }

    fclose(files);
    printf("Les données ont été écrites avec succès dans txt.csv");


  

  
  
  
  

    return c;
}
   
    
    








      
