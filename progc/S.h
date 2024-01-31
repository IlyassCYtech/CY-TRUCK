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
