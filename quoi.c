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
    char* driver[1000];
    int nombre_trajet;
    int nombre_chauffeur;
};




struct CityWithTrajets {
    char nom[50];
    int nombre_trajet;
    int nombre_chauffeur;
};

void storeCitiesInArray(struct Node *root, struct CityWithTrajets *citiesArray, int *index) {
    if (root != NULL && *index < 1000) {
        storeCitiesInArray(root->left, citiesArray, index);

        strcpy(citiesArray[*index].nom, root->ville->nom);
        citiesArray[*index].nombre_trajet = root->ville->nombre_trajet;
        citiesArray[*index].nombre_chauffeur= root->ville->nombre_chauffeur;
        (*index)++;

        storeCitiesInArray(root->right, citiesArray, index);
    }
}

// Fonction pour trier le tableau des villes selon le nombre de trajets
void sortCitiesArray(struct CityWithTrajets *citiesArray, int size) {
    for (int i = 0; i < size - 1; i++) {
        for (int j = 0; j < size - i - 1; j++) {
            if (citiesArray[j].nombre_trajet < citiesArray[j + 1].nombre_trajet) {
                struct CityWithTrajets temp = citiesArray[j];
                citiesArray[j] = citiesArray[j + 1];
                citiesArray[j + 1] = temp;
            }
        }
    }
}













int rechercheAVL(struct Node *node, char* k1, char* k2) {
    if (node == NULL) {
        return 0; // Si l'arbre est vide, la valeur n'est pas présente
    }

    if (node->ville != NULL && strcmp(k1, node->ville->nom) == 0) {
        node->ville->nombre_trajet++;
        int value = 0;
        int index = 0;

        // Vérification des limites du tableau avant d'accéder à ses éléments
        while (index < 1000 && node->ville->driver[index] != NULL) {
            if (strcmp(node->ville->driver[index], k2) == 0) {
                value = 1;
                break;
            }
            index++;
        }

        if (value == 0) {
            if (index < 1000) { // Vérification de la limite avant d'insérer
                node->ville->driver[index] = malloc(strlen(k2) + 1);
                if (node->ville->driver[index] != NULL) {
                    strcpy(node->ville->driver[index], k2);
                    node->ville->nombre_chauffeur++;
                } else {
                    // Gestion de l'échec d'allocation mémoire pour k2
                    return 0;
                }
            }
        }
        return 1; // La valeur est trouvée dans ce nœud
    } else if (strcmp(k1, node->ville->nom) < 0) {
        return rechercheAVL(node->left, k1, k2); // Recherche dans le sous-arbre gauche
    } else {
        return rechercheAVL(node->right, k1, k2); // Recherche dans le sous-arbre droit
    }
}



// Après avoir utilisé l'arbre, libérez la mémoire
void freeTree(struct Node *root) {
    if (root != NULL) {
        freeTree(root->left);
        freeTree(root->right);
        for (int i = 0; i < 1000; i++) {
            if (root->ville->driver[i] != NULL) {
                free(root->ville->driver[i]); // Libérer la mémoire pour chaque élément de driver
            }
        }
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

    node->ville->driver[0] = malloc(strlen(ville.driver[0]) + 1);
    if (node->ville->driver[0] == NULL) {
        // Gestion de l'échec d'allocation pour node->ville->driver[0]
        free(node->ville); // Libération de la mémoire allouée pour node->ville
        free(node); // Libération de la mémoire allouée pour le nœud
        return NULL;
    }

    strcpy(node->ville->driver[0], ville.driver[0]);
    strcpy(node->ville->nom, ville.nom);
    node->ville->nombre_trajet = 1;
    node->ville->nombre_chauffeur = 1;

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

    if (strcmp(ville.nom, node->ville->nom) < 0)
        node->left = insertNode(node->left, ville);
    else if (strcmp(ville.nom, node->ville->nom) > 0)
        node->right = insertNode(node->right, ville);
    else {// Les éléments déjà présents ne sont pas autorisés
      
        return node;
}
    // Mise à jour de la hauteur du nœud parent
    node->height = 1 + max(getHeight(node->left), getHeight(node->right));

    // Obtenir le facteur d'équilibre de ce nœud pour vérifier l'équilibre
    int balance = getBalance(node);

    // Cas de déséquilibre : à gauche gauche
    if (balance > 1 && strcmp(ville.nom, node->left->ville->nom) < 0)
        return rightRotate(node);

    // Cas de déséquilibre : à droite droite
    if (balance < -1 && strcmp(ville.nom, node->right->ville->nom) > 0)
        return leftRotate(node);

    // Cas de déséquilibre : gauche droite
    if (balance > 1 && strcmp(ville.nom, node->left->ville->nom) > 0) {
        node->left = leftRotate(node->left);
        return rightRotate(node);
    }

    // Cas de déséquilibre : droite gauche
    if (balance < -1 && strcmp(ville.nom, node->right->ville->nom) < 0) {
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
        printf("%d ", root->ville->nombre_chauffeur);
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

    int number_of_lines = 1927918; // Nombre de lignes dans le fichier
    FILE *file = fopen("feur.csv", "r");

    if (file == NULL) {
        perror("Erreur lors de l'ouverture du fichier");
        return 1;
    }

    char k1[50]; // Variable pour stocker la valeur de la première colonne (K1)
    char k2[50]; // Variable pour stocker la valeur de la deuxième colonne (K2)
    int index = 0;

    for (int i = 0; i < number_of_lines; i++) {
        if (fscanf(file, "%49[^;];%49[^\n]", k1, k2) == 2) {
            if (rechercheAVL(root, k1, k2) == 0) {
                strcpy(ville.nom, k1);
                ville.driver[0] = malloc(strlen(k2) + 1);

                if (ville.driver[0] != NULL) {
                    strcpy(ville.driver[0], k2);
                    root = insertNode(root, ville);
                    free(ville.driver[0]); // Libération de la mémoire allouée
                }
            }
        } else {
            printf("Erreur lors de la lecture de la ligne %d\n", i + 1);
        }
    }

    // Allouer de la mémoire pour le tableau des villes
    //struct CityInfo *cities = malloc(index * sizeof(struct CityInfo));

     struct CityWithTrajets cities[1000]; // Adapte la taille selon la taille de ton arbre
    index = 0;

    storeCitiesInArray(root, cities, &index);
    sortCitiesArray(cities, index);

    // Afficher les 10 villes avec le plus grand nombre de trajets
    printf("Top 10 des villes avec le plus de trajets :\n");
    for (int i = 0; i < 10 && i < index; i++) {
        printf("Ville : %s | Nombre de trajets : %d\n", cities[i].nom, cities[i].nombre_trajet);
    }

    return 0;
}








  
