/*==============================================================*/
/* Tabla de usuarios                                     */
/*==============================================================*/

create table USUARIOS (
   ID                   int                  identity,
   USUARIO              varchar(100)         not null,
   PASSWORD             varchar(100)         not null,
   CORREO               varchar(100)         null,
   FECHAREGISTRO        datetime             null,
   TELEFONO             varchar(10) NULL,
   FECHANACIMIENTO     datetime NULL,
   constraint PK_USUARIOS primary key (ID)
)
go

create index INDEX_USUARIO on USUARIOS (
ID DESC
)
go

/*==============================================================*/
/* Tabla de productos                                        */
/*==============================================================*/

create table PRODUCTO (
   IDPRODUCTO           int                  identity,
   SKU                  varchar(100)         null,
   NOMBRE               varchar(100)         not null,
   CANTIDAD             int                  not null,
   PRECIO               decimal(11,2)        not null,
   DESCRIPCION          varchar(300)         null,
   IMAGEN               varbinary(max)       null,
   FECHAREGISTRO        datetime             null,
   
   constraint PK_PRODUCTO primary key (IDPRODUCTO)
)
go


create index INDEX_PRODUCTO on PRODUCTO (
IDPRODUCTO DESC
)
go






/*==============================================================*/
/* Datos de Usuario                                       */
/*==============================================================*/



INSERT INTO [dbo].[USUARIOS] ([usuario],[password],[correo],[FECHAREGISTRO], telefono, fechanacimiento) VALUES ('admin','1234','admin@mail.com',GETDATE(),'22222222',DATEADD(YEAR,-22,GETDATE()) )
INSERT INTO [dbo].[USUARIOS] ([usuario],[password],[correo],[FECHAREGISTRO], telefono, fechanacimiento) VALUES ('Lucy','RTI24XMS8HA','ultrices.mauris@pharetra.edu',GETDATE(),'22222222',DATEADD(YEAR,-22,GETDATE()))
INSERT INTO [dbo].[USUARIOS] ([usuario],[password],[correo],[FECHAREGISTRO], telefono, fechanacimiento) VALUES ('Dennis','FBO30DDU8OQ','erat@euaccumsan.edu',GETDATE(),'22222222',DATEADD(YEAR,-22,GETDATE()))
INSERT INTO [dbo].[USUARIOS] ([usuario],[password],[correo],[FECHAREGISTRO], telefono, fechanacimiento) VALUES ('Kathleen','WBC52OSC9BH','diam@veliteu.co.uk',GETDATE(),'22222222',DATEADD(YEAR,-22,GETDATE()))
INSERT INTO [dbo].[USUARIOS] ([usuario],[password],[correo],[FECHAREGISTRO], telefono, fechanacimiento) VALUES ('Deacon','YFB07BBZ9LG','elit.fermentum@ametmassa.net',GETDATE(),'22222222',DATEADD(YEAR,-22,GETDATE()))
INSERT INTO [dbo].[USUARIOS] ([usuario],[password],[correo],[FECHAREGISTRO], telefono, fechanacimiento) VALUES ('Kareem','LKR60DBO6UT','tincidunt.tempus.risus@Cras.org',GETDATE(),'22222222',DATEADD(YEAR,-22,GETDATE()))
INSERT INTO [dbo].[USUARIOS] ([usuario],[password],[correo],[FECHAREGISTRO], telefono, fechanacimiento) VALUES ('Rina','NZT94RUR8OB','In@enim.com',GETDATE(),'22222222',DATEADD(YEAR,-22,GETDATE()))
INSERT INTO [dbo].[USUARIOS] ([usuario],[password],[correo],[FECHAREGISTRO], telefono, fechanacimiento) VALUES ('Nita','XVU16ZTG2LX','nunc@magnisdisparturient.co.uk',GETDATE(),'22222222',DATEADD(YEAR,-22,GETDATE()))
INSERT INTO [dbo].[USUARIOS] ([usuario],[password],[correo],[FECHAREGISTRO], telefono, fechanacimiento) VALUES ('Zelda','YXX91NRO5GC','imperdiet@Loremipsum.ca',GETDATE(),'22222222',DATEADD(YEAR,-22,GETDATE()))
INSERT INTO [dbo].[USUARIOS] ([usuario],[password],[correo],[FECHAREGISTRO], telefono, fechanacimiento) VALUES ('Mia','PQL54AUO5YB','non.luctus@rutrummagnaCras.org',GETDATE(),'22222222',DATEADD(YEAR,-22,GETDATE()));



/*==============================================================*/
/* Datos de Producto                                       */
/*==============================================================*/


INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('P4X-1F4','PRODUCTO NUMERO 1',5,'7.41','Lorem',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('S9Q-7O7','PRODUCTO NUMERO 2',12,'95.71','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('J2T-3L9','PRODUCTO NUMERO 3',4,'63.84','Lorem ipsum',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('V1P-5E5','PRODUCTO NUMERO 4',1,'79.27','Lorem ipsum dolor sit amet,',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('X4B-8I7','PRODUCTO NUMERO 5',11,'78.64','Lorem ipsum dolor sit amet, consectetuer adipiscing',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('N5L-7R5','PRODUCTO NUMERO 6',15,'37.00','Lorem ipsum dolor sit amet, consectetuer adipiscing',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('H5F-4L6','PRODUCTO NUMERO 7',1,'76.10','Lorem ipsum dolor sit amet, consectetuer',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('P1N-8G6','PRODUCTO NUMERO 8',15,'54.84','Lorem ipsum dolor sit amet, consectetuer',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('G4S-3O6','PRODUCTO NUMERO 9',4,'52.97','Lorem ipsum dolor',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('M1Q-5X7','PRODUCTO NUMERO 10',12,'49.51','Lorem ipsum',GETDATE());
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('D6T-6F5','PRODUCTO NUMERO 11',11,'67.62','Lorem ipsum dolor sit',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Z7L-3P9','PRODUCTO NUMERO 12',4,'90.76','Lorem ipsum dolor sit amet, consectetuer adipiscing',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('D4R-1W7','PRODUCTO NUMERO 13',7,'70.89','Lorem ipsum dolor sit amet, consectetuer adipiscing',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('A6G-4D2','PRODUCTO NUMERO 14',17,'15.38','Lorem ipsum',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('F3B-3Q2','PRODUCTO NUMERO 15',13,'94.76','Lorem ipsum dolor sit amet,',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('U5F-4G2','PRODUCTO NUMERO 16',18,'43.61','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Z4J-0T4','PRODUCTO NUMERO 17',10,'79.41','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('D8M-9M6','PRODUCTO NUMERO 18',3,'38.40','Lorem ipsum dolor sit amet, consectetuer',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Y3U-7V4','PRODUCTO NUMERO 19',6,'66.36','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('T0R-1G5','PRODUCTO NUMERO 20',15,'62.37','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',GETDATE());
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Q2P-6N1','PRODUCTO NUMERO 21',10,'34.68','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('J0N-1W6','PRODUCTO NUMERO 22',4,'31.94','Lorem ipsum dolor sit',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Q8S-7W4','PRODUCTO NUMERO 23',8,'80.25','Lorem ipsum dolor sit amet, consectetuer',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('W1M-4N6','PRODUCTO NUMERO 24',14,'72.16','Lorem ipsum dolor',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Y1A-6V7','PRODUCTO NUMERO 25',14,'63.68','Lorem ipsum dolor sit amet, consectetuer adipiscing',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('L8P-3K2','PRODUCTO NUMERO 26',10,'78.58','Lorem ipsum dolor',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('N8X-4A8','PRODUCTO NUMERO 27',6,'20.40','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('D1D-3R3','PRODUCTO NUMERO 28',18,'53.65','Lorem ipsum',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('V3Z-4B6','PRODUCTO NUMERO 29',1,'50.58','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('W2R-9C4','PRODUCTO NUMERO 30',20,'86.06','Lorem ipsum dolor sit amet,',GETDATE());
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Z7I-6A6','PRODUCTO NUMERO 31',1,'4.13','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('U6Y-9T3','PRODUCTO NUMERO 32',4,'51.23','Lorem ipsum dolor sit amet,',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('W4F-9A5','PRODUCTO NUMERO 33',9,'96.73','Lorem ipsum',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('B0F-7Y6','PRODUCTO NUMERO 34',12,'33.17','Lorem ipsum dolor sit amet, consectetuer',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('U7C-9X8','PRODUCTO NUMERO 35',1,'18.31','Lorem ipsum dolor sit',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('F9R-3O5','PRODUCTO NUMERO 36',1,'63.48','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Y9P-7X6','PRODUCTO NUMERO 37',6,'95.12','Lorem ipsum dolor sit amet,',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('N4G-4Y3','PRODUCTO NUMERO 38',3,'83.93','Lorem ipsum dolor sit',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('B3Y-6Y1','PRODUCTO NUMERO 39',8,'51.77','Lorem ipsum dolor sit amet, consectetuer',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('B8W-9K2','PRODUCTO NUMERO 40',3,'50.44','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed',GETDATE());
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('O3W-6J1','PRODUCTO NUMERO 41',13,'84.05','Lorem ipsum dolor sit',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Q5N-3U8','PRODUCTO NUMERO 42',4,'85.13','Lorem',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('M1R-4Y7','PRODUCTO NUMERO 43',3,'91.44','Lorem ipsum',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('G4E-9F0','PRODUCTO NUMERO 44',9,'83.04','Lorem ipsum dolor sit amet,',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('U8L-9L4','PRODUCTO NUMERO 45',20,'17.26','Lorem ipsum',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('I4V-2X8','PRODUCTO NUMERO 46',1,'98.72','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('O5E-4M1','PRODUCTO NUMERO 47',18,'70.76','Lorem',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('B7Z-3S6','PRODUCTO NUMERO 48',4,'79.45','Lorem ipsum dolor',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('B6L-7W4','PRODUCTO NUMERO 49',4,'93.31','Lorem ipsum dolor sit amet, consectetuer adipiscing',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('N2O-8B1','PRODUCTO NUMERO 50',4,'52.59','Lorem ipsum dolor sit amet, consectetuer',GETDATE());
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('D1N-1Z9','PRODUCTO NUMERO 51',12,'62.37','Lorem ipsum dolor',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('F6M-5Y9','PRODUCTO NUMERO 52',2,'2.84','Lorem ipsum dolor',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('S4J-9Y6','PRODUCTO NUMERO 53',2,'98.48','Lorem ipsum dolor sit amet, consectetuer adipiscing',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('U3N-7Y8','PRODUCTO NUMERO 54',12,'41.80','Lorem ipsum dolor',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('H8S-6I8','PRODUCTO NUMERO 55',1,'76.72','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('G6M-9I7','PRODUCTO NUMERO 56',7,'21.21','Lorem ipsum dolor sit',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Z7Q-5K6','PRODUCTO NUMERO 57',19,'59.22','Lorem ipsum',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('F4O-5I0','PRODUCTO NUMERO 58',8,'76.29','Lorem ipsum dolor',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Q3H-4Z5','PRODUCTO NUMERO 59',19,'58.29','Lorem ipsum dolor sit',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('N3X-8O3','PRODUCTO NUMERO 60',16,'71.45','Lorem ipsum dolor',GETDATE());
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('P5X-6E9','PRODUCTO NUMERO 61',19,'59.36','Lorem ipsum dolor sit amet, consectetuer',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('G9J-5K0','PRODUCTO NUMERO 62',4,'58.99','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('X1C-3S1','PRODUCTO NUMERO 63',8,'95.93','Lorem ipsum dolor sit',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('A3B-4R2','PRODUCTO NUMERO 64',16,'36.68','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('X1S-5T1','PRODUCTO NUMERO 65',7,'79.04','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('E7I-0N1','PRODUCTO NUMERO 66',17,'33.11','Lorem ipsum dolor sit amet, consectetuer',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('S3W-5S3','PRODUCTO NUMERO 67',11,'32.77','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Y8V-1R1','PRODUCTO NUMERO 68',8,'58.62','Lorem ipsum',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Y2R-7W7','PRODUCTO NUMERO 69',15,'76.80','Lorem ipsum dolor sit amet,',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('W8P-9W9','PRODUCTO NUMERO 70',19,'75.71','Lorem ipsum',GETDATE());
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('H6H-8I8','PRODUCTO NUMERO 71',4,'93.31','Lorem ipsum dolor sit amet,',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Y0P-9O7','PRODUCTO NUMERO 72',20,'3.16','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('K0W-9Q1','PRODUCTO NUMERO 73',12,'18.03','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('U7C-1X7','PRODUCTO NUMERO 74',2,'13.23','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('W0X-5T6','PRODUCTO NUMERO 75',8,'69.71','Lorem',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('P2Y-6P9','PRODUCTO NUMERO 76',3,'1.32','Lorem ipsum dolor sit amet, consectetuer adipiscing',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('P9Q-3P9','PRODUCTO NUMERO 77',12,'50.26','Lorem ipsum dolor',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('X2A-4B6','PRODUCTO NUMERO 78',17,'88.88','Lorem ipsum dolor sit',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Z9C-4P5','PRODUCTO NUMERO 79',4,'46.70','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Q8M-8R9','PRODUCTO NUMERO 80',20,'60.77','Lorem',GETDATE());
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('O3N-6G0','PRODUCTO NUMERO 81',20,'58.12','Lorem ipsum dolor',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('X6V-6K1','PRODUCTO NUMERO 82',19,'78.87','Lorem',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('A7O-8B5','PRODUCTO NUMERO 83',6,'46.57','Lorem',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('N5S-8Q1','PRODUCTO NUMERO 84',4,'35.13','Lorem ipsum dolor sit amet, consectetuer',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('M4C-9Y9','PRODUCTO NUMERO 85',9,'6.83','Lorem ipsum dolor sit amet,',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('V8F-1W1','PRODUCTO NUMERO 86',11,'86.71','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('N0H-3C4','PRODUCTO NUMERO 87',9,'89.49','Lorem ipsum',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('S3L-6I0','PRODUCTO NUMERO 88',19,'87.50','Lorem',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Y2J-9K3','PRODUCTO NUMERO 89',6,'16.51','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('W0X-5Y1','PRODUCTO NUMERO 90',6,'40.03','Lorem ipsum dolor',GETDATE());
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('A3R-4K9','PRODUCTO NUMERO 91',14,'58.84','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('M6Y-4F4','PRODUCTO NUMERO 92',13,'63.20','Lorem',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('N2J-3P3','PRODUCTO NUMERO 93',4,'45.71','Lorem ipsum dolor sit amet, consectetuer adipiscing',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Q8I-7B2','PRODUCTO NUMERO 94',4,'44.91','Lorem ipsum dolor sit amet,',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('O9Z-3F8','PRODUCTO NUMERO 95',9,'37.51','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('K4Z-1J3','PRODUCTO NUMERO 96',3,'45.69','Lorem ipsum',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('P3P-5F4','PRODUCTO NUMERO 97',15,'67.85','Lorem ipsum dolor',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('T1T-8O5','PRODUCTO NUMERO 98',1,'4.15','Lorem ipsum dolor sit amet,',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('Q8O-7T1','PRODUCTO NUMERO 99',15,'41.40','Lorem ipsum',GETDATE())
INSERT INTO producto([Sku],[Nombre],[cantidad],[precio],[descripcion],[fecharegistro]) VALUES('W0W-5T9','PRODUCTO NUMERO 100',5,'81.66','Lorem ipsum dolor sit',GETDATE());

