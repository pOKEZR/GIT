SGBD – SQL - TP : CP Concatenee – base Biblio
Nom : MARTINS RIBEIRO		

Encodage du fichier texte en UTF8 - BOM

****************************************************************************
****************************************************************************
Présentation et préparation du travail
•	     Le sujet de TP est dans un fichier texte téléchargeable : MonNom_TP_SQL_multitables.txt
•	     Changez le nom du fichier : remplacez MonNom par votre nom : exemple : Liaudet_TP_SQL_multitables.txt
•	     Dans le fichier, à la première ligne, mettez votre nom.
•	     Vous mettrez ensuite vos réponses directement dans le fichier.
•	     Il sera envoyé à l’adresse mail : liaudet.bertrand@wanadoo.fr

****************************************************************************
****************************************************************************
****************************************************************************
EXERCICE 1 : charger les tables de la base de données - EmployesTP02.sql

****************************************************************************
Présentation
On travaille sur la table suivante qui se trouve dans le fichier EmployesTP02.sql

OEUVRES(NO, TITRE, AUTEUR)
•	    NO		numéro de l’œuvre. Clé primaire.
•	    LIVRE	titre de l’oeuvre
•	    AUTEUR	auteur de l’oeuvre

ADHERENTS(NA, NOM, VILLE)
•	      NA	numéro d’adhérent. Clé primaire.
•	      NOM	nom de l’adhérent.
•	      PRENOM	prénom de l’adhérent.
•	      ADR	adresse de l’adhérent.
•	      TEL		téléphone de l’adhérent.

LIVRES (NL, EDITEUR, #NO)
•      NL   	     numéro du livre. Clé primaire.
•      EDITEUR	     éditeur du livre
•      NO	     	     numéro de l’oeuvre. Clé étrangère.

EMPRUNTER(#NL, DATEMP, DATRETMAX, DATRET, #NA)
•	       #NL     		  numéro de livre. Clé primaire. Clé étrangère.
•	       DATEMP		  date d’emprunt du livre. Clé primaire.
•	       DATRETMAX	  date limite de retour autorisée.
•	       DATRET		  date de retour effectif du livre.
•	       #NA		       numéro d’adhérent. Clé étrangère.

****************************************************************************
Les requêtes
1.  Téléchargez le script de création de la BD : EmployesTP02.sql
2.  Lancez ce script de création de la BD.
3.  Vérifiez que les 4 tables sont créées (visuellement dans WAMP, ou avec la commande show tables et desc nomTable)

****************************************************************************
****************************************************************************
****************************************************************************
EXERCICE 2 : SELECT

****************************************************************************
Travail à faire
Répondre à toutes les questions ci-dessous en SQL1 et/ou en SQL2
•	 Le fichier répond déjà aux 2 premières questions du TP : vous devez utiliser le même formalisme pour les autres questions.
•	 Pour chaque question vous devez mettre :
¬	 L’intitulé de la question
¬	 Le select de la réponse
¬	 La CP de la table résultat de chaque question
¬	 Sur papier : faire le graphe de la question.
Ordre de projection des attributs
¬     Requête sans fonction de groupe
Attributs de tri, Cle Primaire, Clé Significative, Attributs demandés, Attributs de restriction
¬	  Requête avec fonctions de groupe
Attributs de tri, attributs du group by, fonctions de groupe demandées, fonctions de groupe de restriction (du having).

****************************************************************************
Les requêtes

1.  Afficher le contenu de toutes les tables.
Bien regarder le contenu pour bien comprendre le fonctionnement des tables.
2.   Faire le produit cartésien de la table Emprunter avec la table des Livres et la table des Adhérents.
•    Combien y a-t-il d’attributs dans la table résultat. Afficher les résultats en mode « fiche » (\G).
•    Combien y a-t-il de tuples dans la table résultat ?
•    Quelle est la Clé primaire ?
•    Refaire la question en projetant uniquement les clés primaires et significatives.
•    Quel tri faudrait-il faire pour clarifier l’interprétation des résultats ? Afficher les 200 premiers.
3.   Faire la jointure naturelle de la table Emprunter avec la table des Livres et la table des Adhérents.
•    Combien y a-t-il d’attributs dans la table résultat. Afficher les résultats en mode « fiche » (\G).
•    Combien y a-t-il de tuples dans la table résultat ?
•    Quelle est la Clé primaire ?
•    Refaire la question en projetant uniquement les clés primaires et significatives.
•    Quel tri faudrait-il faire pour clarifier l’interprétation des résultats ?
4.   Faire la jointure naturelle de la table Emprunter avec la table des Livres, la table des Oeuvres et la table des Adhérents.
•    Combien y a-t-il d’attributs dans la table résultat.
•    Combien y a-t-il de tuples dans la table résultat ?
•    Quelle est la Clé primaire ?
•    Refaire la question en projetant uniquement les clés primaires et significatives.
•    Quel tri faudrait-il faire pour clarifier l’interprétation des résultats ?
5.   Quels sont les livres actuellement empruntés ?
6.   Quels sont les livres empruntés par Jeannette Lecoeur ? Vérifier dans la réponse qu’il n’y a pas d’homonymes.
7.   Quels sont tous les livres empruntés en août 2008.
8.   Tous les adhérents qui ont emprunté un livre de Fedor Dostoievski.
9.   Quels sont le ou les auteurs du titre « Voyage au bout de la nuit »
10.  Quels sont les ou les éditeurs du titre « Narcisse et Goldmund »
11.  Quels sont les adhérents actuellement en retard ?
12.  Quels sont les livres actuellement en retard ?
13.  Quels sont les adhérents en retard avec le nombre de livre en retard et la moyenne du nombre de jour de retard.
14.  Nombre de livres empruntées par auteur.
15.  Nombre de livres empruntés par éditeur.
16.  Durée moyenne des emprunts rendus. On commencera par afficher les durées des emprunts rendus.
17.  Durée moyenne des retards pour l’ensemble des emprunts.
La fonction « if » permet de tester une valeur et de renvoyer ce qu’on souhaite selon la vérité ou la fausseté de la valeur testée.
if(a<0, 0, a) : permet de ramener les valeurs négatives de a à 0.
18.	Durée moyenne des retards parmi les seuls retardataires.

*************************************************************************
*************************************************************************
*************************************************************************
Exercice 3 : Jointures externes

*************************************************************************
1.	Quels sont les adhérents qui n’ont jamais emprunté de livres ? (biblio)
2.	Quels sont les livres qui n’ont jamais été empruntés ? (biblio)
3.	Combien d’exemplaires du titre : « Narcisse et Goldmund » sont disponibles ?  (biblio)

*************************************************************************
*************************************************************************
*************************************************************************
Exercice 4 : DML : Mise à jour de la BD

*************************************************************************
1.	La bibliothèque vient d’acquérir un nouvel exemplaire de : « Au cœur des ténèbres » de Joseph Conrad, chez Gallimard. Faire la mise à jour de la BD.
2.	Ecrire les commandes qui permettent de retirer tout ce que vous avez ajouté.
3.	La bibliothèque vient d’acquérir un nouveau livre de Hermann Hesse intitulé « Siddhartha » chez Folio. Faire la mise à jour de la BD.
4.	Ecrire les commandes qui permettent de retirer tout ce que vous avez ajouté (supprimer une œuvre et les livres correspondants).
5.	Un nouvel adhérent vient s’inscrire : Olivier DUPOND, 76, quai de la Loire, 75019 Paris, téléphone : 0102030405
6.	Martine CROZIER vient emprunter « Au cœur des ténèbres » que vous venez d’ajouter et Le rouge et le noir chez Hachette, livre n°23. Faire les mises à jour de la BD.
7.	M. Cyril FREDERIC ramène les livres qu’il a empruntés. Faire la mise à jour de la BD.
8.	M. Cyril FREDERIC essaye d’emprunter le livre n°23. Que constatez vous ?
9.	M. Cyril FREDERIC essaye d’emprunter le livre n°29. Que constatez vous ?
