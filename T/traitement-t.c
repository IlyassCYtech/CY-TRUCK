#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#define VILLE_STR_LONG 100

//Structur T_info pour les donnees csv
typedef struct T_info{
	char* nomVille;
	int nombreTrajet;
	int nombreDepart;
}T_info;

//Structure general des AVL
typedef struct T_AVL{
	struct T_info ville;
	struct T_AVL* fg;
	struct T_AVL* fd;
	int equilibre;
}T_AVL;
//_________________________________________________________
//		    FONCTIONS MIN MAX
//_________________________________________________________
//Fonctions min 2 parametres
int min2(int a, int b){
	if(a<b){
		return a;
	}
	else{
		return b;
	}
}
//Fonctions min 3 parametres
int min3(int a, int b, int c){
	return min2(a,min2(b,c));
}
//Fonctions max 2 parametres
int max2(int a, int b){
	if(a>b){
		return a;
	}
	else{
		return b;
	}
}
//Fonctions max 3 parametres
int max3(int a, int b, int c){
	return max2(a,max2(b,c));
}
//_________________________________________________________
//    		   FONCTIONS EXISTE FILS
//_________________________________________________________
//Fonction existe fils gauche
int existeFilsGauche(T_AVL* a){
	if(a==NULL){
		exit(1);
		printf("Erreur, pas d'arbre\n");
	}
	else if(a->fg == NULL){
		return 0;
	}
	else{
		return 1;
	}
}

//Fonction existe fils droite
int existeFilsDroit(T_AVL* a){
	if(a==NULL){
		exit(1);
		printf("Erreur, pas d'arbre\n");
	}
	else if(a->fd == NULL){
		return 0;
	}
	else{
		return 1;
	}
}
//_________________________________________________________
//		  FONCTIONS SUPPRIME AVL
//_________________________________________________________
//Fonction suppMinAVL h = diff equilibre, pe = 
T_AVL* suppMinAVL(T_AVL* a ,int* h ,T_info* pe){ 
	T_AVL* tmp;
	if(a->fg == NULL){
		*pe = a->ville;
		*h=-1;
		tmp=a;
		a=a->fd;
		free(tmp);
		return a;
	}
	else{
		a->fg = suppMinAVL(a->fg, h, pe);
	}
	if(*h!=0){
		a->equilibre += *h;
		if(a->equilibre == 0){
			*h=-1;
		}
		else{
			*h=0;
		}
	}
	return a;
}

//Fonction Suppression AVL
T_AVL* suppressionAVL(T_AVL* a, T_info e, int* h){
	T_AVL* tmp;
	if(a == NULL){
		*h = 1;
		return a;
	}
	else if(e.nombreTrajet > a->ville.nombreTrajet){
		a->fd = suppressionAVL(a->fd, e, h);
	}
	else if(e.nombreTrajet < a->ville.nombreTrajet){
		a->fg = suppressionAVL(a->fg, e, h);
		*h = -*h;
	}
	else if(existeFilsDroit(a)==1){					  //<- fonctions existeFils
		a->fd = suppMinAVL( a->fd, h, &(a->ville)); //<- fonction suppMinAVL
	}
	else{
		tmp = a;
		a = a->fg;
		free(tmp);
		*h=-1;
	}
	if(a==NULL){
		*h = 0;
	}
	if(*h != 0){
		a->equilibre += *h;
		if(a->equilibre == 0){
			*h=0;
		}
		else{
			*h=1;
		}
	}
	return a;
}
//_________________________________________________________
//		    FONCTIONS ROTATIONS
//_________________________________________________________
//Fonction rotation gauche
T_AVL* rotationGauche(T_AVL* a){
	T_AVL* pivot;		//Initialisation des valeurs
	int eq_a; 
	int eq_p;
	
	pivot = a->fd; 		//Defini ou on place le pivot 
	a->fd = pivot->fg;	//...
	pivot->fg = a;		//... rotation gauche
	
	eq_a = a->equilibre;	//Mise a jour de l'equilibre
	eq_p = pivot->equilibre;
	a->equilibre = eq_a - max2(eq_p,0) -1;
	pivot->equilibre = min3(eq_a-2, eq_a+eq_p-2, eq_p-1);
	a = pivot;
	return a;
}


//Fonction rotation droite
T_AVL* rotationDroite(T_AVL* a){
	T_AVL* pivot;		//Initialisation des valeurs
	int eq_a;
	int eq_p;
	
	pivot = a->fg;		//Defini ou on place le pivot
	a->fg = pivot->fd;	//...
	pivot->fd = a;		//... rotation droite
	
	eq_a = a->equilibre;	//Mise a jour de l'equilibre
	eq_p = pivot->equilibre;
	a->equilibre = eq_a - min2(eq_p,0) +1;
	pivot->equilibre = max3(eq_a+2, eq_a+eq_p+2, eq_p+1);
	a = pivot;
	return a;
}

//Fonction double rotation gauche
T_AVL* doubleRotationGauche(T_AVL* a){
	a->fd = rotationDroite(a->fd);
	return rotationGauche(a);
}

//Fonction double rotation droite
T_AVL* doubleRotationDroite(T_AVL* a){
	a->fg = rotationGauche(a->fg);
	return rotationDroite(a);
}
//_________________________________________________________
//		  FONTION EQUILIBRAGE AVL
//_________________________________________________________
T_AVL* equilibrerAVL(T_AVL* a){
	if(a->equilibre >= 2){
		if(a->fd->equilibre >= 0){
			return rotationGauche(a);
		}
		else{
			return doubleRotationGauche(a);
		}
	}
	else if(a->equilibre <= -2){
		if(a->fg->equilibre <= 0){
			return rotationDroite(a);
		}
		else{
			return doubleRotationDroite(a);
		}
	}
	return a;
}
//_________________________________________________________
//		   FONCTION CREER ARBRE
//_________________________________________________________

T_AVL* creerArbre(T_info r){
	// Allouer le noeud
	T_AVL* noeud = malloc(sizeof(T_AVL));
		
	// Allouer la memoire contenant le nom de la ville
	int tailleChaine = strlen(r.nomVille);	  
	noeud->ville.nomVille = malloc(strlen(r.nomVille)+1);
	
	// Initialiser le noeud de l'arbre
	strcpy(noeud->ville.nomVille, r.nomVille);
	noeud->ville.nombreTrajet = r.nombreTrajet;
	noeud->ville.nombreDepart = r.nombreDepart;
	
	// Transforme le noeud en feuille
	noeud->fg = NULL;
	noeud->fd = NULL;
	noeud->equilibre = 0;
	return noeud;
}

//_________________________________________________________
//		  FONCTION INSERTION AVL
//_________________________________________________________


int cpt=0;

T_AVL* insertionAVL(T_AVL* a, T_info e, int* h){
	if(a==NULL){
		*h=1;
		return creerArbre(e);
	}
	else if(e.nombreTrajet < a->ville.nombreTrajet){
//		cpt++;
//		if (cpt > 70)
//			exit(0);
		a->fg = insertionAVL(a->fg,e, h);
		*h= -*h;
	}
	else if(e.nombreTrajet > a->ville.nombreTrajet){
		a->fd = insertionAVL(a->fd,e,h);
	}
	else{
		//printf("## MDR, e.nombreTrajet == a->ville.nombreTrajet\n");
		*h=0;
		return a;
	}
	if(*h != 0){
		a->equilibre += *h;
		a = equilibrerAVL(a);
		if(a->equilibre == 0){
			*h=0;
		}
		else{
			*h=1;
		}
	}
	return a;
}

//_________________________________________________________
//			PARCOURS AVL
//_________________________________________________________
//Parcours par ordre croissant
void parcoursInfixe(T_AVL* a){
	if(a!=NULL){
		parcoursInfixe(a->fg);
		printf("%s=%d (%d)\n", a->ville.nomVille,a->ville.nombreTrajet,a->equilibre);
		parcoursInfixe(a->fd);	
	}
}

//Parcours par ordre décroissant
void parcoursDecroissant(T_AVL* a, int* n){

	if(a!=NULL && *n>0 ){
		parcoursDecroissant(a->fd, n);
		(*n)--;
		if (*n>=0)
			printf("%s	=%d,	n=%d\n", a->ville.nomVille, a->ville.nombreTrajet, *n);
		parcoursDecroissant(a->fg, n);	
	}
}

void parcoursDecroissantCSV(FILE *fichier_sortie, T_AVL* a, int* n){

	if(a!=NULL && *n>0 ){
		parcoursDecroissantCSV(fichier_sortie, a->fd, n);
		(*n)--;
		if (*n>=0)
			fprintf(fichier_sortie,"%s;%d;%d\n",a->ville.nomVille,a->ville.nombreTrajet,a->ville.nombreDepart);
		parcoursDecroissantCSV(fichier_sortie, a->fg, n);	
	}
}


//_________________________________________________________
//		 FONCTION PARSE LIGNE
//_________________________________________________________

// Retourne le nombre de champs de info qui ont ete lus
int parseLigne(T_info *info, char *ligne)
{
	char *PtVirgule;
	char* PtVirgule2;
	//char nomVille[VILLE_STR_LONG];
	char arriveeVille[VILLE_STR_LONG];
	char departVille[VILLE_STR_LONG];
	
	int valide=0;
	
	//Premier cas on veut le nom de ville
	PtVirgule = strchr(ligne,';');
	if(PtVirgule == NULL){
		printf("Erreur pas de point virgule\n");
		return -1;
	}		
	memset(info->nomVille,0,VILLE_STR_LONG);
	strncpy(info->nomVille, ligne, PtVirgule - ligne);

	
	
	//Deuxieme cas on veut recup le nombreArrivee en int entre deux ;
	
	PtVirgule++;
	PtVirgule2 = strchr(PtVirgule,';');
	if(PtVirgule2 == NULL){
		printf("Erreur pas de point virgule2\n");
		return -2;
	}
	else if(PtVirgule == PtVirgule2){
		printf("Erreur, ; consecutif\n");
		return -3;
	}
	memset(arriveeVille,0,sizeof(arriveeVille));
	strncpy(arriveeVille, PtVirgule, PtVirgule2 - PtVirgule);
	
	info->nombreTrajet  = atoi(arriveeVille); //transforme en int 
	
	//Troisieme cas on veut recup le nombreDepart en int apres un ;
	PtVirgule2++;
	memset(departVille,0,sizeof(departVille));
	strcpy(departVille, PtVirgule2);
	
	info->nombreDepart = atoi(departVille); //transforme en int 
	info->nombreTrajet  += info->nombreDepart;
	
	return valide;
}



//_________________________________________________________
//			    MAIN
//_________________________________________________________
int main(){

	//printf("\nCeci est la base des AVL\n\n\n");
	//Fonction qui sert a utiliser les donnees d'un fichier
	
	// Ouvrir le fichier en mode lecture
	FILE *fichier = fopen("result.csv", "r");
	FILE *fichier_sortie;

	
	T_AVL* racine = NULL;
		//racine = creerArbre(infoVille); //pas utile car insertionAVL fait deja le taf
	char chaineLue[VILLE_STR_LONG];
	char ville[VILLE_STR_LONG];
	int nombreArrivee, nombreDebut,res=0;
	int nombrePassage;
	char * resLecture;
	// Creation d'un noeud provisoire
	T_info infoVille;
	infoVille.nomVille = ville;
	int h;
	

	//printf("Entrer Nom ch ch\n");
	
	int cpt = 0;
	do {
		// Lire une ligne du fichier CSV
		//res = fscanf(fichier, "%s;%d;%d\n",ville, &nombreArrivee, &nombreDebut);
		resLecture = fgets(chaineLue, VILLE_STR_LONG, fichier);
		//printf("\nChaine=%s (%d)\n",chaineLue, (resLecture==NULL) ? 0 : 1);
		
		// Construire un noeud 'infoVille'
		res = parseLigne(&infoVille, chaineLue);
		//printf("infoVille->nomVille = %s\ninfoVille->nombreTrajet = %d\ninfoVille->nombreDepart = %d\n", infoVille.nomVille, infoVille.nombreTrajet, infoVille.nombreDepart);
		cpt++;
		if (cpt > 29280){
			break;
		}
		
		if (res<0){

			printf("caca (res=%d)\n", res);
		}
		else{
			//printf("\n\n==========================================================\n");
			
			//parcoursInfixe(racine);
			//printf("\nNom=%s ch=%d ch=%d res = %d\n",infoVille.nomVille, infoVille.nombreTrajet, infoVille.nombreDepart, res);
			
			//printf("insertionAVL()\n");
			racine = insertionAVL(racine, infoVille, &h);
			//parcoursInfixe(racine);
			//printf("==========================================================\n");
			
		}
		
	}while (res!=EOF);
    
	//Recupere les 10 plus grands
	int cpt2 = 10;
	//printf("\n\nDEBUT PARCOURS DECROISSANT\n\n");
	//parcoursDecroissant(racine, &cpt2); 
	
	//FILE* donnees.csv;  // Déclaration d'un pointeur de fichier

	// Ouverture du fichier en mode écriture ("w")
	//donnees.csv = fopen("exemple.txt", "w");

	// Vérification si l'ouverture a réussi
	//if (donnees.csv == NULL) {
	//	fprintf(stderr, "Erreur lors de l'ouverture du fichier.\n");
	//	return 1;  // Quitte le programme avec code d'erreur
	//}

	// Utilisation de fprintf pour écrire dans le fichier
	fichier_sortie = fopen("result_sortie.csv", "w");
	parcoursDecroissantCSV(fichier_sortie, racine, &cpt2); 
	fclose(fichier_sortie);

	// Fermeture du fichier
	//fclose(donnees.csv);

	//printf("Le texte a été écrit dans donnees.csv avec succès.\n");

	return(0);
}



