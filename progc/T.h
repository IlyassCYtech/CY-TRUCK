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

// Strucuture des informations imporatantes d'un noeud
struct Info {
    char nom[50];
    int nombre_trajet;
    int depart;
};

// Structure des infomations final de notre fichier de sortie
struct CityWithTrajets {
    char nom[50];
    int nombre_trajet;
    int depart;
};



void storeCitiesInArray(struct Node *root, struct CityWithTrajets *citiesArray, int *index);
void trierParNom(struct CityWithTrajets *cities, int taille);
int getHeight(struct Node *N);
int max(int a, int b);
struct Node *newNode(struct Info ville);
struct Node *rightRotate(struct Node *y);
struct Node *leftRotate(struct Node *x);
int getBalance(struct Node *N);
struct Node *insertNode(struct Node *node, struct Info ville);
void inorderTraversal(struct Node *root);
void freeTree(struct Node *root);
