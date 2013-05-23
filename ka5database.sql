drop table PERSONS;

CREATE TABLE PERSONS(
ID int primary key,
fNAME varchar(80),
lNAME varchar(80),
CITY varchar(80),
STREET varchar(80),
ZIPCODE int,
PHONE varchar(20)
);

INSERT INTO PERSONS(ID, fNAME, lNAME, CITY, STREET, ZIPCODE, PHONE) VALUES 
 (0, 'Allan', 'Karlson','oslo', 'Hoeghbrogade 3, 2. th',555 ,'14785236'),
 (1, 'Laila', 'babette','kbh', 'Istedgade 2, 2. tv',5541,'45612345'),
 (2, 'Andreas', 'Andreasson','landet', 'ikke en lejlighed',2122 ,'88888852'),
 (4, 'Peter', 'leeeeez','køge', 'leasygade',0192,'88888888'),
 (5, 'Nu', 'trio n','berlin', 'Bes tbody, germany',9012,'888444555'),
 (6, 'Hugo', 'Chavez','carracas', 'Olievej 5',90210,'9'),
 (7, 'Hilda', 'giraffen','købh', 'Zoologisk have',9210, '12365478'),
 (8, 'Frodo', 'bagg','mordor', 'The shire',8210, '95135746'),
 (9, 'Harry', 'potter','York', 'hodwartzzz',1000, '85236974');

select * from PERSONS;