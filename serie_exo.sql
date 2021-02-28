create database week_end ;
use week_end;

create table  Representation(
Num_Rep int(8) auto_increment primary key,
titre_Rep varchar(50),
lieu varchar (50)
);
insert into  Representation ( Num_Rep,titre_Rep,lieu) value 
	('1', 'annees80', 'théâtre JCC '), 
	('2', 'annees90', 'Bataclan'), 
    ('3', 'annees2000', 'Bercy'),
    ('4', 'annees2010', 'Olympia'),
    ('5', 'anneesDisco', 'Bataclan'),
    ('6', 'annees2010', 'Bercy'),
    ('7', 'annees2000', 'théâtre JCC '),
    ('8', 'anneesDisco', 'LaCigale'),
    ('9', 'annees80', 'BoMartin'),
    ('10', 'annees90', 'Bercy'),
    ('11', 'annees2010', 'théâtre JCC '),
    ('12', 'annees90', 'Bataclan'),
    ('13', 'annees70', 'Bercy'),
    ('14', 'annees2000', 'théâtre JCC '),
    ('15', 'BestOfEver', 'Olympia ')
;
select* from Representation ;


create table Musicien (
Num_mus int(8) auto_increment primary key,
nom varchar(50),
Num_Rep int (8),
constraint fk_num_rep foreign key (Num_Rep) references Representation (Num_Rep)
);
ALTER TABLE Musicien
DROP FOREIGN KEY fk_num_rep ;
insert into  Musicien ( Num_mus,nom,Num_Rep) value 
('1','MPokora','1'),
('2','Nolwen_Le_Roy','1'),
('3','Stromae','2'),
('4','Celine_Dion','15'),
('5','Goldman','15'),
('6','Corneille','1'),
('7','Adamo','3'),
('8','Cabrel','4'),
('9','Indila','5'),
('10','Kendji','6'),
('11','Amel_Bent','7'),
('12','Patricia_Kaas','8'),
('13','Bruel','9'),
('14','Pagny','10'),
('15','Christophe_Maé','11'),
('16','Obispo','12'),
('17','Vianney','7'),
('18','Jennifer','13'),
('19','Garou','15'),
('20','Eddy_Michel','4'),
('21','Slimane','14'),
('22','Vitaa','14'),
('23','Louane','6'),
('24','Black_M','5');



select*from Musicien;

create table Programmer (
Date varchar (15) ,
Num_Rep int(8) auto_increment primary key,
tarif varchar (10)
);

insert into  Programmer ( Date,Num_Rep,tarif) value 
	('28/02/2021', '1', '10 '), 
	('01/03/2021', '2', '20 '), 
    ('05/03/2021', '3', ' 30'), 
    ('28/02/2021', '4', ' 40'), 
    ('01/03/2021', '5', '50 '), 
    ('28/02/2021', '6', '10 '), 
    ('01/03/2021', '7', ' 20'), 
    ('28/02/2021', '8', '30 '), 
    ('01/03/2021', '9', '10 '), 
    ('05/03/2021', '10', '20 '), 
    ('28/02/2021', '11', '30 '), 
    ('01/03/2021', '12', '10 '), 
    ('05/03/2021', '13', '20 '), 
    ('28/02/2021', '14', ' 30'), 
    ('01/03/2021', '15', ' 30')
    
;

select*from Programmer;
alter table Programmer add constraint fk_num_rep_musicien foreign key (Num_Rep) references  Musicien (Num_Rep);

ALTER TABLE Programmer
DROP FOREIGN KEY fk_num_rep_musicien ;

#Les  requetes

#1- La liste des titres des représentations.
select titre_Rep from  Representation;

#2 La liste des titres des représentations ayant lieu au « théâtre JCC »
select  titre_Rep from  Representation where lieu like 'théâtre JCC ' ;

#3liste des noms des musiciens titres des représentations auxquelles ils participent.

SELECT Musicien.nom , Representation.titre_Rep
FROM Musicien
INNER JOIN  Representation
on Musicien.Num_Rep =  Representation.Num_Rep and  Representation.Num_Rep =15; 
    
----------#4 - La liste des titres des représentations, les lieux et les tarifs du 28/02/2021.
SELECT Representation.titre_Rep,Representation.lieu,Programmer.tarif
FROM Programmer
INNER JOIN  Representation
on Programmer.Num_Rep =  Representation.Num_Rep
where date like '28/02/2021'; 
 
#5 - Le nombre des musiciens qui participent à la représentations n°15
select *from Musicien where Num_Rep=15 ;
SELECT COUNT(nom) FROM Musicien where Num_rep=15;

#6 - Les représentations et leurs dates dont le tarif ne dépasse pas 30Euro
SELECT Representation.titre_Rep,Programmer.date
FROM Programmer
INNER JOIN  Representation
on Programmer.Num_Rep =  Representation.Num_Rep
where tarif<=10; 

#_______________________________________________EXERCICE2____________________________________________________________________________

create table Départements (
 DNO   int(30) auto_increment primary key,
 DNOM varchar (30) ,
 DIR  varchar (30),
 Ville varchar (30)
);

insert into Départements (DNO , DNOM,DIR,Ville) value 
('1','PRODUCTION','DIR_PROD','PARIS'),
('2','RH','DIR_RH','MARSEILLE'),
('3','ACHAT','DIR_ACHAT','LYON'),
('4','VENTE','DIR_VENTE','GRENOBLE'),
('5','MKG','DIR_MKG','TOULON'),
('6','RECHERCHE','DIR_RECH','MARSEILLE');
     


create table Employés (
		ENO  int (30) auto_increment primary key ,
        ENOM  varchar (30),
        PROF varchar (30),
        DATEEMB  date,
        COM int ,
        SAL  int,
        DNO  int (30),
        constraint fk_DNO foreign key (DNO) references Départements (DNO)
);

insert into Employés (ENO, ENOM,PROF, DATEEMB,COM, SAL, DNO  ) value
('1','pascal','vendeur','02-03-20','500','2000','4'),
('2','marcel','vendeur','03-04-20','700','2000','4'),
('3','jean','vendeur','05-06-20','900','2000','4'),
('4','amir','mkg','06-04-20','0','3000','5'),
('5','ingrid','mkg','07-07-20','0','4500','5'),
('6','rim','mkg','08-09-20','0','4000','5'),
('7','emmenuel','chercheur','10-12-20','0','8000','6'),
('8','audrey','chercheur','12-12-20','0','6000','6'),
('9','cedric','chercheur','07-07-20','0','5000','6'),
('10','moussa','prod','06-04-20','500','3000','1'),
('11','camille','prod','03-04-20','800','3500','1'),
('12','nadia','prod','02-01-21','900','4500','1'),
('13','sonia','achat','03-02-21','500','2500','3'),
('14','manju','achat','05-02-21','500','2100','3'),
('15','farah','rh','27-02-21','0','3500','2'),
('16','rimen','rh','20-02-21','0','4500','2');

select*from Départements ;
select*from  Employés;

#requetes
#1  liste des employés ayant une commission
select ENOM from Employés where COM != 0;

#2 noms, emplois et salaires des employés par salaire croissant, et pour chaque emploi, par salaire décroissant
select ENOM, SAL,PROF from Employés ORDER BY SAL asc ;
select PROF from Employés ORDER BY SAL DESC ;

# 3  le salaire moyen des employés
SELECT  avg(SAL) FROM Employés;

#4 Donnez le salaire moyen du département Production
SELECT avg(sal)
FROM Employés
WHERE DNO = 1;

#5Donnez les numéros de département et leur salaire maximum
SELECT DNO, max(sal) FROM Employés GROUP BY DNO ;

#6 Donnez les différentes professions et leur salaire moyen
select PROF, avg(sal) from Employés GROUP BY PROF;

#7
select  






