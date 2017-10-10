SGBD – SQL - TP : SELECT MULTI-TABLES
Nom : MARTINS RIBEIRO

Encodage du fichier texte en UTF8 - BOM
*********************************************************************************
EXERCICE 2 : Jointures naturelles - Chapitres 1 et 2 du cours
*********************************************************************************
Travail à faire
•	Répondre à toutes les questions ci-dessous en SQL1 et en SQL2.
•	Le fichier répond déjà aux 2 premières questions du TP : vous devez utiliser le même formalisme pour les autres questions.
•	Pour chaque question vous devez mettre :
1.	L’intitulé de la question
2.	Le select de la réponse
3.	La CP de la table résultat de chaque question
*********************************************************************************
Les requêtes : 2 versions à chaque fois : SQL1 et SQL2
Questions de base
1.	Tous les employés avec tous leurs attributs et toutes les informations de leurs départements.
----------- SQL 1
SELECT *
FROM employes as E,departements as D 
WHERE E.ND=D.ND;
--------- SQL 2
SELECT * 
FROM employes E 
JOIN departements D ON E.ND = D.ND;
--CP : NE

2.	Tous les employés de Dallas.
--------- SQL 1
SELECT E.NE,E.Nom,E.ND,D.Nom,D.ville 
FROM employes E, departements D 
WHERE E.ND=D.ND 
AND D.ville='Dallas';
--------- SQL 2
SELECT E.NE,E.Nom,E.ND,D.Nom,D.ville 
FROM employes E 
JOIN departements D ON E.ND = D.ND 
WHERE D.ville='Dallas'; 
--CP : NE

3.	Combien d’employés à Dallas ?
--------- SQL 1
SELECT count(*) AS NB_EMPLOYES_DALLAS 
From employes E , departements D 
WHERE E.ND=D.ND 
AND D.ville='Dallas' 
GROUP BY D.VILLE;
--------- SQL 2
SELECT count(*) AS NB_EMPLOYES_DALLAS 
FROM employes E 
JOIN departements D ON E.ND=D.ND 
WHERE D.ville='Dallas' 
GROUP BY D.VILLE;
-- CP : NB_EMPLOYES_DALLAS
4.	Salaire moyen à Dallas.
--------- SQL 1
SELECT AVG(sal) AS MOYENNE 
From employes E , departements D 
WHERE E.ND=D.ND 
AND D.ville='Dallas';
--------- SQL 2
SELECT AVG(sal) AS MOYENNE 
FROM employes E 
JOIN departements D ON E.ND=D.ND 
WHERE D.ville='Dallas';
--CP : MOYENNE
*********************************************************************************

Questions techniques
5.	Faire le produit cartésien de la table Employés et la table Départements en projetant tous les attributs.
--------- SQL 1
SELECT * FROM employes E, departements D;
--------- SQL 2
SELECT * FROM employes E 
JOIN departements D;
--CP : NE
	a	Combien y a-t-il d’attributs dans la table résultat ?
	11 attributs
	b	Combien y a-t-il de tuples dans la table résultat ? 
	56 tuples.
	c	Quelles formules permettent de trouver les résultats ?
	TUPLES = NB_DE_TUPLES_TABLE_A * NB_DE_TUPLES_TABLE_B
	
6.	Faire la jointure naturelle de la table Employés et la table Départements en projetant tous les attributs.
--------- SQL 1
SELECT * FROM employes E, departements D 
WHERE E.ND = D.ND;
--------- SQL 2
SELECT * FROM employes E 
JOIN departements D ON E.ND = D.ND;
--CP : NE
	a	Combien y a-t-il d’attributs dans la table résultat ?
	11 atttributs
	b	Combien y a-t-il de tuples dans la table résultat ? 
	14 tuples
	c	Quelles formules permettent de trouver les résultats ?
	Dans une jointure naturelle sauf si un tuple est "null" dans une table, on devrait retrouver le même nombre de tuples de la table primaire.
	
Suite des questions
7.	Tous les employés du département RESEARCH. Faire le graphe de la question.
--------- SQL 1
SELECT E.NE,E.nom, E.ND, E.FONCTION, D.NOM 
FROM employes E, departements D 
WHERE E.ND=20 
AND D.NOM='RESEARCH';
--------- SQL 2
SELECT E.NE,E.nom, E.ND, E.FONCTION, D.NOM 
FROM employes E 
JOIN Departements D ON E.ND=20 
WHERE D.NOM='RESEARCH';
--CP : NE

8.	Tous les analystes du département RESEARCH. Faire le graphe de la question.
--------- SQL 1
SELECT E.NE,E.nom, E.ND, E.FONCTION, D.NOM 
FROM employes E, departements D 
WHERE E.ND=20 
AND D.NOM='RESEARCH' 
AND E.FONCTION='ANALYST';
--------- SQL 2
SELECT E.NE,E.nom, E.ND, E.FONCTION, D.NOM 
FROM employes E 
JOIN Departements D ON E.ND=20 
JOIN Departements ON Departements.NOM='RESEARCH'
WHERE E.FONCTION='ANALYST';
--CP : NE

9.	Tous les employés qui gagnent plus que 1500 et qui travaillent à NEW YORK. Faire le graphe de la question.
--------- SQL 1
SELECT E.NE, E.Nom, E.sal SALAIRE, D.Ville 
FROM employes E, departements D 
WHERE D.Ville='New York' 
AND E.sal>1500;
--------- SQL 2
SELECT E.NE, E.Nom, E.sal SALAIRE SALAIRE, D.Ville 
FROM employes E 
JOIN Departements D ON D.Ville='New York' 
WHERE E.sal>1500;
--CP : NE

10.	Nombre d’employés et moyenne des salaires des employés travaillant à DALLAS
--------- SQL 1
SELECT Count(*) NB_EMPLOYES, AVG(E.sal) MOYENNE_SALAIRE 
FROM employes E, departements D 
WHERE D.ville ='Dallas'
AND E.ND=D.ND 
GROUP BY D.VILLE;
--------- SQL 2
SELECT Count(*) NB_EMPLOYES, AVG(E.sal) MOYENNE_SALAIRE 
FROM employes E 
JOIN departements D ON D.ville ='Dallas' 
WHERE E.ND=D.ND 
GROUP BY D.VILLE;
--CP : NB_EMPLOYES

11.	Moyenne des commissions des vendeurs du département SALES
--------- SQL 1
SELECT AVG(comm) MOYENNE 
FROM employes E, departements D 
WHERE D.nom = 'sales';
--------- SQL 2
SELECT AVG(comm) MOYENNE
FROM employes E 
JOIN departements D ON D.nom = 'sales';
--CP : MOYENNE

Questions sur les chefs de base

12.	Tous les employés avec leurs chefs. Faire le graphe de la question.
--------- SQL 1
SELECT E.NE, E.nom, Echef.NE, Echef.nom 
FROM employes E, employes Echef 
WHERE E.NEchef = Echef.NE;
--------- SQL 2
SELECT E.NE, E.nom, Echef.NE, Echef.nom 
FROM employes E 
JOIN employes Echef ON E.NEchef = Echef.NE;
--CP : NE
13.	Combien y a-t-il de tuples dans la question précédente ? Pourquoi ?
		13 car il y en a un qui ne possède pas de chef (le president)
14.	Tous les employés dont le chef est à DALLAS. Faire le graphe de la question.
--------- SQL 1
SELECT E.NE, E.nom, Echef.NE, Echef.nom, D.Ville 
FROM employes E, employes Echef, departements D  
WHERE E.NEchef = Echef.NE 
AND D.Ville='Dallas';
--------- SQL 2
SELECT E.NE, E.nom, Echef.NE, Echef.nom, D.Ville 
FROM employes E 
JOIN employes Echef ON E.NEchef=Echef.NE 
JOIN Departements D ON D.VILLE='Dallas';
--CP : NE

(*) Questions techniques sur les chefs de base
15.	Faire le produit cartésien de la table Employés avec elle-même.
	a	Combien y a-t-il d’attributs dans la table résultat ?
	b	Combien y a-t-il de tuples dans la table résultat ? 
	c	Quelles formules permettent de trouver les résultats ?
16.	Faire la jointure naturelle de la table Employés avec elle-même. 
	a	Combien y a-t-il d’attributs dans la table résultat ?
	b	Combien y a-t-il de tuples dans la table résultat ? 
	c	Quelles formules permettent de trouver les résultats ?
	
Suite des questions sur les chefs

17.	Tous les employés ne travaillant pas dans le même département que leur chef. Faire le graphe de la question.
--------- SQL 1
SELECT E.NE, E.nom, Echef.NE, Echef.nom 
FROM employes E, employes Echef  
WHERE E.NEchef = Echef.NE 
AND E.ND != Echef.ND;
--------- SQL 2
SELECT E.NE, E.nom, Echef.NE, Echef.nom 
FROM employes E 
JOIN employes Echef ON E.NEchef = Echef.NE 
WHERE E.ND != Echef.ND;
--CP NE

18.	Tous les employés embauchés avant leur chef. Faire le graphe de la question.
--------- SQL 1
SELECT E.NE, E.nom, E.datemb, Echef.NE, Echef.nom, Echef.datemb 
FROM employes E, employes Echef 
WHERE E.NEchef = Echef.NE 
AND E.datemb > Echef.datemb;
--------- SQL 2
SELECT E.NE, E.nom, E.datemb, Echef.NE, Echef.nom, Echef.datemb 
FROM employes E 
JOIN employes Echef ON E.NEchef = Echef.NE 
WHERE E.datemb > Echef.datemb;
--CP : NE
19.	Donner la liste des numéros de chef, le nombre de leur subordonnées et le salaire moyen des subordonnés (préparation à la question suivante, pas de jointure dans cette question).
--------- SQL 1
SELECT E.NE,E.Nom 
From employes E, employes Esub 
WHERE E.NE = Esub.NE;
--------- SQL 2
SELECT E.NE,E.Nom  
From employes E 
JOIN employes Esub ON E.NE = Esub.NE;
--CP : NE
20.	Donner la liste de tous les supérieures hiérarchiques avec leur salaire, le nombre de leur subordonnées et le salaire moyen, min et max de leurs subordonnés. On entend par salaire le salaire et les commissions. On tri les résultats par nombre de subordonnés et moyenne des salaires décroissants.
--------- SQL 1
SELECT E.NE, E.NOM, E.SAL + ifnull(E.COMM,0) SALAIRE_CHEF, COUNT(Esub.NE) AS NB_EMP, 
MIN(Esub.SAL + ifnull(Esub.COMM,0)) SALAIRE_MIN, MAX(Esub.SAL + ifnull(Esub.COMM,0)) SALAIRE_MAX, AVG(Esub.SAL + ifnull(Esub.COMM,0)) SALAIRE_MOYEN 
FROM employes E, employes Esub 
WHERE E.NE = Esub.NEchef 
AND Esub.NEchef IS NOT NULL 
GROUP BY E.NE; 
--------- SQL 2
SELECT E.NE, E.NOM, E.SAL + ifnull(E.COMM,0) SALAIRE_CHEF, COUNT(Esub.NE) AS NB_EMP, 
MIN(Esub.SAL + ifnull(Esub.COMM,0)) SALAIRE_MIN, MAX(Esub.SAL + ifnull(Esub.COMM,0)) SALAIRE_MAX, AVG(Esub.SAL + ifnull(Esub.COMM,0)) SALAIRE_MOYEN 
FROM employes E 
JOIN employes Esub ON E.NE = Esub.NEchef  
WHERE Esub.NEchef IS NOT NULL  
GROUP BY E.NE; 
--CP : NE, NE 

21.	 (*) Tous les chefs avec la liste de leurs subordonnées.
Plus de 2 tables
22.	Tous les employés avec le nom de leur département et le nom de leur chef ainsi que le nom du département de leur chef.
--------- SQL 1
SELECT E.NE, E.NOM, E.ND, Echef.NE, Echef.Nom, EChef.ND 
FROM employes E, employes Echef 
WHERE E.NEChef= EChef.NE;
--------- SQL 2
SELECT E.NE, E.NOM, E.ND, Echef.NE, Echef.Nom, EChef.ND 
FROM employes E
JOIN employes Echef ON E.NEChef= EChef.NE;
--CP : NE NE 
a.	Combien y a-t-il de tuples dans la table résultat ? Pourquoi ?
		13 car le president ne possède pas de chef (NEChef=Null)


23.	Tous les employés ne travaillant pas dans la même ville que leur chef.
SELECT E.NE,E.NOM,D.Ville, EChef.NE, EChef.NOM, DChef.Ville 
FROM employes E, employes Echef, departements D, departements DChef 
WHERE ECHef.NE  = E.NECHEF  
AND D.Ville != DChef.Ville;
AND E.NEChef = ECHef.NE;
24.	Les Clerks dont le chef n’est pas de New York. On veut aussi le nom du département des Clerks.
SELECT E.NE, E.NOM, E.ND 
FROM employes E, employes EChef, departements D 
WHERE EChef.Ville != 'New York';

*********************************************************************************
*********************************************************************************
*********************************************************************************
EXERCICE 3 : Jointures artificielles et requêtes imbriquées - Chapitres 3 à 7 du cours

*********************************************************************************
Travail à faire
La même chose que pour l’exercice 2, à la suite dans le même fichier.
Quand on demande 2 versions, il faut proposer une jointure et une imbriquée.

On traite uniquement les questions en gras (les 7 premières)
Les suivantes, avec un (*) au début, sont facultatives.


*********************************************************************************
Les requêtes
1.	Tous les employés travaillant dans un département qui contient au moins un 'ANALYST'.
V_1 :

SELECT E.NE, E.NOM, E.ND
FROM employes E
WHERE EXISTS(
      SELECT *
      FROM employes
      WHERE fonction = 'ANALYST'
      AND E.ND = employes.ND);

2.	Tous les employés ayant le même job que les employés du département 30.
	Ecrire 2 versions.
3.	Tous les noms et dates d’embauche des employés embauchés avant BLAKE.
	Ecrire 2 versions.
4.	Tous les employés ayant le même chef que ALLEN
	Ecrire 2 versions.
5.	Tous les employés n’ayant pas de subordonnées.
	Ecrire 2 versions : un minus théorique (n’existe pas dans MySQL) et une imbriqué.
6.	Tous les employés qui gagnent plus que la moyenne, classés par salaire croissant.
	Ecrire 2 versions : une version imbriquée dans le from, une version imbriquée dans le where.
7.	Tous les départements qui contiennent plus d’employés que le nombre moyen d’employés par ville.
	Faire deux versions imbriqués (avec et sans imbrications dans le where)
	Faire plusieurs versions avec des vues.

*********************************************************************************
8.	 (*) Tous les départements vides avec leurs noms et villes.
	Ecrire 2 versions : un minus théorique (n’existe pas dans MySQL) et une imbriqué.
9.	(*) Tous les employés n’ayant pas le même chef que ALLEN
	Ecrire 2 versions (jointure artificielle et NOT IN)
10.	 (*) Tous les employés ayant le même job et le même chef que MARTIN.
	Ecrire 3 versions.
11.	(*) Tous les employés travaillant à Chicago et ayant le même job qu’ALLEN.
	Ecrire 3 versions.
12.	(*) Tous les employés du département RESEARCH embauchés la même année que quelqu’un du département SALES
	Ecrire 3 versions.
13.	(*) Tous les employés embauchés avant tous les employés du département 10.
	Ecrire 2 versions. 
	Pour vérifier on affichera tous les employés du 10 ordonnés par date d’embauche.

*********************************************************************************
*********************************************************************************
*********************************************************************************
EXERCICE 4 : Jointures externes et SQL2 - Chapitres 8 et 9 du cours

*********************************************************************************
Travail à faire
La même chose que pour l’exercice 3, à la suite dans le même fichier.
Quand on demande 2 versions, il faut proposer une jointure et une imbriquée.

On traite uniquement les questions en gras (les 7 premières)
Les suivantes, avec un (*) au début, sont facultatives.


*********************************************************************************
Les requêtes
Questions techniques
1.	Faites une jointure naturelle entre « emp » et « dept » avec un « using » pour avoir chaque employé avec son département
2.	Faites une jointure naturelle entre « emp » et « dept » avec un « on ».
3.	Ajoutez un inner à la question 2. Que constatez-vous ?
4.	Ajouter un outer à la question 2. Que constatez-vous ?
5.	Faites une jointure naturelle entre « emp » et « dept » avec un « natural join » : que constatez vous ?
6.	En partant de la question 2, faites une jointure externe à gauche (left) entre « emp » et « dept ». Que constatez-vous ?
7.	En partant de la question 2, faites une jointure externe à droite(right) entre « emp » et « dept ». Que constatez-vous ?

*********************************************************************************
Questions fonctionnelles
8.	Quels sont les départements vides ?
9.	Quels sont les employés qui ne sont pas supérieurs hiérarchiques ?
10.	Listez tous les employés avec leur salaire et celui de leur chef. On l’identifiant et le nom des chefs. On listera aussi les employés qui n’ont pas de chefs.
11.	Tous les employés n’ayant pas le même chef que ALLEN

*********************************************************************************
Questions techniques
12.	Faites une jointure naturelle entre « emp » et « emp » avec un « using » pour avoir les chefs.
13.	Faites une jointure naturelle entre « emp » et « emp» avec un « on ».
14.	Ajoutez un inner à la question 13. Que constatez-vous ?
15.	Ajouter un outer à la question 13. Que constatez-vous ?
16.	Faites une jointure naturelle entre « emp » et « emp» avec un « natural join » : que constatez vous ?
17.	En partant de la question 13, faites une jointure externe à gauche (left) entre « emp » et « emp». Que constatez-vous ?
18.	En partant de la question 13, faites une jointure externe à droite (right) entre « emp » et « emp». Que constatez-vous ?

