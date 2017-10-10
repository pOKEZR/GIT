-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- v
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- v
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- v
-- EXERCICE 2 : Jointures naturelles - Chapitres 1 et 2 du cours
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- v
-- Questions de base
-- 1.	     Tous les employés avec tous leurs attributs et toutes les informations de leurs départements.
SELECT *
FROM Employes E, Departements D
WHERE E.ND = D.ND;
-- CP : E.NE

SELECT *
FROM Employes E
JOIN Departements D On (E.ND=D.ND);
-- CP : E.NE

-- 2. Tous les employés de Dallas.
SELECT E.NE, E.nom, D.ville
FROM Employes E, Departements D
WHERE E.ND = D.ND
AND ville = 'DALLAS';
-- CP : E.NE

SELECT E.NE, E.nom, D.ville
FROM Employes E
JOIN Departements D On (E.ND=D.ND)
WHERE ville = 'DALLAS';
-- CP : E.NE

-- 3. Combien d’employés à Dallas ?
SELECT count(*)
FROM Employes E, Departements D
WHERE E.ND = D.ND
AND ville = 'DALLAS';
-- CP : NULL

SELECT count(*)
FROM Employes E
JOIN Departements D On (E.ND=D.ND)
WHERE ville = 'DALLAS';
-- CP : NULL

-- 4. Salaire moyen par ville.
SELECT ville, avg(sal)
FROM Employes E, Departements D
WHERE E.ND = D.ND
GROUP BY ville;
-- CP : ville

SELECT ville, avg(sal)
FROM Employes E
JOIN Departements D On (E.ND=D.ND)
GROUP BY ville;
-- CP : ville

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- v
-- Questions technique
-- 5.	     Faire le produit cartésien de la table Employés et la table Départements en projetant tous les attributs.
SELECT *
FROM Employes E, Departements D;
-- CP : E.NE, D.ND

Select E.*, D.*
From EMPLOYES E JOIN DEPARTEMENTS D;
-- CP : E.NE, D.ND

-- a  Combien y a-t-il d’attributs dans la table résultat ?
--      11
--	b	Combien y a-t-il de tuples dans la table résultat ?
--      56
--	c	Quelles formules permettent de trouver les résultats ?
--      8 + 3 = 11
--      14 * 4 = 56

-- 6.	Faire la jointure naturelle de la table Employés et la table Départements en projetant tous les attributs.
SELECT *
FROM Employes E, Departements D
WHERE E.ND = D.ND;
-- CP = E.NE

Select E.*, D.*
From EMPLOYES E
JOIN DEPARTEMENTS D On (E.ND=D.ND);
-- CP = E.NE

-- a  Combien y a-t-il d’attributs dans la table résultat ?
--      11
--	b	Combien y a-t-il de tuples dans la table résultat ?
--      14
--	c	Quelles formules permettent de trouver les résultats ?
--      8 + 3 = 11
--      Nombre de tuples de la table maitre : employes

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- v
-- Suite des questions
-- 7.	 Tous les employés du département RESEARCH
SELECT E.NE, E.nom, D.nom
FROM Employes E, Departements D
WHERE E.ND = D.ND
And D.nom = 'RESEARCH';
-- CP = E.NE

SELECT E.NE, E.nom, D.nom
FROM Employes E
JOIN Departements D On (E.ND=D.ND)
WHERE D.nom = 'RESEARCH';
-- CP = E.NE

-- 8. Tous les analystes du département RESEARCH.
SELECT E.NE, E.nom, E.job, D.nom
FROM Employes E, Departements D
WHERE E.ND = D.ND
AND D.nom = 'RESEARCH'
AND fonction='Analyst';
-- CP = E.NE

SELECT E.NE, E.nom, E.job, D.nom
FROM Employes E
JOIN Departements D On (E.ND=D.ND)
WHERE D.nom = 'RESEARCH'
AND fonction='Analyst';
-- CP = E.NE

-- 9. Tous les employés qui gagnent plus que 1500 et qui travaillent à NEW YORK.
SELECT E.NE, E.nom, E.sal, D.ville
FROM Employes E, Departements D
WHERE E.ND = D.ND
And E.sal > 1500
And D.ville = 'NEW YORK';
-- CP = E.NE

SELECT E.NE, E.nom, E.sal, D.ville
FROM Employes E
JOIN Departements D On (E.ND=D.ND)
WHERE E.sal > 1500
And D.ville = 'NEW YORK';
-- CP = E.NE

-- 10.	Nombre d’employés et moyenne des salaires des employés travaillant à DALLAS
SELECT count(*), avg(sal)
FROM Employes E, Departements D
WHERE E.ND = D.ND
And ville = 'DALLAS';
-- CP = E.NE

SELECT count(*), avg(sal)
FROM Employes E
JOIN Departements D On (E.ND=D.ND)
WHERE ville = 'DALLAS';
-- CP = E.NE

-- 11.	Moyenne des commissions des vendeurs du département SALES
SELECT avg (comm)
FROM Employes E, Departements D
WHERE E.ND = D.ND
And fonction = 'SALESMAN'
And D.nom = 'SALES';
-- CP = NULL
-- Il n’est pas nécessaire de sélectionner « comm is NULL »
-- car la moyenne s’effectue les employés dont la comm est renseignée.

SELECT avg (comm)
FROM Employes E
JOIN Departements D On (E.ND=D.ND)
WHERE fonction = 'SALESMAN'
And D.nom = 'SALES';
-- CP = NULL

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- v
-- Questions sur les chefs de base
-- 12.	     Tous les employés avec leurs chefs.
SELECT  E.NE, E.nom, Echef.NE as NEchef, Echef.nom as nomChef
FROM Employes E, Employes Echef
WHERE E.NEchef = Echef.NE;
-- CP = E.NE

SELECT  E.NE, E.nom, Echef.NE as NEchef, Echef.nom as nomChef
FROM Employes E
JOIN Employes Echef On (E.NEchef = Echef.NE);
-- CP = E.NE

-- 13.	Combien y a-t-il de tuples dans la question précédente ? Pourquoi ?
--      13
--      14 - 1 : Autant que de tuples dans la table maitre
--               moins le tuple avec NEchef=NULL

-- 14.		 Tous les employés dont le chef est à DALLAS.
SELECT  E.NE, E.nom, Echef.NE as NEchef, Echef.nom as nomChef, Dchef.ville as villeChef
FROM Employes E, Employes Echef, Departements Dchef
WHERE E.NEchef = Echef.NE
AND Echef.ND = Dchef.ND
AND Dchef.VILLE = 'DALLAS';
-- CP = E.NE

SELECT  E.NE, E.nom, Echef.NE as NEchef, Echef.nom as nomChef, Dchef.ville as villeChef
FROM Employes E
JOIN Employes Echef On (E.NEchef = Echef.NE)
JOIN Departements Dchef On (Echef.ND = Dchef.ND)
WHERE Dchef.VILLE = 'DALLAS';
-- CP = E.NE

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- v
-- Questions techniques sur les chefs de base
-- (*)15.    Faire le produit cartésien de la table Employés avec elle-même.
SELECT  *
FROM Employes E, Employes Echef;

SELECT  *
FROM Employes E
JOIN Employes Echef;
-- CP = E .NE, Echef.NE

--  a Combien y a-t-il d’attributs dans la table résultat ?
--      16
--  b	Combien y a-t-il de tuples dans la table résultat ?
--      196
--  c   Quelles formules permettent de trouver les résultats ?
--      8 + 8 = 16 attributs.
--      14 * 14 = 196 tuples.

-- 16.	Faire la jointure naturelle de la table Employés avec elle-même.
SELECT  *
FROM Employes E, Employes Echef
WHERE E.NEchef = Echef.NE;
-- CP = E .NE

SELECT  *
FROM Employes E
JOIN Employes Echef On (E.NEchef = Echef.NE);
-- CP = E .NE

--  a   Combien y a-t-il d’attributs dans la table résultat ?
--      16
--  b   Combien y a-t-il de tuples dans la table résultat ?
--      13
--  c   Quelles formules permettent de trouver les résultats ?
--      8 + 8 = 16 attributs.
--      13 tuples.
--      14 - 1 tuples : Autant que de tuples dans la table maitre
--                      moins le tuple avec NEchef=NULL

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- v
-- Suite des questions sur les chefs
17.	 Tous les employés ne travaillant pas dans le même département que leur chef.
SELECT  E.NE, E.nom, E.ND, Echef.ND NDchef
FROM Employes E, Employes Echef
WHERE E.NEchef = Echef.NE
And E.ND != Echef.ND;

CP = E .NE

-- 18. Tous les employés embauchés avant leur chef.
SELECT  E.NE, E.nom, E.datemb, Echef.datemb datembChef
FROM Employes E, Employes Echef
WHERE E.NEchef = Echef.NE
And E.datemb < Echef.datemb;
-- CP = E .NE

-- 19.	Donner la liste des numéros de chef, le nombre de leur subordonnées
--      et le salaire moyen des subordonnés
--      (préparation à la question suivante, pas de jointure dans cette question).
SELECT NEchef, count(*), avg(sal)
FROM Employes
WHERE NEchef is not NULL
GROUP BY  NEchef;

-- 20.	  Donner la liste de tous les chefs de service avec leur salaire,
--      le nombre de leur subordonnées et le salaire moyen, min et max de leurs subordonnés.
--      On entend par salaire le salaire et les commissions.
--      On tri les résultats par nombre de subordonnés et moyenne des salaires décroissants.
SELECT  Echef.NE NEchef, Echef.nom nomChef, Echef.sal salChef,
        count(*) nbSubo, avg(E.sal) moySalSubo, min(E.sal) minSalSubo, max(E.sal) maxSalSubo
	FROM Employes E, Employes Echef
	WHERE E.NEchef = Echef.NE
	GROUP BY Echef.NE, Echef.nom, Echef.sal;

-- La clé primaire est constituée de la concaténation des attributs du group by :
-- Echef.NE, Echef.nom, Echef.sal
-- Cependant, elle peut aussi être constituée d’une partie de cette concaténation.
-- Ici : CP = Echef.NE

-- 21.  (*) Tous les chefs avec la liste de leurs subordonnées.
SELECT  Echef.NE NEchef, Echef.nom nomChef,
        group_concat(E.NE,':',E.nom)
	FROM Employes E, Employes Echef
	WHERE E.NEchef = Echef.NE
	GROUP BY Echef.NE, Echef.nom;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Plus de 2 tables
-- 22.	Tous les employés avec le nom de leur département et le nom de leur chef ainsi que le nom du département de leur chef.
SELECT  E.NE NE, E.nom nom, D.nom nomDept, Echef.NE NEchef, Echef.nom nomChef, Dchef.nom nomDeptChef
FROM Employes E, Employes Echef, Departements D, Departements Dchef
WHERE E.NEchef = Echef.NE
And E.ND = D.ND
And Echef.ND = Dchef.ND;
-- CP E.NE
-- a. Combien y a-t-il de tuples dans la table résultat ? Pourquoi ?
--      13
--      Autant que dans la table maitre globale, moins 1.

SELECT  E.NE NE, E.nom nom, D.nom nomDept, Echef.NE NEchef, Echef.nom nomChef, Dchef.nom nomDeptChef
FROM Employes E
JOIN Departements D On (E.ND = D.ND)
JOIN Employes Echef On (E.NEchef = Echef.NE)
JOIN Departements Dchef On (Echef.ND = Dchef.ND);

23.  Tous les employés ne travaillant pas dans la même ville que leur chef.
SELECT  E.NE NE, E.nom nom, D.ville ville, Dchef.ville villeChef
FROM Employes E, Employes Echef, Departements D, Departements Dchef
WHERE E.NEchef = Echef.NE
And E.ND = D.ND
And Echef.ND = Dchef.ND
And D.ville != Dchef.ville;
-- CP = E .NE

SELECT  E.NE NE, E.nom nom, D.ville ville, Dchef.ville villeChef
FROM Employes E
JOIN Departements D On (E.ND = D.ND)
JOIN Employes Echef On (E.NEchef = Echef.NE)
JOIN Departements Dchef On (Echef.ND = Dchef.ND)
WHERE D.ville != Dchef.ville;
-- CP = E .NE

-- 24.	Les Clerks dont le chef n’’est pas de New York. On veut aussi le nom du département des Clerks.

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- v
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- v
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- v
-- EXERCICE 3 : Jointures artificielles et requêtes imbriquées - Chapitres 3 à 7 du cours
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- v
-- 1. Tous les employés travaillant dans un département qui contient au moins un 'ANALYST'.
--      Ecrire 2 versions.
SELECT NE, nom, fonction, nd
FROM employes
WHERE nd in (
   SELECT nd FROM employes
      WHERE fonction='analyst'
      );
      -- CP = NE

SELECT distinct e1.NE, e1.nom, e1.fonction, e1.nd
FROM employes e1, employes e2
WHERE e1.nd = e2.nd
AND e2.fonction='analyst';
-- CP = e1.NE
-- C''est une jointure artificielle : la CP de la jointure est elle du produit cartésien
-- Donc e1.NE, e2.NE. Il y aura donc des doublons si on ne projette que e1.NE
-- Il faut donc faire un distinct.
