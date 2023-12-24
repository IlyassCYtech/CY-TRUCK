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
    char nom[50];
    int nombre_trajet;
    int depart;
};




struct CityWithTrajets {
    char nom[50];
    int nombre_trajet;
    int depart;
};










void storeCitiesInArray(struct Node *root, struct CityWithTrajets *citiesArray, int *index) {
    if (root != NULL && *index < 10) {
        storeCitiesInArray(root->right, citiesArray, index);

        strcpy(citiesArray[*index].nom, root->ville->nom);
        citiesArray[*index].nombre_trajet = root->ville->nombre_trajet;
        citiesArray[*index].depart= root->ville->depart;
        (*index)++;

        storeCitiesInArray(root->left, citiesArray, index);
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

    
    if (node->ville->nom == NULL) {
        // Gestion de l'échec d'allocation pour node->ville->driver[0]
        free(node->ville); // Libération de la mémoire allouée pour node->ville
        free(node); // Libération de la mémoire allouée pour le nœud
        return NULL;
    }
    
    strcpy(node->ville->nom, ville.nom);
    node->ville->nombre_trajet = ville.nombre_trajet;
    node->ville->depart = ville.depart;

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

    if (ville.nombre_trajet < node->ville->nombre_trajet)
        node->left = insertNode(node->left, ville);
    else if (ville.nombre_trajet > node->ville->nombre_trajet)
        node->right = insertNode(node->right, ville);
    else {// Les éléments déjà présents ne sont pas autorisés
      
        return node;
}
    // Mise à jour de la hauteur du nœud parent
    node->height = 1 + max(getHeight(node->left), getHeight(node->right));

    // Obtenir le facteur d'équilibre de ce nœud pour vérifier l'équilibre
    int balance = getBalance(node);

    // Cas de déséquilibre : à gauche gauche
    if (balance > 1 && ville.nombre_trajet < node->left->ville->nombre_trajet)
        return rightRotate(node);

    // Cas de déséquilibre : à droite droite
    if (balance < -1 && ville.nombre_trajet > node->right->ville->nombre_trajet)
        return leftRotate(node);

    // Cas de déséquilibre : gauche droite
    if (balance > 1 && ville.nombre_trajet > node->left->ville->nombre_trajet) {
        node->left = leftRotate(node->left);
        return rightRotate(node);
    }

    // Cas de déséquilibre : droite gauche
    if (balance < -1 && ville.nombre_trajet < node->right->ville->nombre_trajet) {
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
        printf("%s ", root->ville->nom);
        printf("%d ", root->ville->nombre_trajet);
        printf("%d \n", root->ville->depart);
        /*for(int i =0; i<1000;i++){
        printf("%s \n", root->ville->driver[i]);
        }*/
        inorderTraversal(root->right);
    }
}

void freeTree(struct Node *root) {
    if (root != NULL) {
        freeTree(root->left);
        freeTree(root->right);
        free(root->ville);
        free(root);
    }
}




//int main(){
char * main(int argc, char *argv[]) {
char * c = "T/tmp/tmp.txt";
    // Initialisation de l'arbre AVL
    struct Info ville;
    struct Node *root = NULL;

   int number_of_lines = atoi(argv[1]);
    FILE *file = fopen("T/tmp/fusionne.csv", "r");

    if (file == NULL) {
        perror("Erreur lors de l'ouverture du fichier");
        return c;
    }

    char k1[50]; // Variable pour stocker la valeur de la première colonne (K1)
    int k2, k3; // Variable pour stocker la valeur de la deuxième colonne (K2)
    int index = 0;
    int count =0;
   
//for (int i = 0; i < 27981; i++) {
   for (int i = 0; i < number_of_lines; i++) {
      fscanf(file, "%[^;];%d;%d\n", k1, &k2, &k3); 
        
                k2=k2+k3;
                strcpy(ville.nom, k1);
                ville.nombre_trajet = k2;
                ville.depart = k3;
               printf("%s ",ville.nom);
               printf("%s \n",ville.nom);
                root = insertNode(root, ville);
                     
                 
              
                 
    // printf("%d\n", i); 
    
            }
        
      
               




inorderTraversal(root);






 

      
    index = 0;
    struct CityWithTrajets topTen[10];
     
    storeCitiesInArray(root, topTen, &index);
    freeTree(root); 
    
 
    
    for (int i = 0; i < 10 && i < index; i++) {
        printf("Ville : %s | Nombre de trajets : %d, Nombre de chauffeurs %d\n", topTen[i].nom, topTen[i].nombre_trajet, topTen[i].depart);
    }



    FILE *fichier = fopen("T/tmp/tmp.txt", "w"); // Ouvre le fichier en mode écriture

    if (fichier != NULL) {
        fclose(fichier); // Ferme le fichier pour le vider
        printf("Le fichier CSV a été vidé avec succès.\n");
    } else {
        printf("Erreur lors de l'ouverture du fichier.\n");
    }
    
  

 

 
 
 
 
 
 
 
 
 
 
 
 
 
 FILE *files = fopen("T/tmp/tmp.txt", "w");

    if (files == NULL) {
        printf("Erreur lors de l'ouverture du fichier.\n");
        return 0;
    }

    

    for (int i = 0; i < 10; i++) {
        fprintf(files, "%s;%d;%d\n", topTen[i].nom, topTen[i].nombre_trajet, topTen[i].depart);
    }

    fclose(files);
    printf("Les données ont été écrites avec succès dans tmp.txt");


  
  
  
  
  

    return c;
}
   
    
    








      
