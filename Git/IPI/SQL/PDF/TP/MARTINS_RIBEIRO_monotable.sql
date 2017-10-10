-- Série 1 : Projection, restriction, distinct et tri
-- Série 2 : Fonctions de groupe et agrégats
-- Série facultative

-- Le fichier peut être entièrement copié/collé dans une calculette mysql pour produire un fichier de résultats.

-- il faut faire un use de la bd avant de lancer le script
use empdept

-- tee ouvre un fichier pour rediriger les résultats.
-- On le fermera à la fin du script
tee ./TP_SQL_01_Select_monotable_RESULTATS.sql;

-- ---------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------
select "SERIE 1 : Projection, restriction, distinct et tri";


-- ---------------------------------------------------------------------------------------------------------
select "-- 1 : Tous les employés avec tous les attributs";

SELECT *
FROM EMPLOYES \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "-- 2 : Tous les employés";

SELECT NE, NOM
FROM EMPLOYES \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "3 : Tous les employés triés ordre alphabétique";

SELECT NE, NOM
FROM EMPLOYES
ORDER BY NOM ASC\p;
-- CP : NE
-- REMARQUE : on peut se passer de ASC

-- ---------------------------------------------------------------------------------------------------------
select "4 : Tous les employés triés par n° de département croissant, ordre alphabétique des FONCTIONs, ancienneté décroissante";

SELECT NE, NOM, ND, FONCTION, DATEMB
FROM EMPLOYES
ORDER BY ND ASC, FONCTION ASC, DATEMB DESC \p;
-- CP : NE
-- REMARQUE : on peut se passer de ASC

-- ---------------------------------------------------------------------------------------------------------
select "5 : Tous les employés avec leurs salaires triés par salaire décroissant";

SELECT NE, NOM, SAL
FROM EMPLOYES
ORDER BY SAL DESC \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "6 : Tous les employés du département 30 avec tous leurs attributs";

SELECT *
FROM EMPLOYES
WHERE ND=30 \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "7 : Tous les employés du département 30 triés ordre alphabétique";

SELECT NE, NOM, ND
FROM EMPLOYES
WHERE ND=30
ORDER BY NOM DESC \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "8 : Tous les managers des départements 20 et 30";

SELECT NE, NOM, FONCTION, ND
FROM EMPLOYES
WHERE upper(FONCTION)="MANAGER"
AND (ND=20 OR ND=30) \p;
-- CP : NE

select "Variante :";

SELECT NE, NOM, FONCTION, ND
FROM EMPLOYES
WHERE upper(FONCTION)="MANAGER"
AND ND IN (20, 30) \p;

-- ---------------------------------------------------------------------------------------------------------
select "9 : Tous les employés qui ne sont pas managers et qui sont embauchés en 1981";

SELECT NE, NOM, FONCTION, YEAR(DATEMB)
FROM EMPLOYES
WHERE upper(FONCTION) !="MANAGER"
AND YEAR(DATEMB)=1981 \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "10 : Toutes les fonctions de la société";

SELECT DISTINCT FONCTION
FROM EMPLOYES \p;
-- CP : FONCTION

-- ---------------------------------------------------------------------------------------------------------
select "11 : Tous les employés ne travaillant pas dans le département 30 et qui soit ont un salaire > à 2800, soit sont manager";

SELECT NE, NOM, ND, SAL, FONCTION
FROM EMPLOYES
WHERE ND!=30
AND (SAL>2800 OR upper(FONCTION)="MANAGER") \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "12 : Tous les employés dont le salaire est compris entre 1000 et 2000";

SELECT NE, NOM, SAL
FROM EMPLOYES
WHERE SAL BETWEEN 1000 AND 2000 \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "13 : Tous les numéros de département";

SELECT distinct ND
FROM EMPLOYES \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "14 : Toutes les fonctions par département (10 : président, 10 : manager, etc.)";

SELECT DISTINCT ND, FONCTION
FROM EMPLOYES \p;
-- CP : ND, FONCTION


-- ---------------------------------------------------------------------------------------------------------
select "15 : Tous les employés ayant ou pouvant avoir une commission";

SELECT NE, NOM, COMM
FROM EMPLOYES
WHERE COMM IS NOT NULL \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "16 : Tous les salaires, commissions et totaux (salaire + commission) des vendeurs";

SELECT NE, NOM, SAL, COMM, (SAL+COMM), FONCTION
FROM EMPLOYES
WHERE upper(FONCTION)="SALESMAN" \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "17 : Tous les salaires, commissions et totaux (salaire + commission) des employés";

SELECT NE, NOM, SAL, COMM, (SAL+ IFNULL(COMM, 0))
FROM EMPLOYES \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "18 : Tous les employés embauchés en 1981";

SELECT NE, NOM, YEAR(DATEMB)
FROM EMPLOYES
WHERE YEAR(DATEMB)=1981 \p;
-- CP : NE

-- Version 2 : moins bien
SELECT NE, NOM, YEAR(DATEMB)
FROM EMPLOYES
WHERE DATEMB like '1981%' \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "19 : Tous les employés avec leur date d'embauche, la date du jour et leur 
nombre d'années d'ancienneté (on considérera que toute année commencée vaut pour une année), triés par 
ancienneté (on utilisera les fonctions de base de traitement de date et de traitement de chaîne).";

SELECT NE, NOM, DATEMB, CURRENT_DATE, YEAR(CURRENT_DATE) - YEAR(DATEMB) AS ANCIENETE
FROM EMPLOYES
ORDER BY ANCIENETE \p;
-- CP : NE

-- Version 2 : précise
SELECT NE, NOM, DATEMB, CURRENT_DATE, YEAR(FROM_DAYS(TO_DAYS(CURRENT_DATE) - TO_DAYS(DATEMB))) AS ANCIENETE
FROM EMPLOYES
ORDER BY ANCIENETE \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "20 : Tous les employés ayant un A en troisième lettre de leurs noms";
SELECT NE, NOM
FROM EMPLOYES
WHERE NOM like '__A%' \p;
-- CP : NE

select "Variante (on préfèrera la première solution):";
SELECT NE, NOM
FROM EMPLOYES
WHERE SUBSTR(NOM, 3, 1)='A' \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "21 : Tous les employés ayant au moins deux A dans leurs noms";

SELECT NE, NOM
FROM EMPLOYES
WHERE NOM LIKE "%A%A%" \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "22 : Donner les quatre dernières lettres du nom de chaque employé";

SELECT NE, NOM, SUBSTR(NOM, LENGTH(NOM)-3, 4)
FROM EMPLOYES \p;
-- CP : NE

select "18 - Variante : je démarre en -4 à partir de la fin";

SELECT NE, NOM, SUBSTR(NOM, -4, 4)
FROM EMPLOYES \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "23 : Quel est le plus gros salaire de l’entreprise ? FONCTION MAX interdite";

SELECT sal
FROM EMPLOYES
ORDER BY sal DESC
LIMIT 1 \p;
-- CP : SAL ou l'entreprise

-- ---------------------------------------------------------------------------------------------------------
select "24 : Quel est le plus gros salaire total des vendeurs (salaire + commission) ? FONCTION MAX interdite";

SELECT SAL+COMM
FROM EMPLOYES
WHERE upper(FONCTION)='SALESMAN'
LIMIT 1 \p;
-- CP :

-- ---------------------------------------------------------------------------------------------------------
select "25 : Quels sont les 3 employés qui ont le salaire le plus élevé ?";

SELECT NE, NOM, SAL
FROM EMPLOYES
ORDER BY sal DESC
LIMIT 3 \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "26 : Lister 3 employés au hasard";

SELECT NE, NOM
FROM EMPLOYES
ORDER BY RAND()
LIMIT 3 \p;
-- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "27 : Afficher tous les employés en affichant : « anciens » pour ceux embauchés avant le 1 janvier 1982, rien pour ceux embauchés en 1982 et « nouveaux » pour ceux embauchés après le 1 janvier 1983. On utilisera deux méthodes : le case et le if. On tri par date d’embauche et par ordre alphabétique.";

SELECT NE, NOM, DATEMB,
CASE
	WHEN DATEMB < '1982' THEN "anciens"
	     WHEN DATEMB < '1983' THEN ""
	     	  ELSE "nouveaux"
		  END AS CATEGORIE
		  FROM EMPLOYES
		  ORDER BY DATEMB, NOM \p;
		  -- CP : NE

SELECT NE, NOM, DATEMB,
       IF (DATEMB<'1982', "anciens", IF (DATEMB<'1983', "", "nouveau")) AS CATEGORIE
       FROM EMPLOYES
       ORDER BY DATEMB, NOM \p;
       -- CP : NE

-- ---------------------------------------------------------------------------------------------------------
select "28 : Afficher les employés avec le numéro de leur tranche de salaire. Le numéro va de 1 à N. La première tranche va de 0 à 999, la deuxième de 1000 à 1999, la troisième de 2000 à 2999, etc. On considère qu’on ne sait pas à l’avance combien il y aura de tranche. On affichera les résultats par ordre de tranche croissante et par ordre alphabétique à l’intérieur d’une même tranche.";

SELECT NE, NOM, (SAL DIV 1000)+1 AS TRANCHE
FROM EMPLOYES
ORDER BY TRANCHE, NOM \p;
-- CP : NE


-- ---------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------
select "SERIE 2 : Fonctions de groupe et agrégats";

-- ---------------------------------------------------------------------------------------------------------
select "1 : Combien d'employés dans la société";

SELECT COUNT(*)
FROM EMPLOYES \p;
-- CP : NULL

-- ---------------------------------------------------------------------------------------------------------
select "2 : Combien d'employés embauchés en 1981";

SELECT COUNT(*)
FROM EMPLOYES
WHERE YEAR(DATEMB)=1981 \p;
-- CP : NULL

-- ---------------------------------------------------------------------------------------------------------
select "3 : Combien de vendeurs (SALESMAN) dans la société";

SELECT COUNT(*)
FROM EMPLOYES
WHERE FONCTION="SALESMAN" \p;
-- CP : NULL

-- ---------------------------------------------------------------------------------------------------------
select "4 : Combien de départements dans la société";

SELECT COUNT(DISTINCT ND)
FROM EMPLOYES \p;
-- CP : NULL

-- ---------------------------------------------------------------------------------------------------------
select "5 : Combien de fonctions différentes dans la société";

SELECT COUNT(DISTINCT FONCTION)
FROM EMPLOYES \p;
-- CP : NULL

-- ---------------------------------------------------------------------------------------------------------
Select "6:	Combien y a-t-il d’employés qui n’ont pas et ne peuvent pas avoir de commission (la valeur est NULL) ?";

SELECT COUNT(*)
FROM EMPLOYES
WHERE COMM IS NULL \p;
-- CP : NULL

select "6 : Variante 1 :";
SELECT COUNT(*) - COUNT(COMM)
FROM EMPLOYES \p;

select "6 : Variante 2 :";
SELECT COUNT(*)
FROM EMPLOYES
WHERE COMM >=0 \p;

-- ---------------------------------------------------------------------------------------------------------
select "7 : Quels sont les salaires minimum, maximum et moyen de la société ?";

SELECT MIN(SAL), MAX(SAL), AVG(SAL)
FROM EMPLOYES \p;
-- CP : NULL

-- ---------------------------------------------------------------------------------------------------------
select "8 : Salaires moyens des vendeurs";

SELECT AVG(SAL)
FROM EMPLOYES
WHERE FONCTION="SALESMAN" \p;
-- CP : NULL

-- ---------------------------------------------------------------------------------------------------------
select "9 : Salaires moyens de tous les employés en tenant compte des commissions";

SELECT AVG(SAL + IFNULL(COMM, 0))
FROM EMPLOYES \p;
-- CP : NULL

-- ---------------------------------------------------------------------------------------------------------
select "10 : Pourcentage moyen de la commission des vendeurs par rapport à leur salaire";

SELECT AVG((COMM/(SAL+COMM))*100) RatioCommTotal
FROM EMPLOYES
WHERE FONCTION="SALESMAN" \p;
-- CP : RatioCommTotal

-- ---------------------------------------------------------------------------------------------------------
select "11 : Quel est le salaire moyen, les salaires min et max et le nombre d'employé par profession ?";

SELECT FONCTION, MIN(SAL) MINSAL, MAX(SAL) MAXSAL, AVG(SAL) AVGSAL, COUNT(*) NBEMP
FROM EMPLOYES
GROUP BY FONCTION \p;
-- CP : FONCTION

-- ---------------------------------------------------------------------------------------------------------
select "12 : Quels sont les salaires maximums de chaque département ?";

SELECT ND, MAX(SAL) MAXSAL
FROM EMPLOYES
GROUP BY ND \p;
-- CP : ND

-- ---------------------------------------------------------------------------------------------------------
select "13 : Quels sont les départements dans lesquels travaillent plus de deux personnes et quels sont les salaires moyens dans ces départements ?";

SELECT ND, AVG(SAL) AVGSAL, COUNT(*) NBEMP
FROM EMPLOYES
GROUP BY ND
HAVING COUNT(*)>2 \p;
-- CP : ND

-- ---------------------------------------------------------------------------------------------------------
select "14 : Quels sont les départements dans lequel il y a plus que 4 personnes ?";

SELECT ND, COUNT(*)
FROM EMPLOYES
GROUP BY ND
HAVING COUNT(*)>4 \p;
-- CP : ND

-- ---------------------------------------------------------------------------------------------------------
select "15 : Quels sont les fonctions pour lesquels la moyenne du salaire est supérieure à 2000 ?";

SELECT FONCTION, AVG(SAL) AVGSAL
FROM EMPLOYES
GROUP BY FONCTION 
HAVING AVG(SAL)>2000 \p;
-- CP : FONCTION

-- ---------------------------------------------------------------------------------------------------------
select "16 : Combien y a-t-il d'employés par département et par fonction et quelle est la moyenne de leurs salaires ?";

SELECT ND, FONCTION, COUNT(*) NBEMP, AVG(SAL) AVGSAL
FROM EMPLOYES
GROUP BY ND, FONCTION \p;
-- CP : ND, FONCTION

-- ---------------------------------------------------------------------------------------------------------
select "17 : Quel est le nombre d'employés par année d'embauche ?";

SELECT YEAR(DATEMB), COUNT(*)
FROM EMPLOYES
GROUP BY YEAR(DATEMB) \p;
-- CP : YEAR(DATEMB)

-- ---------------------------------------------------------------------------------------------------------
select "18 : Combien y a-t-il d'employés par tranches de salaire de 1000 (0 à 999, 1000 à 1999, etc.)";

SELECT (SAL div 1000 + 1) AS TRANCHE, 
((SAL div 1000)*1000) as MIN, ((SAL div 1000 + 1)*1000 - 0.01) as MAX, COUNT(*) NBEMP
FROM EMPLOYES
GROUP BY TRANCHE, MIN, MAX \p;
-- CP : TRANCHE = MIN = MAX

-- ---------------------------------------------------------------------------------------------------------
select "19 : Combien d’employés et de départements par fonction. Vérifiez bien votre résultat :  par exemple, il y a deux ANALYST, tous les deux dans le département 20, la réponse est donc: 2 employés et 1 département pour la fonction ANALYST.";

SELECT FONCTION, COUNT(*) NBEMP, COUNT(DISTINCT ND) NBDEPT
FROM EMPLOYES
GROUP BY FONCTION \p;
-- CP : FONCTION

-- ---------------------------------------------------------------------------------------------------------
select "20 : Liste des employés par fonction.";

SELECT FONCTION, GROUP_CONCAT(NOM) LISTE_EMPLOYES
FROM EMPLOYES
GROUP BY FONCTION \p;
-- CP : FONCTION

-- ---------------------------------------------------------------------------------------------------------
select "21 : Liste des employés par départements.";

SELECT ND, GROUP_CONCAT(NOM) LISTE_EMPLOYES
FROM EMPLOYES
GROUP BY ND \p;
-- CP : ND

-- ---------------------------------------------------------------------------------------------------------
select "22 : Liste des fonctions par département.";

SELECT ND, GROUP_CONCAT(DISTINCT FONCTION) LISTE_FONCTION
FROM EMPLOYES
GROUP BY ND \p;
-- CP : ND

-- ---------------------------------------------------------------------------------------------------------
select "23 : Liste des départements par fonction.";

SELECT FONCTION, GROUP_CONCAT(DISTINCT ND) LISTE_DEPT
FROM EMPLOYES
GROUP BY FONCTION \p;
-- CP : ND

-- ---------------------------------------------------------------------------------------------------------
select "24 : Quel est le nombre d’employés par département et par fonction, trié par département décroissant.";

SELECT ND, FONCTION, COUNT(*) NBEMP
FROM EMPLOYES
GROUP BY ND, FONCTION 
ORDER BY ND DESC \p;
-- CP : ND, FONCTION

-- ---------------------------------------------------------------------------------------------------------
select "25 : La même chose, mais trié par nombre d’employé et par numéro de département croissant. On fera une version avec alias.";

SELECT ND, FONCTION, COUNT(*) NBEMP
FROM EMPLOYES
GROUP BY ND, FONCTION 
ORDER BY NBEMP, ND \p;
-- CP : ND, FONCTION

-- ---------------------------------------------------------------------------------------------------------
select "26.	Combien y a-t-il d’employés et de départements par fonction. Vérifiez bien votre résultat :  par exemple, il y a deux ANALYST, tous les deux dans le département 20, la réponse est donc: 2 employés et 1 département pour la fonction ANALYST.";

SELECT FONCTION, COUNT(NE), COUNT(DISTINCT ND)
FROM EMPLOYES
GROUP BY FONCTION \p;
-- CP : FONCTION


-- Fermeture du fichier des résultats
notee;
