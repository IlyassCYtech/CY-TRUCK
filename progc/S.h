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

// Structure des informations pour réaliser la statistique d'un noeud
struct Info {
    float diff;
    int trajet;
    float moyenne;
    float min;
    float max;
};

// Tableau de structure de la liste
struct CityWithTrajets {
    float diff;
    int trajet;
    float moyenne;
    float min;
    float max;
    
};

void storeCitiesInArray(struct Node *root, struct CityWithTrajets *citiesArray, int *index);
void freeNode(struct Node *node)
int getHeight(struct Node *N)
int max(int a, int b)
struct Node *newNode(struct Info ville)
struct Node *rightRotate(struct Node *y)
struct Node *leftRotate(struct Node *x)
int getBalance(struct Node *N)
struct Node *insertNode(struct Node *node, struct Info ville)
void inorderTraversal(struct Node *root)
