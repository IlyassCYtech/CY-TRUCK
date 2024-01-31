#include <S.h>



// stocke les informations des villes dans un tableau
void storeCitiesInArray(struct Node *root, struct CityWithTrajets *citiesArray, int *index) {
    if (root != NULL && *index < 50) {                      // Vérifie si le nœud actuel n'est pas nul et que l'indice est inférieur à 50
        storeCitiesInArray(root->right, citiesArray, index);
if (*index < 50) {                                         // Ajoute les informations de la ville au tableau si l'indice est inférieur à 50             
        citiesArray[*index].diff = root->ville->diff;
        citiesArray[*index].trajet = root->ville->trajet;
        citiesArray[*index].moyenne = root->ville->moyenne;
        citiesArray[*index].min= root->ville->min;
        citiesArray[*index].max= root->ville->max;
        (*index)++;
}
        storeCitiesInArray(root->left, citiesArray, index);
    }
}

// fonction pour libérer la mémoire d'un noeud de l'arbre
void freeNode(struct Node *node) {
    if (node == NULL) {
        return;
    }
    
    // Libere la mémoire récursivement pour les enfants (left et right)
    freeNode(node->left);
    freeNode(node->right);
    
    // Libere la mémoire pour la structure Info à laquelle ville pointe
    free(node->ville);
    
    // Enfin, libere la mémoire pour le nœud actuel
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

// Fonction pour créer un nouveau noeud avec les informations de la ville
struct Node *newNode(struct Info ville) {
    struct Node *node = (struct Node *)malloc(sizeof(struct Node));      // Alloue de la mémoire pour le nouveau noeud
    if (node == NULL) {
        // Gestion de l'échec d'allocation pour le nœud
        return NULL;
    }

    node->ville = (struct Info *)malloc(sizeof(struct Info));          // Alloue de la mémoire pour la structure Info du noeud
    if (node->ville == NULL) {
        // Gestion de l'échec d'allocation pour node->ville
      free(node); // Libération de la mémoire allouée pour le nœud
        return NULL;
    }

    // Copie les valeurs de la ville dans la nouvelle structure Info du nœud
    node->ville->diff = ville.diff;
    node->ville->trajet = ville.trajet;
    node->ville->moyenne = ville.moyenne;
    node->ville->min = ville.min;
    node->ville->max = ville.max;

    // Initialise les enfants du noeuf
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
   

 // Lecture des lignes du fichiers CSV 
 while (fscanf(file, "%d;%f;%f;%f\n", &k1, &k2, &k3, &k4) == 4) {
        
              ville.trajet = k1;
              ville.diff = k4-k3;
              ville.min=k3;
              ville.max=k4;
              ville.moyenne=k2;
              root = insertNode(root, ville);
        } 
// Fermeture du fichier après avoir terminer la lecture
 fclose(file); 
    
    index = 0;
    struct CityWithTrajets topTen[50];            // Déclaration d'un tableau de structures pour stocker les dix premières villes
    storeCitiesInArray(root, topTen, &index);     // Stockage des informations des villes dans le tableau
    freeNode(root);                               // Libération de la mémoire allouée
    
    FILE *fichier = fopen("demo/S.txt", "w"); // Ouvre le fichier en mode écriture

    if (fichier != NULL) {
        fclose(fichier); // Ferme le fichier pour le vider
        printf("Le fichier CSV a été vidé avec succès.\n");
    } else {
        printf("Erreur lors de l'ouverture du fichier.\n");
    }

 FILE *files = fopen("demo/S.txt", "w");                        // Ouvre le fichier en mode écriture

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
   
