SGBD – SQL - TP : DDL et DML
Nom : MARTINS RIBEIRO

Encodage du fichier texte en UTF8 - BOM

****************************************************************************
****************************************************************************
Présentation et préparation du travail
•	     Le fichier de rendu du TP est dans un fichier texte téléchargeable : MonNom_TP_SQL_DDL_DML.txt
•	     Changez le nom du fichier : remplacez MonNom par votre nom : exemple : Liaudet_TP_SQL_DDL_DML.txt
•	     Dans le fichier, à la première ligne, mettez votre nom.
•	     Ensuite, vous copiez les questions et vous mettrez vos réponses directement dans le fichier.
•	     Il sera envoyé à l’adresse mail : liaudet.bertrand@wanadoo.fr

****************************************************************************
****************************************************************************
****************************************************************************
Exercice 1 : charger les tables de la base de données

****************************************************************************
Présentation
On travaille sur la table suivante qui se trouve dans le fichier EmployesTP03_avec_erreur.txt

EMPLOYES(NE, NOM, JOB, DATEMB, SAL, COMM, #ND, *NEchef)
•	     NE	       numéro de l’employé. Clé primaire.
•	     NOM       nom de l’employé.
•	     JOB       	   intitulé du poste occupé.
•	     DATEMB	   date d’embauche.
•	     SAL	   	salaire de l’employé.
•	     COMM		commission (part de salaire variable).
•	     #ND			   n° du département dans lequel travaille l’employé. Clé étrangère.
•	     *NEchef			   n° d’employé du chef de l’employé. Clé étrangère réflexive.

DEPARTEMENTS(ND, NOM, VILLE, #NEchef)
•		 ND   	     numéro des départements de l’entreprise. Clé primaire.
•		 NOM	     nom des départements de l’entreprise.
•		 VILLE	     nom des villes où sont situés les départements.
•		 #NEchef     n° d’employé du chef de département. Clé étrangère.

****************************************************************************
Les requêtes
1.  Télécharger le script de création de la BD : EmployesTP03_avec_erreur.txt
2.  Lancer ce script de création de la BD.
3.  Corriger les erreurs dans l’ordre : lister toutes les erreurs une par une. Pour corriger les erreurs, il faut les traiter dans l’ordre, warnings compris. Notez toutes vos modifications dans le fichier de rendu.
4.  Enregistrer un script corrigé.

****************************************************************************
****************************************************************************
****************************************************************************
Exercice 2 : modification et création de la BD

****************************************************************************
Méthode de travail
Pour toutes les questions, commencez par écrire la requête qui sélectionne les tuples concernés.
Ensuite écrivez la requête qui fait la modification.
Relancez la requête qui sélectionne les tuples concernés pour vérifier que la modification a été faite correctement.
Le mieux est de recharger régulièrement une BD propre : le script corrigé du TP03 pour avoir le jeu de données d’origine.
Les requêtes : CMS (Création Modification Suppression) des tuples
1.  Faire une augmentation de salaire de 20% à tous les employés du département 20. Commencer par faire une requête de recherche des tuples concernés.
// pour voir d’où on part
SELECT NE, nom, sal, ND
FROM employes
WHERE ND = 20

// l’update : la modification
UPDATE …

// pour voir les modifications effectuées
SELECT NE, nom, sal, ND
FROM employes
WHERE ND = 20

2.    Augmenter la commission de 200 à tous les vendeurs de Chicago. Commencer par faire une requête de recherche des tuples concernés?
SELECT NE, NOM,JOB, VILLE, COMM
FROM EMP, DEPT
WHERE EMP.ND = DEPT.ND
AND VILLE = 'CHICAGO'
AND JOB = 'SALESMAN';

UPDATE EMPLOYES E, DEPARTEMENTS D
SET COMM = COMM+200
WHERE E.ND = D.ND
AND JOB = 'SALESMAN'
AND D.VILLE = 'CHICAGO';

2. bis : Augmenter de 10 % tous les subordonnés des employés qui gagnent plus que 3000.
UPDATE EMPLOYES E, EMPLOYES Echef
SET E.sal = E.sal*1.1
WHERE E.NECHEF=ECHEF.NE
AND ECHEF.SAL > 3000;

3. Essayer de créer l’employé Dupond dont le numéro d’employé est 7839. On n’a pas plus d’informations le concernant. Quel problème cela pose-t-il ?
-- On ne connait pas son chef, son salaire, son nd, son job donc ce n est pas possible car certains attributs ne peuvent pas être null
4. Essayer de créer l’employé Dupond dont le numéro d’employé est 7839 et qui travaille dans le département 10. Quel problème cela pose-t-il ? Comment pouvez-vous le résoudre ?
-- Toujours impossible car l'attribut JOB ne peut pas être 'null'.
5. Essayer de supprimer le département 10. Quel problème cela pose-t-il ?
-- Pas possible car certains employés dépendent du département 10.
6. Essayer de supprimer l’employé n° 7698. Quel problème cela pose-t-il ?
-- L'employé 7698 à un NE qui correspond à NEChef de certains employés, ils sont donc dépendant de lui et ne peut être supprimé.
7. Créer l’employé Dupond . Son numéro est le 8000. Il est MANAGER. Sa date d’embauche est le 1 février 2007. Son salaire est 2500. Il n’a pas de commission. Son supérieur hiérarchique est le Président. Il travaille dans le département 30. Turner (7844) et James (7900) passe sous sa responsabilité. Ecrivez le script de mise à jour de la base de données. Exécuter ce script.
INSERT INTO EMPLOYES VALUES(8000, 'DUPOND', 'MANAGER', '2007-02-01', 2500, NULL, 30,7839)

UPDATE EMPLOYES
SET NEchef = 8000
WHERE NE = 7844 OR NE = 7843;
8. Dupond et les employés sous sa responsabilité travaille désormais dans le département 40. Ecrivez le script de mise à jour de la base de données.
UPDATE employes E, departements D
SET E.ND = 40
WHERE E.ND = D.ND
AND E.NEchef = 8000;
9. Blake (7698) démissionne. Tous les employés sous sa responsabilité passent sous celle de Dupond et dans son département. Son département est supprimé. Tous les employés de son département passent dans le département de Dupond. Ecrivez le script de mise à jour de la base de données. Dans le script on commencera par lister tous les subordonnés de Blake et tous les employés de son département.
UPDATE employes
SET NEchef=8000 AND E.ND = 40
WHERE E.ND = D.ND
AND NEchef = 7698;

10.	 Ajouter un nouveau département. Il est à PARIS. Son nom est « INFO ». On souhaite gérer le numéro du département automatiquement. Quel est le numéro de ce nouveau département ?
-- LE NUMERO EST 41
****************************************************************************
****************************************************************************
****************************************************************************
Exercice 3 : création de la BD via un SELECT et des ALTER

****************************************************************************
Méthode de travail
Continuer à écrire les scripts dans le fichier de l’exercice précédent.
Les requêtes
11. Recharger une BD propre : le script corrigé du TP03
12. Dans une nouvelle BD, la BD « exotest », Créer une table « empcomplet » avec tous les tuples qui contiennent tous les employés avec toutes les infos sur leurs départements et sur leur chef.. On n’aura par contre pas d’information sur le département du chef et sur le chef du chef.
13. Ajouter les contraintes d’intégrité.
14. Le département de  DALLAS a été déplacé à SAN FRANCISCO. Faites la mise à jour de la BD.
15. BLAKE (7698) s’appelle désormais MORTIMER. Changer son nom.
16. Reconstituer les deux tables des employés et des départements.
17. Ajouter les contraintes d’intégrité.
18. Faire un show create table de la table empcomplet.

****************************************************************************
****************************************************************************
****************************************************************************
Exercice 4 : Exporter - Importer

****************************************************************************
Méthode de travail
Continuer à écrire les scripts dans le fichier de l’exercice précédent.
Les requêtes
19. Recharger une BD propre : le script corrigé du de EmployesTP03.
20. Exporter les données correspondant à la requête : « tous les employés avec leur job, le numéro de leur département et la ville de leur département. » dans un fichier « eox4.csv dont les champs seront séparés par des virgules. Le fichier doit se trouver dans le répertoire des données de la BD.
21. Ouvrer ce fichier avec un éditeur de texte (bloc-note) puis avec un tableur (excel).
22. Créer une nouvelle BD appelée : test.
23. Dans la BD test, créer une table sans tuples dont les champs correspondent aux champs de la requête de l’exercice précédent.
24. Importer les données du fichier exo4.csv, en le laissant dans son répertoire, dans la table que vous venez de créer.

****************************************************************************
****************************************************************************
****************************************************************************
Exercice 5 : passage de InnoDB à MyISAM et retour en InnoDB

****************************************************************************
Méthode de travail
Continuer à écrire les scripts dans le fichier de l’exercice précédent.
Les requêtes
25. Recharger une BD propre : le script corrigé du TP03.
26. Faites passer dynamiquement (via des ALTER TABLE) la BD empdept créée en InnoDB en MyISAM.
Ecrire le script correspondant à toutes les étapes à franchir.
27.    Refaire passer la BD en InnoDB et ajouter les clés étrangères.
Ecrire le script correspondant.
