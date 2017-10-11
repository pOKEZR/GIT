VOTRE NOM et prénom : MARTINS RIBEIRO Mathieu

IPI MSQ 010 : Evaluation finale

Répondre aux questions directement dans ce fichier, sous la question.
Vous pouvez coder avec PhpMyAdmin, mais il faut produire les scripts SQL pour le rendu dans ce fichier.

Rendu : envoyer par mail à liaudet.bertrand@wanadoo.fr le fichier avec les réponses en n’oubliant pas de mettre votre nom dans le fichier !

*******************************************************************************************
*******************************************************************************************
*******************************************************************************************

Description de la BD :

La BD contient 4 tables : des dons, des personnes, des campagnes et des courriers.
Les dons sont fait par une personnes (appelé donateur dans ce cas) et un seul.
Les dons peuvent correspondre à une campagne.
Les campagnes sont des campagnes d''envoi de courriers.
Les courriers sont envoyés à un personne et une seule et correspondent à une campagne et une seule.
Les courriers correspondent donc au courrier concret envoyé et reçu par les personnes.
La plupart des champs sont explicites en ragardant en plus les valeurs.
Précisions pour quelques champs :
NPAI : n''habite pas à l''adresse indiquée.
NPAI prend la valeur NPAI en cas de retour du courrier.
Undelived : la date de retour du courrier.
DateEnvoiReçu: pour chaque dons, on envoie un reçu fiscal. La date est enregistrée dans le don.


*******************************************************************************************
*******************************************************************************************
*******************************************************************************************
Evaluation finale

Utilisez la BD en ligne avec le sujet d''examen.

Vous avez intérêt à faire le graphe des tables pour bien vous y retrouver.


1.  Quels sont les personnes qui habitent dans le département 71

SELECT *
FROM Personnes
WHERE CP LIKE '71%' AND LENGTH(CP) = 5;

2.  Quels sont les dons de 2016 de plus de 50 euros ?

SELECT *
FROM Dons
WHERE Montant > 50 AND DateDon > '2015-12-31' AND DateDon < '2017-01-01';

3.  Quelle est la somme des dons de 2015

SELECT Sum(MONTANT)
FROM Dons
WHERE year(datedon) = 2015;

4.  Quel est le plus gros montant de don effectué ?

SELECT id_don, max(MONTANT)
FROM Dons;

5.  Combien y a-t-il eu de retours de mail en tout ? (mail undelivered)

SELECT COUNT(undelivered) AS NB_Ret
FROM Courriers
WHERE undelivered is not null;

6.  Quels sont les donateurs de l''année 2015 qui habitent dans le département 71

SELECT *
FROM Personnes p
INNER JOIN Dons d ON d.id_personne=p.id_personne AND d.DateDon>'2014-12-31'AND DateDon<'2016-01-01'
WHERE p.CP LIKE '71%' AND LENGTH(p.CP)=5;

7.  Combien a-t-on d''adresses mail différentes dans la base ?

SELECT Count("SELECT mail FROM Personnes WHERE mail IS NOT NULL") AS nb_mail
FROM Personnes;

8.  Combien de dons a fait Mme Durand du département 24 et pour quel montant total ?

SELECT SUM(Montant) AS 'Montant_Total', COUNT(Montant) AS 'nb_dons'
FROM Dons d
INNER JOIN Personnes p ON p.id_personne=d.id_personne AND p.Nom='Durand'AND p.CP LIKE '24%';

9.  Combien a rapporté la campagne de juin 2016 ?

SELECT SUM(Montant) AS 'Montant_campagne_juin2016'
FROM Dons d
INNER JOIN Campagnes c ON c.id_campagne=d.id_campagne AND c.id_campagne='M-05-2016';

10. Quelles sont les personnes qui ont renvoyé un don pour la campagne de juin 2016
    en réponse au courrier qu'' leur a envoyé.

SELECT *
FROM Dons d
INNER JOIN Campagnes c ON c.id_campagne=d.id_campagne AND c.id_campagne='M-05-2016'
INNER JOIN Personnes p ON p.id_personne=d.id_personne;

11. Affichez tous les dons de 2015 et le titre de la campagne auxquels ils font référence,
    s''il y en a une (on affiche aussi les dons qui ne font pas référence à une campagne).

SELECT *
FROM Dons d
LEFT JOIN Campagnes c ON c.id_campagne=d.id_campagne
WHERE d.DateDon > '2014-12-31' AND DateDon < '2016-01-01';

12. Combien de courriers ont été envoyés pour la campagne de mai 2015

SELECT COUNT(id_personne) as 'Nb_courriers'
FROM Courriers c
INNER JOIN Campagnes cp ON cp.id_campagne=c.id_campagne AND cp.id_campagne='M-06-2015';

13. Quelles sont les personnes à qui ont a écrit et qui ont renvoyé un don
    pour la campagne de juin 2016

14. Affichez la somme des dons par personne, triée par somme décroissante
    et par ordre alphabétique de nom, le tout pour les sommes > 100.

SELECT SOMDONS
FROM (SELECT SUM(Montant) as 'SOMDONS' FROM Personnes p INNER JOIN Dons d ON d.id_personne=p.id_personne GROUP BY p.id_personne) as tmp
WHERE SOMDONS > 100
ORDER BY SOMDONS DESC;

DML

15. Créez la campagne décembre 2016 qui sera par mail et qui est posté le 1er décembre
INSERT INTO Campagnes VALUES ('M-12-2015', 'campagne décembre 2016', '2016-12-01','mail',NULL,NULL);

16. On s''est trompé sur la date d''envoi des reçus fiscaux de 2016. Ce n'' pas le
    25 février mais le 10 février. Faites la mise à jour.
UPDATE departements
SET dateEnvoi='2016-02-10'
WHERE id_campagne='REC-2015';

17. On veut connaître le total des dons récupérés pour chaque campagne. Ajouter l''attribut totalDons dans la BD.
ALTER TABLE CAMPAGNE
ADD totalDons INTEGER;

18. Mettez à jour les valeurs de cet attribut.


JOINTURE EXTERNE et IMBRIQUEE

19. LEFT : Les dons et l''année d''envoi de la campagne associée. S''il n''y a pas de campagne associée, affichera quand même le don avec null, trié par année d''envoi.

SELECT GROUP_CONCAT(d.Montant)AS 'Montant_Pour_Annee', YEAR(Ca.dateEnvoi) as 'annee_campagne'
FROM Dons d
LEFT JOIN Campanges Ca ON Ca.id_campagne=d.id_campagne
GROUP BY annee_campagne
ORDER BY annee_campagne ASC;

20. RIGHT : Affichez toutes les personnes qui n''ont jamais donné
    On fera une version imbriquée et une version jointure externe.

21. RIGHT : Quels sont les courriers qui ne sont à l''origine d''aucun dons ?
    On fera une version imbriquée et une version jointure externe.
