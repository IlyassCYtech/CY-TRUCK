#include "T.h"

// Copies les informations des villes dans un tableau
void storeCitiesInArray(struct Node *root, struct CityWithTrajets *citiesArray, int *index) {
    if (root != NULL && *index < 10) {
        storeCitiesInArray(root->right, citiesArray, index);

        if (*index < 10) {  // Ajoutez cette condition
            strcpy(citiesArray[*index].nom, root->ville->nom);
            citiesArray[*index].nombre_trajet = root->ville->nombre_trajet;
            citiesArray[*index].depart = root->ville->depart;
            (*index)++;
        }

        storeCitiesInArray(root->left, citiesArray, index);
    }
}

// Trie le tableau de strucure CityWithTrajets en fonction des noms de villes par odre alphabetique
void trierParNom(struct CityWithTrajets *cities, int taille) {
    for (int i = 0; i < taille - 1; i++) {
        for (int j = i + 1; j < taille; j++) {
            if (strcmp(cities[i].nom, cities[j].nom) > 0) {
                // Échange des éléments si nécessaire
                struct CityWithTrajets temp = cities[i];
                cities[i] = cities[j];
                cities[j] = temp;
            }
        }
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

// Fonction creation d'un noeud
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
    strcpy(node->ville->nom, ville.nom);
    node->ville->nombre_trajet = ville.nombre_trajet;
    node->ville->depart = ville.depart;

    node->left = NULL;
    node->right = NULL;
    node->height = 1;
    
    return node;
}

//_________________________________________________________________
//                        FONCTIONS AVL
//_________________________________________________________________
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
    if (N == NULL){
        return 0;
    }
    return getHeight(N->left) - getHeight(N->right);
}

// Fonction pour insérer un nœud dans un AVL
struct Node *insertNode(struct Node *node, struct Info ville) {
    // Étape d'insertion standard pour un BST
    if (node == NULL){
        return newNode(ville);
    }
    if (ville.nombre_trajet < node->ville->nombre_trajet){
        node->left = insertNode(node->left, ville);
    }
    else if (ville.nombre_trajet > node->ville->nombre_trajet){
        node->right = insertNode(node->right, ville);
    }
    else {// Les éléments déjà présents ne sont pas autorisés
        return node;
    }
    // Mise à jour de la hauteur du nœud parent
    node->height = 1 + max(getHeight(node->left), getHeight(node->right));

    // Obtenir le facteur d'équilibre de ce nœud pour vérifier l'équilibre
    int balance = getBalance(node);

    // Cas de déséquilibre : à gauche gauche
    if (balance > 1 && ville.nombre_trajet < node->left->ville->nombre_trajet){
        return rightRotate(node);
    }

    // Cas de déséquilibre : à droite droite
    if (balance < -1 && ville.nombre_trajet > node->right->ville->nombre_trajet){
        return leftRotate(node);
    }

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

// Libere l'espace aloue pour l'avl
void freeTree(struct Node *root) {
    if (root != NULL) {
        freeTree(root->left);
        freeTree(root->right);
        free(root->ville);
        free(root);
    }
}

