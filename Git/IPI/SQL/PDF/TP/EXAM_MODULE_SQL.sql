drop database if exists Association;
create database Association;
use Association;

--
-- Structure de la table Campagnes
--

CREATE TABLE Campagnes (
id_campagne varchar(10) primary key,
titre varchar(18) not NULL,
dateEnvoi date not NULL,
format varchar(6) not NULL,
formulaire_pdf varchar(29),
document_pdf varchar(27)
) ENGINE=InnoDB;

--
-- Contenu de la table Campagnes
--

INSERT INTO Campagnes VALUES ('M-06-2015', 'campagne mai 2015', '2015-05-05', 'mail', 'Formulaire de mai.pdf', 'Document de mai.pdf');
INSERT INTO Campagnes VALUES ('REC-2015', 'recus 2015', '2016-02-25', 'papier', 'Formulaire du recu fiscal.pdf', 'Document du recu fiscal.pdf');
INSERT INTO Campagnes VALUES ('M-05-2016', 'campagne juin 2016', '2016-06-12', 'mail', 'Formulaire de juin.pdf', 'Document de juin.pdf');
INSERT INTO Campagnes VALUES ('M-06-2017', 'campagne juin 2017', '2017-06-01', 'mail', 'Formulaire de juin 2017.pdf', 'Document de juin 2017.pdf');
INSERT INTO Campagnes VALUES ('M-10-2017', 'campagne octobre 2017', '2016-10-05', 'mail', 'Formulaire de octobre 2017.pdf', 'Document de octobre 2017.pdf');

-- --------------------------------------------------------
--
-- Structure de la table Personnes
--

CREATE TABLE Personnes (
id_personne integer primary key auto_increment,
Nom varchar(20) not NULL,
Prenom varchar(20),
Adresse varchar(50) not NULL,
CP int(5),
Ville varchar(30) not NULL,
NPAI varchar(4),
tel varchar(14),
mail varchar(50)
) ENGINE=InnoDB;

--
-- Contenu de la table Personnes
--

INSERT INTO Personnes (id_personne, Prenom, Nom, Adresse, CP, Ville, NPAI, tel, mail) VALUES
(1, 'Alina', 'Dupont', '163 Ruelle jeunesse ', 58250, 'LA NOCLE-MAULAIX', NULL, NULL, NULL),
(2, 'MaÃ«lys', 'Perrin', '288 Promenade du Bat-dNULLArgent', 34190, 'GANGES', NULL, NULL, NULL),
(3, 'Bianca', 'Dupont', '390 Rue signac ', 28350, 'DAMPIERRE-SUR-AVRE', NULL, '06 43 26 42 53', 'maelys.perrin@outlook.com'),
(4, 'Fabrice', 'Faure', '110 Venelle barthelemy ', 7120, 'GROSPIERRES', 'NPAI', NULL, NULL),
(5, 'Omar', 'Robert', '201 Route des Bouquetiers', 76540, 'ELETOT', NULL, '01 90 17 16 14', 'omar.robert@gmail.com'),
(6, 'Helena', 'Garnier', '67 Boulevard pare-feu ', 88450, 'VINCEY', NULL, '05 53 26 90 62', 'helena.garnier@yahoo.com'),
(7, 'Aydan', 'Mathieu', '255 Avenue peron ', 15140, 'FONTANGES', NULL, NULL, NULL),
(8, 'Shawn', 'Mathieu', '203 Pont maufinee ', 88500, 'ROZEROTTE', NULL, '02 32 32 88 72', 'shawn.mathieu@free.fr'),
(9, 'Ariane', 'Richard', '329 Gaffe de Belissen', 70130, 'SOING-CUBRY-CHARENTENAY', NULL, NULL, 'ariane.richard@yahoo.com'),
(10, 'Hamza', 'Morel', '338 Rang garde ', 84120, 'MIRABEAU', NULL, NULL, 'hamza.morel@me.com'),
(11, 'Tyron', 'Robin', '295 Avenue de la Grande-Cote', 22420, 'PLOUZELAMBRE', NULL, NULL, 'tyron.robin@yahoo.com'),
(12, 'Maimouna', 'Chevalier', '42 Place Grenette', 31370, 'LE PIN-MURELET', NULL, NULL, 'maimouna.chevalier@me.com'),
(13, 'Sohan', 'Garcia', '215 Rang Pierre-Audry', 5230, 'LA BATIE-NEUVE', NULL, NULL, NULL),
(14, 'Michel', 'Gauthier', '430 Cote Grande de la Guillotiere', 81220, 'TEYSSODE', NULL, NULL, 'ml.gauthier@fastmail.com'),
(15, 'Laurine', 'Gauthier', '430 Cote Grande de la Guillotiere', 81220, 'TEYSSODE', NULL, NULL, 'ml.gauthier@fastmail.com'),
(16, 'Hanna', 'Legrand', '371 Boulevard Bourgelat', 37260, 'ARTANNES-SUR-INDRE', NULL, NULL, 'hanna.legrand@hotmail.fr'),
(17, 'Wissem', 'Rousseau', '166 Voie chiron ', 79390, 'LHOUMOIS', NULL, NULL, 'wissem.rousseau@fastmail.com'),
(18, 'Nais', 'Dumont', '127 Montee de Bonnel', 61210, 'LES YVETEAUX', NULL, NULL, NULL),
(19, 'Jayson', 'Garcia', '373 Liaison coty ', 2820, 'MONTAIGU', NULL, NULL, NULL),
(20, 'Garance', 'Richard', '22 Quai maraichers ', 84190, 'BEAUMES-DE-VENISE', NULL, NULL, 'garance.richard@sfr.fr'),
(21, 'Arnaud', 'Simon', '407 Avenue fen edge villages ', 89120, 'DICY', NULL, NULL, 'arnaud.simon@outlook.com'),
(22, 'Paula', 'Perrin', '336 Sentier maridor ', 21310, 'CHARMES', NULL, NULL, 'paula.perrin@yahoo.fr'),
(23, 'Tess', 'Leroy', '128 Residence deroche ', 76740, 'LA GAILLARDE', NULL, NULL, 'tess.leroy@gmail.com'),
(24, 'Christian', 'Perrin', '372 Boulevard de lNULLAlma', 59265, 'AUBENCHEUL-AU-BAC', NULL, NULL, NULL),
(25, 'Anne-Sophie', 'Chevalier', '276 Cours fleurs ', 53140, 'LA PALLU', NULL, NULL, 'anne-sophie.chevalier@sfr.fr'),
(26, 'Matthew', 'Morin', '424 Dreve beaudouin ', 33560, 'CARBON-BLANC', NULL, NULL, 'matthew.morin@hotmail.com'),
(27, 'Blaise', 'Rousseau', '347 Avenue garde ', 64150, 'MOURENX', NULL, NULL, 'blaise.rousseau@mail.com'),
(28, 'Idir', 'Martin', '380 Cite kennedy ', 52200, 'COURCELLES-EN-MONTAGNE', NULL, NULL, 'idir.martin@gmail.com'),
(29, 'Mickael', 'Guerin', '445 Place dNULLAubigny', 55400, 'GUSSAINVILLE', NULL, NULL, 'mickael.guerin@free.fr'),
(30, 'Amel', 'Faure', '469 Boulevard champs ', 62650, 'PARENTY', NULL, NULL, 'amel.faure@hotmail.com'),
(31, 'Arwa', 'Morin', '281 Rue chataigniers ', 95390, 'SAINT-PRIX', NULL, NULL, 'arwa.morin@mail.com'),
(32, 'Marouane', 'Girard', '97 Grand-route leclerc ', 2270, 'MONTIGNY-SUR-CRECY', NULL, NULL, NULL),
(33, 'Dorian', 'Bernard', '158 Cour anglaise mesnard ', 38550, 'LE PEAGE-DE-ROUSSILLON', NULL, NULL, 'dorian.bernard@me.com'),
(34, 'Ilian', 'Dumont', '357 Rue dNULLAlgerie', 68230, 'ZIMMERBACH', NULL, NULL, NULL),
(35, 'Matilde', 'Mercier', '63 Boulevard guesde ', 2810, 'LICY-CLIGNON', NULL, NULL, 'matilde.mercier@orange.fr'),
(36, 'Ambrine', 'Lefevre', '270 Rampe chataigniers ', 86110, 'COUSSAY', NULL, NULL, 'ambrine.lefevre@aol.com'),
(37, 'Lia', 'Laurent', '75 Pont ripollet ', 3800, 'GANNAT', NULL, NULL, 'lia.laurent@fastmail.com'),
(38, 'Fanta', 'Lambert', '114 Esplanade Cours du General-Giraud', 1320, 'CRANS', NULL, NULL, NULL),
(39, 'Soumaya', 'Garnier', '190 Mail gaulle ', 79110, 'LOUBILLE', NULL, NULL, NULL),
(40, 'Abdel', 'Garnier', '176 Impasse brel ', 10500, 'MORVILLIERS', NULL, '02 37 26 27 57', 'abdel.garnier@outlook.com'),
(41, 'Miguel', 'Andre', '242 Cour anglaise coteaux ', 2300, 'AUDIGNICOURT', NULL, '07 49 61 60 65', 'miguel.andre@free.fr'),
(42, 'Nelia', 'Garcia', '166 Quai copernic ', 24390, 'TOURTOIRAC', NULL, '06 35 46 40 78', 'nelia.garcia@gmail.com'),
(43, 'Yaron', 'Martin', '123 Boulevard Route de Genas', 71150, 'CHAUDENAY', NULL, '03 86 59 37 95', 'yaron.martin@mail.com'),
(44, 'Melissa', 'Mathieu', '127 Place Pierre-Audry', 72400, 'AVEZE', NULL, '05 51 70 26 43', 'melissa.mathieu@free.fr'),
(45, 'Carine', 'Rousseau', '383 Chemin bastie ', 40510, 'SEIGNOSSE', NULL, '02 10 85 53 88', 'carine.rousseau@sfr.fr'),
(46, 'Johann', 'Dubois', '310 Place chesnaie ', 72510, 'SAINT-JEAN-DE-LA-MOTTE', NULL, '05 46 53 75 60', 'johann.dubois@hotmail.fr'),
(47, 'Jaden', 'Perrin', '3, rue de Paris', 51480, 'POURCY', NULL, '02 64 45 52 87', 'jaden.perrin@outlook.com'),
(48, 'Louay', 'Fontaine', '296 Rue de la Boucle', 14220, 'GRIMBOSQ', NULL, '03 96 14 68 74', 'louay.fontaine@free.fr'),
(49, 'Ronan', 'Clement', '19 Boulevard debussy ', 1110, 'CORCELLES', NULL, '07 91 74 63 81', 'ronan.clement@yahoo.fr'),
(50, 'LÃ©a', 'Durand', '32 rue de la paix', 24380, 'SAINT-AMAND-DE-VERGT', NULL, '03 48 42 52 37', 'lea.durand@gmail.com'),
(51, 'Marlon', 'Blanc', '351 Cite saint-saens ', 71460, 'GENOUILLY', NULL, '06 60 40 30 10', 'marlon.blanc@gmail.com'),
(52, 'Xavier', 'Lefebvre', '66 Grand-route de lNULLAnnonciade', 42660, 'TARENTAISE', NULL, '05 55 79 22 63', 'xavier.lefebvre@gmail.com'),
(53, 'Riad', 'Muller', '440 Anse pompidou ', 37550, 'SAINT-AVERTIN', NULL, NULL, NULL),
(54, 'Boris', 'Muller', '371 Rang gandhi ', 59146, 'PECQUENCOURT', NULL, '01 48 53 56 30', 'boris.muller@outlook.com'),
(55, 'Angelina', 'Durand', '233 Chemin poincare ', 28240, 'VAUPILLON', NULL, NULL, NULL),
(56, 'Bastien', 'Laurent', '62 Traboule ecole du bois ', 71270, 'LAYS-SUR-LE-DOUBS', NULL, NULL, NULL),
(57, 'Lior', 'Roussel', '328 Ruelle de lNULLAnnonciade', 14600, 'EQUEMAUVILLE', NULL, NULL, NULL),
(58, 'James', 'Richard', '141 Rampe de la Barre', 52310, 'ORMOY-LES-SEXFONTAINES', NULL, NULL, NULL),
(59, 'June', 'Lopez', '150 Boulevard piece du moulin ', 50340, 'SAINT-GERMAIN-LE-GAILLARD', NULL, NULL, NULL),
(60, 'Mina', 'Andre', '450 Dreve pompidou ', 18230, 'SAINT-DOULCHARD', NULL, NULL, NULL),
(61, 'Mouhamed', 'Bonnet', '236 Montee philipe ', 70190, 'LA BARRE', NULL, NULL, NULL),
(62, 'Sasha', 'Chevalier', '160 Traverse grandmont ', 88450, 'VINCEY', NULL, '01 80 60 22 15', 'sasha.chevalier@gmail.com'),
(63, 'Shirel', 'Andre', '268 Sente voillot ', 51320, 'HUMBAUVILLE', NULL, '07 72 97 20 88', 'shirel.andre@legrand.com'),
(64, 'Ari', 'Mathieu', '272 Traverse chiron ', 43430, 'CHAUDEYROLLES', NULL, '04 77 31 49 80', 'ari.mathieu@gmail.com'),
(65, 'Farah', 'Dumont', '180 Impasse dNULLAguesseau', 11220, 'LABASTIDE-EN-VAL', NULL, '03 30 74 19 51', 'farah.dumont@hotmail.com'),
(66, 'Youssouf', 'Durand', '189 Rue coty ', 17270, 'CERCOUX', NULL, '05 56 61 37 42', 'youssouf.durand@hotmail.com'),
(67, 'Arman', 'Fournier', '159 Placette Grenette', 74130, 'FAUCIGNY', NULL, NULL, NULL),
(68, 'Romain', 'Durand', '495 Venelle du B?uf', 60690, 'ACHY', NULL, '05 27 68 63 73', 'romain.durand@outlook.com'),
(69, 'Levana', 'Chevalier', '225 Anse eluard ', 61110, 'CONDEAU', NULL, NULL, NULL),
(70, 'Lirone', 'Gauthier', '100 Descente Barrier', 70120, 'THEULEY', NULL, NULL, NULL),
(71, 'Eleanor', 'Bertrand', '242 Cour anglaise girard ', 85180, 'CHATEAU-DNULLOLONNE', NULL, '05 37 84 40 30', 'eleanor.bertrand@airbusgroup.com'),
(72, 'Lauren', 'Lambert', '187 Ruelle malraux ', 24700, 'SAINT-BARTHELEMY-DE-BELLEGARDE', NULL, NULL, NULL);

-- --------------------------------------------------------
--
-- Structure de la table Courriers
--

CREATE TABLE Courriers (
  id_campagne varchar(10) not NULL,
    id_personne integer not NULL,
      undelivered date,
        primary key(id_campagne, id_personne),
	  constraint KEYCourriersIdPersonne foreign key(id_personne) references Personnes(id_personne),
	    constraint KEYCourriersIdCampagne foreign key(id_campagne) references Campagnes(id_campagne)
	    ) ENGINE=InnoDB;

--
-- Contenu de la table Courriers
--

INSERT INTO Courriers (id_campagne, id_personne, undelivered) VALUES
('M-06-2015', 3, '2015-05-05'),
('M-06-2015', 5, NULL),
('M-06-2015', 6, NULL),
('M-06-2015', 8, NULL),
('M-06-2015', 9, NULL),
('M-06-2015', 10, NULL),
('M-06-2015', 11, NULL),
('M-06-2015', 12, NULL),
('M-06-2015', 13, NULL),
('M-06-2015', 14, NULL),
('M-06-2015', 15, NULL),
('M-06-2015', 16, NULL),
('M-06-2015', 17, NULL),
('M-06-2015', 18, '2015-05-05'),
('M-06-2015', 19, '2015-05-05'),
('M-06-2015', 20, NULL),
('M-06-2015', 21, NULL),
('M-06-2015', 22, NULL),
('M-06-2015', 23, NULL),
('M-06-2015', 24, '2015-05-06'),
('M-06-2015', 25, NULL),
('M-06-2015', 26, NULL),
('M-06-2015', 27, NULL),
('M-06-2015', 28, NULL),
('M-06-2015', 29, NULL),
('M-06-2015', 30, NULL),
('M-06-2015', 31, NULL),
('M-06-2015', 32, '2015-05-06'),
('M-06-2015', 33, NULL),
('M-06-2015', 34, '2015-05-06'),
('M-06-2015', 35, NULL),
('M-06-2015', 36, NULL),
('M-06-2015', 37, NULL),
('M-06-2015', 40, NULL),
('M-06-2015', 41, NULL),
('M-06-2015', 42, NULL),
('M-06-2015', 43, NULL),
('M-06-2015', 44, NULL),
('M-06-2015', 45, NULL),
('M-06-2015', 46, NULL),
('M-06-2015', 47, NULL),
('M-06-2015', 48, NULL),
('M-06-2015', 49, NULL),
('M-06-2015', 50, NULL),
('M-06-2015', 51, NULL),
('M-06-2015', 52, NULL),
('M-06-2015', 54, NULL),
('REC-2015', 1, NULL),
('REC-2015', 2, NULL),
('REC-2015', 3, NULL),
('REC-2015', 4, '2016-03-02'),
('REC-2015', 5, NULL),
('REC-2015', 6, NULL),
('REC-2015', 7, NULL),
('REC-2015', 8, NULL),
('REC-2015', 38, NULL),
('REC-2015', 39, NULL),
('REC-2015', 40, NULL),
('REC-2015', 41, NULL),
('REC-2015', 42, NULL),
('REC-2015', 43, NULL),
('REC-2015', 44, NULL),
('REC-2015', 45, NULL),
('REC-2015', 46, NULL),
('REC-2015', 47, NULL),
('REC-2015', 48, NULL),
('REC-2015', 49, NULL),
('REC-2015', 50, NULL),
('REC-2015', 51, NULL),
('REC-2015', 52, NULL),
('REC-2015', 53, NULL),
('REC-2015', 54, NULL),
('M-05-2016', 1, NULL),
('M-05-2016', 2, NULL),
('M-05-2016', 3, NULL),
('M-05-2016', 5, NULL),
('M-05-2016', 6, NULL),
('M-05-2016', 7, NULL),
('M-05-2016', 8, NULL),
('M-05-2016', 9, NULL),
('M-05-2016', 10, NULL),
('M-05-2016', 11, NULL),
('M-05-2016', 12, NULL),
('M-05-2016', 13, NULL),
('M-05-2016', 14, NULL),
('M-05-2016', 15, NULL),
('M-05-2016', 16, NULL),
('M-05-2016', 17, NULL),
('M-05-2016', 18, NULL),
('M-05-2016', 19, NULL),
('M-05-2016', 20, NULL),
('M-05-2016', 21, NULL),
('M-05-2016', 22, NULL),
('M-05-2016', 23, NULL),
('M-05-2016', 24, NULL),
('M-05-2016', 25, NULL),
('M-05-2016', 26, NULL),
('M-05-2016', 27, NULL),
('M-05-2016', 28, NULL),
('M-05-2016', 29, NULL),
('M-05-2016', 30, NULL),
('M-05-2016', 31, NULL),
('M-05-2016', 32, NULL),
('M-05-2016', 33, NULL),
('M-05-2016', 34, NULL),
('M-05-2016', 35, NULL),
('M-05-2016', 36, NULL),
('M-05-2016', 37, NULL),
('M-05-2016', 38, NULL),
('M-05-2016', 39, NULL),
('M-05-2016', 40, NULL),
('M-05-2016', 41, NULL),
('M-05-2016', 42, NULL),
('M-05-2016', 43, NULL),
('M-05-2016', 44, NULL),
('M-05-2016', 45, NULL),
('M-05-2016', 46, NULL),
('M-05-2016', 47, NULL),
('M-05-2016', 48, NULL),
('M-05-2016', 49, NULL),
('M-05-2016', 50, NULL),
('M-05-2016', 51, NULL),
('M-05-2016', 52, NULL),
('M-05-2016', 53, NULL),
('M-05-2016', 54, NULL),
('M-05-2016', 55, NULL),
('M-05-2016', 56, NULL),
('M-05-2016', 57, NULL),
('M-05-2016', 58, NULL),
('M-05-2016', 59, NULL),
('M-05-2016', 60, NULL),
('M-05-2016', 61, NULL),
('M-05-2016', 62, NULL),
('M-05-2016', 63, NULL),
('M-05-2016', 64, NULL),
('M-05-2016', 65, NULL),
('M-05-2016', 66, NULL);

-- --------------------------------------------------------

--
-- Structure de la table Dons
--

CREATE TABLE Dons (
  id_don integer primary key auto_increment,
    Montant integer not NULL,
      DateDon date not NULL,
        DateEnvoiRecu date,
	  id_personne integer not NULL,
	    id_campagne varchar(10)
	    ) ENGINE=InnoDB;

--
-- Contenu de la table Dons
--

INSERT INTO Dons (id_don, Montant, DateDon, DateEnvoiRecu, id_personne, id_campagne) VALUES
(1, 100, '2015-01-06', '2016-02-25', 1, NULL),
(2, 30, '2015-01-19', '2016-02-25', 2, NULL),
(3, 30, '2015-01-22', '2016-02-25', 3, NULL),
(4, 30, '2015-01-24', '2016-02-25', 4, NULL),
(5, 40, '2015-03-03', '2016-02-25', 5, NULL),
(6, 20, '2015-03-03', '2016-02-25', 6, NULL),
(7, 15, '2015-03-23', '2016-02-25', 7, NULL),
(8, 25, '2015-04-28', '2016-02-25', 8, NULL),
(9, 10, '2015-05-07', '2016-02-25', 38, NULL),
(10, 50, '2015-05-09', '2016-02-25', 39, NULL),
(11, 20, '2015-05-12', '2016-02-25', 40, 'M-06-2015'),
(12, 15, '2015-05-19', '2016-02-25', 41, 'M-06-2015'),
(13, 25, '2015-05-26', '2016-02-25', 42, NULL),
(14, 25, '2015-06-03', '2016-02-25', 43, 'M-06-2015'),
(15, 15, '2015-06-17', '2016-02-25', 44, 'M-06-2015'),
(16, 10, '2015-06-17', '2016-02-25', 45, 'M-06-2015'),
(17, 20, '2015-06-30', '2016-02-25', 46, NULL),
(18, 15, '2015-07-08', '2016-02-25', 47, 'M-06-2015'),
(19, 20, '2015-07-13', '2016-02-25', 48, NULL),
(20, 10, '2015-08-20', '2016-02-25', 49, 'M-06-2015'),
(21, 15, '2015-08-31', '2016-02-25', 50, NULL),
(22, 10, '2015-11-07', '2016-02-25', 51, 'M-06-2015'),
(23, 40, '2015-11-07', '2016-02-25', 52, NULL),
(24, 50, '2015-11-07', '2016-02-25', 53, NULL),
(25, 20, '2015-11-29', '2016-02-25', 2, NULL),
(26, 50, '2015-11-29', '2016-02-25', 54, NULL),
(27, 100, '2016-03-02', NULL, 1, 'REC-2015'),
(28, 30, '2016-03-02', NULL, 3, 'REC-2015'),
(29, 20, '2016-03-05', NULL, 4, NULL),
(30, 20, '2016-03-05', NULL, 5, 'REC-2015'),
(31, 30, '2016-06-06', NULL, 6, 'REC-2015'),
(32, 25, '2016-03-15', NULL, 8, 'REC-2015'),
(33, 50, '2016-03-15', NULL, 39, 'REC-2015'),
(34, 20, '2016-03-20', NULL, 40, 'REC-2015'),
(35, 30, '2016-03-20', NULL, 41, NULL),
(36, 30, '2016-03-23', NULL, 42, 'REC-2015'),
(37, 30, '2016-04-16', NULL, 44, 'REC-2015'),
(38, 15, '2016-04-29', NULL, 50, 'REC-2015'),
(39, 10, '2016-07-07', NULL, 51, 'REC-2015'),
(40, 30, '2016-10-20', NULL, 52, 'REC-2015'),
(41, 30, '2016-08-19', NULL, 54, 'REC-2015'),
(42, 40, '2016-03-23', NULL, 55, NULL),
(43, 20, '2016-04-01', NULL, 56, NULL),
(44, 15, '2016-04-03', NULL, 57, NULL),
(45, 25, '2016-04-06', NULL, 58, NULL),
(46, 30, '2016-04-13', NULL, 59, NULL),
(47, 50, '2016-04-20', NULL, 60, NULL),
(48, 20, '2016-04-28', NULL, 61, NULL),
(49, 15, '2016-05-12', NULL, 62, 'M-05-2016'),
(50, 100, '2016-05-12', NULL, 63, 'M-05-2016'),
(51, 25, '2016-05-25', NULL, 64, 'M-05-2016'),
(52, 15, '2016-06-02', NULL, 65, 'M-05-2016'),
(53, 10, '2016-06-02', NULL, 66, 'M-05-2016'),
(54, 10, '2016-06-04', NULL, 45, 'M-05-2016'),
(55, 20, '2016-06-04', NULL, 46, 'M-05-2016'),
(56, 15, '2016-06-07', NULL, 47, 'M-05-2016'),
(57, 20, '2016-06-10', NULL, 48, 'M-05-2016'),
(58, 10, '2016-06-11', NULL, 49, 'M-05-2016'),
(59, 15, '2016-06-11', NULL, 50, 'M-05-2016'),
(60, 10, '2016-06-15', NULL, 51, 'M-05-2016'),
(61, 40, '2016-06-22', NULL, 52, 'M-05-2016'),
(62, 20, '2016-07-15', NULL, 67, NULL),
(63, 15, '2016-07-20', NULL, 68, NULL),
(64, 40, '2016-10-02', NULL, 55, 'M-05-2016'),
(65, 20, '2016-10-02', NULL, 56, 'M-05-2016'),
(66, 20, '2016-10-02', NULL, 69, NULL),
(67, 10, '2016-10-02', NULL, 70, NULL),
(68, 15, '2016-10-02', NULL, 71, NULL),
(69, 10, '2016-10-24', NULL, 72, NULL);

--
-- Modification des clÃ©s Ã©trangÃ¨res par des ALTER
--

ALTER TABLE Dons ADD constraint KEYDonsIdPersonne foreign key(id_personne) references Personnes(id_personne);
ALTER TABLE Dons ADD constraint KEYDonsIdCampagne foreign key(id_campagne) references Campagnes(id_campagne);
