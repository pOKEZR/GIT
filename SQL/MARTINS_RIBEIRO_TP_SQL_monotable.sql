SGBD – SQL - TP : SELECT MONO-TABLE
Nom : MARTINS RIBEIRO
Fichier texte encodé en UTF8

****************************************************************************
****************************************************************************
Présentation et préparation du travail
•	     Le sujet de TP est dans un fichier texte téléchargeable : MonNom_TP_SQL_monotable.txt
•	     Changez le nom du fichier : remplacez MonNom par votre nom : exemple : Liaudet_SQL_monotable.txt
•	     Dans le fichier, à la première ligne, mettez votre nom.
•	     Vous mettrez ensuite vos réponses directement dans le fichier.
•	     Il sera envoyé à l’adresse mail : liaudet.bertrand@wanadoo.fr

****************************************************************************
****************************************************************************
****************************************************************************
EXERCICE 1 : charger les tables de la base de données - EmployesTP01.sql

****************************************************************************
Présentation
On travaille sur la table suivante qui se trouve dans le fichier EmployesTP01.sql
EMP(NE, NOM, FONCTION, DATEMB, SAL, COMM, ND)
•	NE   numéro de l’employé. Clé primaire.
•	NOM  nom de l’employé.
•	FONCTION intitulé du poste occupé.
•	DATEMB	 date d’embauche.
•	SAL	 salaire de l’employé.
•	COMM	 commission (part de salaire variable).
•	ND	 n° du département dans lequel travaille l’employé.

****************************************************************************
Les requêtes :
1.  Téléchargez le script de création de la BD : EmployesTP01.sql
2.  Lancez ce script de création de la BD.
3.  Vérifiez que la table est créée (visuellement dans WAMP, ou avec la commande « desc »)
4.  Affichez tous les tuples de la table (avec WAMP ou avec un select).

****************************************************************************
****************************************************************************
****************************************************************************
EXERCICE 2 : interrogation de la BD

****************************************************************************
Travail à faire
•Répondre à toutes les questions ci-dessous.
•Le fichier répond déjà aux 2 premières questions du TP : vous devez utiliser le même formalisme pour les autres questions.
•Pour chaque question vous devez mettre :
	a  L’intitulé de la question
	b  Le select de la réponse
  	c  La CP de la table résultat de chaque question
****************************************************************************
Priorité des questions
•	 Dans un premier temps, répondez uniquement aux questions en gras qui ne commencent pas par (*),
•	 Ensuite traitez les questions avec (*)
****************************************************************************
Attention !
•	  Vous ne devez projeter que les attributs nécessaires : CP, CS, AD, AR – Tri devant ou derrière (Clé Primaire, Clé Significative, Attributs Demandés, Attributs de restriction).
•	  Vous devez précisez la clé primaire de chaque table de résultats.
****************************************************************************
Outils
•	Utilisez un éditeur efficace : notepad++, sublim text : qui fasse de la coloration syntaxique. Mettez une extension .sql à vos fichiers pour avoir la coloration syntaxique.
•	Vous pouvez travailler dans la calculette mysql ou celle de phpMyAdmin.

****************************************************************************
Les requêtes
1.  Tous les employés avec tous leurs attributs
SELECT *
FROM employes ;
-- CP : NE
2. Tous les employés
SELECT NE, nom
FROM employes ;
-- CP : NE
3. Tous les employés triés par ordre alphabétique
SELECT NE,nom
FROM employes
ORDER BY nom;
-- CP : NE
4. Tous les employés triés par n° de département croissant, ordre alphabétique des fonctions, ancienneté décroissante
SELECT NE, nd, nom, datemb
FROM employes
ORDER BY nd, nom, datemb DESC;
5. (*) Tous les employés avec leurs salaires triés par salaire décroissant
SELECT *
FROM employes
ORDER BY SAL DESC;
-- CP : NE
6. (*) Tous les employés du département 30 avec tous leurs attributs
SELECT *
FROM employes
WHERE nd = 30;
-- CP : NE
7. Tous les employés du département 30 triés par ordre alphabétique
SELECT ne, nd, nom
FROM employes
WHERE nd = 30
ORDER BY nom;
-- CP : NE
8. Tous les managers des départements 20 et 30
SELECT ne, nd, nom, fonction
FROM employes
WHERE (nd = 20 OR nd = 30) AND fonction = 'manager';
-- CP : NE
9. (*) Tous les employés qui ne sont pas managers et qui sont embauchés en 1981
SELECT ne, fonction, datemb
FROM employes
WHERE fonction != 'manager' AND year(datemb) = 1981;
-- CP : NE
10.    Toutes les fonctions de la société
SELECT DISTINCT fonction
FROM employes;
-- CP : FONCTION
11.    Tous les employés ne travaillant pas dans le département 30 et qui soit ont un salaire > à 2800, soit sont manager.
SELECT ne, nd, nom, sal, fonction
FROM employes
WHERE ND != 30 AND (sal > 2800 OR fonction = 'manager');
-- CP : NE
12.    (*) Tous les employés dont le salaire est compris entre 1000 et 2000
SELECT ne, nom, sal
FROM employes
WHERE sal >= 1000 AND sal <= 2000;
-- CP : NE
13.    Tous les numéros de département
SELECT DISTINCT nd
FROM employes;
-- CP ; ND
14.    Toutes les fonctions par département (10 : président, 10 : manager, etc.)
SELECT DISTINCT nd,fonction
FROM employes;
-- CP : ND,FONCTION
15.    Tous les employés ayant ou pouvant avoir une commission
SELECT ne,nom, comm
FROM employes
WHERE COMM >= 0;
-- CP : NE
16.    (*) Tous les salaires, commissions et totaux (salaire + commission) des vendeurs
SELECT ne, nom, fonction, comm, sal, sal+ifnull(comm, 0) AS salaire_total 
FROM employes
WHERE fonction ='Salesman';
-- CP : NE
17.    Tous les salaires, commissions et totaux (salaire + commission) des employés
SELECT ne, nom,fonction, comm,sal, sal+ifnull(comm, 0) AS salaire_total
FROM EMPLOYES;
-- CP : NE
18.    (*) Tous les employés embauchés en 1981
SELECT NE, Nom, datemb
FROM employes
WHERE year(datemb)=1981;
--CP : NE
19.    Tous les employés avec leur date d’embauche, la date du jour et leur nombre d’années d’ancienneté (on considérera que toute année commencée vaut pour une année), triés par ancienneté (on utilisera les fonctions de base de traitement de date et de traitement de chaîne).
SELECT NE,Nom, datemb, curdate(), 2017-year(datemb) as ANCIENTE
FROM employes
ORDER BY ANCIENTE desc;
--CP : NE
20.    (*) Tous les employés ayant un A en troisième lettre de leurs noms.
SELECT NE,Nom
FROM employes
WHERE nom LIKE '__A%';
--CP : NE
21.    Tous les employés ayant au moins deux A dans leurs noms.
SELECT NE,Nom
FROM employes
WHERE nom LIKE '%A%A%';
--CP : NE
22.    (*) Donner les quatre dernières lettres du nom de chaque employé.
SELECT NE,NOM, SUBSTR(NOM, LENGTH(NOM)-3,4) as LETTRES
FROM employes;
--CP : NE
23.    Quel est le plus gros salaire de l’entreprise ? FONCTION MAX interdite.
SELECT NE,NOM,sal
FROM employes
ORDER BY sal DESC
LIMIT 1;
--CP: NE
24.    (*) Quel est le plus gros salaire total des vendeurs (SALESMAN) ? FONCTION MAX interdite.
SELECT NE,NOM,FONCTION,sal
FROM employes
WHERE FONCTION='SALESMAN'
ORDER BY sal DESC;
--CP: NE
25.    (*) Quels sont les 3 employés qui ont le salaire le plus élevé ?
SELECT NE,NOM,sal,fonction
FROM employes
ORDER BY sal DESC
LIMIT 3;
--CP: NE
26.    Lister 3 employés au hasard
SELECT NE,NOM,FONCTION,ND
from employes
order by rand() limit 3;
--CP: NE
27.    (*) Afficher tous les employés en affichant : « anciens » pour ceux embauchés avant le 1 janvier 1982, rien pour ceux embauchés en 1982 et « nouveaux » pour ceux embauchés après le 1 janvier 1983. On utilisera deux méthodes : le case et le if. On tri par date d’embauche et par ordre alphabétique.
28.    Afficher les employés avec le numéro de leur tranche de salaire. Le numéro va de 1 à N. La première tranche va de 0 à 999, la deuxième de 1000 à 1999, la troisième de 2000 à 2999, etc. On considère qu’on ne sait pas à l’avance combien il y aura de tranche. On affichera les résultats par ordre de tranche croissante et par ordre alphabétique à l’intérieur d’une même tranche.

****************************************************************************
****************************************************************************
****************************************************************************
EXERCICE 3 : interrogation de la BD

****************************************************************************
Travail à faire
La même chose que pour l’exercice 2, à la suite dans le même fichier.
****************************************************************************
Les requêtes
1.  Combien d employés dans la société
SELECT COUNT(*)
FROM employes;
-- CP : NE
2.  Combien d employés embauchés en 1981
SELECT COUNT(*)
FROM employes
WHERE year(datemb) = 1981;
-- CP : NE
3.  Combien de vendeurs (« Salesman ») dans la société
SELECT COUNT(fonction)
FROM employes
WHERE fonction = 'SALESMAN';
-- CP : FONCTION
4.  Combien de départements dans la société
SELECT COUNT(DISTINCT ND)
FROM employes;
-- CP : ND
5.  Combien de fonctions différents dans la société
SELECT COUNT(DISTINCT fonction)
FROM employes;
-- CP : fonction
6.  (*) Combien y a-t-il d’employés qui n’ont pas et ne peuvent pas avoir de commission ?
7.  (*) Salaires minimum, maximum et moyen de la société.
8.  Salaires moyens des vendeurs
SELECT AVG(sal), fonction
FROM EMPLOYES;
WHERE fonction = 'Salesman';
-- CP : sal, fonction 
9.  Salaires moyens de tous les employés en tenant compte des commissions

10. (*) Pourcentage moyen de la commission des vendeurs par rapport à leur salaire
11. (*) Quel est le salaire moyen, les salaires min et max et le nombre d’employé par profession ?
12. Quels sont les salaires maximums de chaque département ?
13. (*) Quels sont les départements dans lesquels travaillent plus de deux personnes et quels sont les salaires moyens dans ces départements ?
14. Quels sont les départements dans lequel il y a plus que 4 personnes ?
15. Quels sont les fonctions pour lesquels la moyenne du salaire est supérieure à 2000 ?
16. Combien y a-t-il d’employés par département et par fonction et quelle est la moyenne de leurs salaires ?
17. (*) Quel est le nombre d’employés par année d’embauche ?
18. Combien y a-t-il d’employés par tranches de salaire de 1000 (0 à 999, 1000 à 1999, etc.).
19. (*) Combien d’employés et de départements par fonction. Vérifiez bien votre résultat :  par exemple, il y a deux ANALYST, tous les deux dans le département 20, la réponse est donc: 2 employés et 1 département pour la fonction ANALYST.
20. Liste des employés par fonction.
21. (*) Liste des employés par départements.
22. Liste des fonctions par département.
23. (*) Liste des départements par fonction.
24. Quel est le nombre d’employés par département et par fonction, trié par département décroissant.
25. La même chose, mais trié par nombre d’employé et par numéro de département croissant. On fera une version avec alias.

****************************************************************************
****************************************************************************
****************************************************************************
****************************************************************************
APPENDICE
Gestion des accents avec MySQL
Si on a des problèmes d’accents, faire une show variables like '%char%';
Sous Windows
mysql> show variables like '%char%';
+--------------------------+-------------------------------------+
| Variable_name            | Value                               |
+--------------------------+-------------------------------------+
| character_set_client     | cp850                               |
| character_set_connection | cp850                               |
| character_set_database   | latin1                              |
| character_set_filesystem | binary                              |
| character_set_results    | cp850                               |
| character_set_server     | latin1                              |
| character_set_system     | utf8                                |
| character_sets_dir       |
                 c:\wamp64\bin\mysql\mysql5.7.14\share\charsets\ |
+--------------------------+-------------------------------------------------+
8 rows in set, 1 warning (0.00 sec)
Sous Mac
mysql> show variables like '%char%';
+--------------------------+-------------------------------------+
| Variable_name            | Value                               |
+--------------------------+-------------------------------------+
| character_set_client     | utf8                                |
| character_set_connection | utf8                                |
| character_set_database   | latin1                              |
| character_set_filesystem | binary                              |
| character_set_results    | utf8                                |
| character_set_server     | latin1                              |
| character_set_system     | utf8                                |
| character_sets_dir       |
  		      /Applications/MAMP/Library/share/charsets/ |
+--------------------------+-------------------------------------+
8 rows in set (0,00 sec)
Remplacement du character_set
Il se peut qu’il faille remplacer les character_set_client cp850 par de l’utf8.
Cela se fait par exemple avec la commande :
SET character_set_client = utf8;
http://dev.mysql.com/doc/refman/5.7/en/set-character-set.html
http://dev.mysql.com/doc/refman/5.7/en/charset-connection.html

Utilisation des commandes MySQL dans la calculette
eee et notee par exemple :
http://dev.mysql.com/doc/refman/5.7/en/mysql-commands.html
