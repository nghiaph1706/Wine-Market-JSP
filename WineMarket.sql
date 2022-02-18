use master;
drop database WineMarket
GO

CREATE DATABASE WineMarket;
GO

USE WineMarket;

CREATE TABLE [Categories] (
  [CategoryId] int identity(1,1) NOT NULL,
  [Name] nvarchar(50) NOT NULL,
  PRIMARY KEY ([CategoryId])
);
GO

CREATE TABLE [Brands] (
  [BrandId] int identity(1,1) NOT NULL,
  [Name] nvarchar(50) NOT NULL,
  [CategoryId] int NOT NULL,
  PRIMARY KEY ([BrandId]),
  CONSTRAINT [FK_Brands.CategoryId]
    FOREIGN KEY ([CategoryId])
      REFERENCES [Categories]([CategoryId])
);
GO

CREATE TABLE [Users] (
  [UserId] int identity(1,1) NOT NULL,
  [Username] varchar(50) NOT NULL,
  [Password] varchar(30) NOT NULL,
  [Email] varchar(100) NOT NULL,
  [Role] bit NOT NULL,
  PRIMARY KEY ([UserId])
);
GO

CREATE TABLE [Products] (
  [ProductId] int identity(1,1) NOT NULL,
  [Name] nvarchar(100) NOT NULL,
  [Image] varchar(200) NOT NULL,
  [Price] float NOT NULL,
  [Alcohol] float NOT NULL,
  [Volume] float NOT NULL,
  [Origin] varchar(50) NOT NULL,
  [CategoryId] int NOT NULL,
  [BrandId] int NOT NULL,
  PRIMARY KEY ([ProductId]),
  CONSTRAINT [FK_Products.CategoryId]
    FOREIGN KEY ([CategoryId])
      REFERENCES [Categories]([CategoryId]),
  CONSTRAINT [FK_Products.BrandId]
    FOREIGN KEY ([BrandId])
      REFERENCES [Brands]([BrandId])
);
GO

CREATE TABLE [Cart] (
  [CartId] int identity(1,1) NOT NULL,
  [UserId] int NOT NULL,
  [ProductId] int NOT NULL,
  [Quantity] int NOT NULL,
  PRIMARY KEY ([CartId]),
  CONSTRAINT [FK_Cart.UserId]
    FOREIGN KEY ([UserId])
      REFERENCES [Users]([UserId]),
  CONSTRAINT [FK_Cart.ProductId]
    FOREIGN KEY ([ProductId])
      REFERENCES [Products]([ProductId])
);
GO


INSERT INTO [Categories]([Name]) VALUES
('WHISKY'),
('COGNAC'),
('CHAMPAGNE - VANG'),
('GIN'),
('RUM'),
('TEQUILA'),
('VODKA');
GO

INSERT INTO [Brands]([CategoryId],[Name]) VALUES
(1,'CHIVAS'),
(1,'BALLANTINES'),
(1,'JIM BEAM'),
(1,'JACK DANIELS'),
(2,'HENESSY'),
(2,'CAMUS'),
(2,'MARTELL'),
(3,'G.H MUMM'),
(3,'FRANCE MAISON'),
(3,'DOM PERIGNON'),
(3,'LAROCA'),
(4,'MONKEY 47'),
(4,'GORDON'),
(4,'HENDRICK'),
(4,'TANQUERAY'),
(5,'BACARDI'),
(5,'HAVABA CLUB'),
(5,'CAPTAIN MORGAN'),
(5,'FLOR DE CANA'),
(6,'PATRON'),
(6,'TWO FINGERS'),
(6,'RESERVA 1800'),
(6,'JOSE CUERVO'),
(7,'BELUGA'),
(7,'ABSOLUT'),
(7,'RUSSIAN STANDARD'),
(7,'CIROC');
GO

INSERT INTO [Products]([Name],[Image],[Price],[Alcohol],[Volume],[Origin],[CategoryId],[BrandId]) VALUES
('CHIVAS ROYAL SALUTE 21','ruou-chivas-21-ava.jpg',2200000,40,700,'Scotland',1,1),
('CHIVAS EXTRA 13','ruou-chivas-extra-13-ava.jpg',750000,40,700,'Scotland',1,1),
('CHIVAS 18 ULTIMATE CASK COLLECTION','ruou-chivas-18-ultimate-cask-collection-ava.jpg',1600000,48,1000,'Scotland',1,1),
('CHIVAS 18 BLUE SIGNATURE','ruou-chivas-18-blue-hop-qua-tet-2022-ava.jpg',1700000,40,700,'Scotland',1,1),
('BALLANTINE’S FINEST','ruou-ballantines-finest-hop-qua-tet-2022-ava.jpg',420000 ,40,700,'Scotland',1,2),
('BALLANTINE’S 12','ruou-ballantines-12-ava.jpg',600000,40,750,'Scotland',1,2),
('BALLANTINE’S 30','ruou-ballantines-30-ava.jpg',5500000,40,700,'Scotland',1,2),
('BALLANTINE’S 17','ruou-ballantines-17-ava.jpg',1000000,40,700,'Scotland',1,2),
('JIM BEAM','ruou-jim-beam-hop-qua-tet-2022-ava.jpg',1000000,40,750,'America',1,3),
('JACK DANIEL’S NO.27 GOLD','ruou-jack-gold-n27-ava.jpg',4250000 ,40,700,'America',1,4),
('JACK DANIEL’S 3000ML','ruou-jack-daniels-3000ml-ava.jpg',3600000,40,3000,'America',1,4),
('JACK DANIEL’S BOTTLED IN BOND','rupu-jack-daniels-bottled-in-bond-1000ml-ava.jpg',1500000 ,50,1000,'America',1,4),
('JACK DANIEL’S SINGLE BARREL','ruou-jack-single-barrel-select-co-hop-ava.jpg',1800000,45,700,'America',1,4),
('HENNESSY XO DELUXE','hennessy-xo-deluxe-hop-qua-tet-2022-ava.jpg',5000000,40,700,'France',2,5),
('HENNESSY VSOP DELUXE','ruou-hennessy-VSOP-deluxe-tet-2021-ava.jpg',1500000,40,700,'France',2,5),
('HENNESSY XO 2019','ruou-Hennessy-XO-2019-ava.jpg',5500000,40,700,'France',2,5),
('HENNESSY XO 2017','ruou-Hennessy-XO-2017-ava.jpg',4800000,40,700,'France',2,5),
('CAMUS XO SUPERIEUR','ruou-Camus-XO-Superieur-ava.jpg',1000000,40,350,'France',2,6),
('CAMUS XO','ruou-Camus-XO-ava.jpg',2900000,40,700,'France',2,6),
('CAMUS VSOP','ruou-Camus-VSOP-ava.jpg',850000,40,700,'France',2,6),
('CAMUS XO BORDERIES','ruou-Camua-XO-Borderies-ava.jpg',3000000,40,700,'France',2,6),
('MARTELL CORDON BLEU','ruou-martell-cordon-bleu-ava.jpg-1',3750000,40,700,'France',2,7),
('MARTELL XO','ruou-Marrtell-XO-ava.jpg',4500000,40,700,'France',2,7),
('MARTELL VSOP','ruou-Martell-VSOP-ava.jpg',1100000,40,700,'France',2,7),
('MARTELL CORDON BLEU 100','ruou-martell-cordon-bleu-100-ava.jpg',16500000,40,3000,'France',2,7),
('CHAMPAGNE G.H MUMM ROSE','ruou-gh-mumm-rose-ava.jpg',2950000,12,750,'France',3,8),
('CHAMPAGNE G.H MUMM BLANC DE BLANCE','ruou-vang-gh-mumm-blanc-de-blance-ava.jpg',4400000,12,750,'France',3,8),
('CHAMPAGNE G.H MUMM SILVER','ruou-champagne-gh-mumm-bac-ava.jpg',2100000,12,750,'France',3,8),
('CHAMPAGNE G.H MUMM','ruou-champagne-gh-mumm-ava.jpg',1700000,12,750,'France',3,8),
('VANG FRANCE MAISON CABERNET SAUVIGNON','ruou-vang-france-maison-cabernet-sauvignon-ava.jpg',230000,13,750,'France',3,9),
('VANG FRANCE MAISON 3L','ruou-vang-France-Maison-3L-ava.jpg',330000,13.5,3000,'France',3,9),
('WHITE FRANCAISE COMTE TOLOSAN','ruou-vang-Maison-Trang-Francaise-Comte-Tolosan-ava.jpg',150000,13,750,'France',3,9),
('CHAMPAGNE DOM PERIGNON ROSE','ruou-champagne-dom-perignon-rose-ava.jpg',10000000,12.5,750,'France',3,10),
('CHAMPAGNE DOM PERIGNON BLANC','ruou-champagne-dom-perignon-blanc-ava.jpg',5300000,12.5,700,'France',3,10),
('VANG LAROCA 5L','ruou-vang-bich-chile-la-roca-5-lit-ava.jpg',375000,13.5,5000,'Chile',3,11),
('VANG LA ROCA 3L','ruou-vang-bich-chile-la-roca-3-lit-ava.jpg',275000,13.5,3000,'Chile',3,11),
('MONKEY 47','ruou-monkey-47-ava.jpg',1700000,47,500,'Germany',4,12),
('GORDON’S SPECIAL','ruou-gordons-special-gin-ava.jpg',400000,43,750,'England',4,13),
('GORDON’S ORIGINAL GIN','ruou-gordon-original-gin-ava.jpg',255000,40,700,'England',4,13),
('HENDRICK’S GIN','ruou-hendricks-gin-ava.jpg',1050000,41.8,700,'Scotland',4,14),
('TANQUERAY NO TEN','ruou-tanqueray-No-ten-ava.jpg',1200000,47.3,1000,'England',4,15),
('TANQUERAY IMPORTED','ruou-tanqueray-imported-ava.jpg',550000,47.3,750,'England',4,15),
('BACARDI RON ANOS 8 YEARS','ruou-bacardi-ron-anos-8y-ava.jpg',750000,40,700,'Puerto Rico',5,16),
('BACARDI GOLD','ruou-bacardi-gold-ava.jpg',300000,40,750,'Cuba',5,16),
('BACARDI CARTA NEGRA','ruou-barcadi-carta-negra-ava.jpg',730000,40,750,'Puerto Rico',5,16),
('BACARDI CARTA BLANCA','ruou-bacardi-carta-blanca-ava.jpg',275000,40,750,'Puerto Rico',5,16),
('HAVANA CLUB UNION','ruou-havana-club-cohiba-union-ava.jpg',7000000,40,700,'Cuba',5,17),
('HAVANA CLUB ANEJO RESERVA','ruou-havana-club-anejo-reserva-ava.jpg',450000,40,750,'Cuba',5,17),
('HAVANA CLUB ANEJO 7 ANOS','ruou-havana-club-anejo-7-anos-ava.jpg',850000,40,750,'Cuba',5,17),
('HAVANA CLUB ANEJO 3 ANOS','ruou-havana-club-anejo-3-anos-ava.jpg',350000,40,7000,'Cuba',5,17),
('CAPTAIN MORGAN ORIGINAL SPICED RUM RHUM EPICE','ruou-captain-morgan-original-spiced-rum-rhum-epice-ava.jpg',180000,35,200,'Jamaica',5,18),
('CAPTAIN MORGAN ORIGINAL SPICED GOLD','ruou-captain-morgan-spiced-gold-ava.jpg',280000,37.5,500,'Jamaica',5,18),
('CAPTAIN MORGAN ORIGINAL RUM','ruou-captain-morgan-original-rum-ava.jpg',370000,35,750,'Jamaica',5,18),
('FLOR DE CANA 5 YEARS ANEJO CLASICO','ruou-flor-de-cana-5-years-anejo-clasico-ava.jpg',400000,40,700,'Nicaragua',5,19),
('FLOR DE 4 YEAR CANA EXTRA SECO','ruou-flor-de-cana-4-years-extra-seco-ava.jpg',550000,40,700,'Nicaragua',5,19),
('PATRON XO CAFE','ruou-patron-xo-cafe-ava.jpg',950000,35,750,'Mexico',6,20),
('PATRON SILVER','ruou-patron-silver-ava.jpg',1450000,40,750,'Mexico',6,20),
('PATRON ANEJO','ruou-patron-anejo-ava.jpg',2000000,40,750,'Mexico',6,20),
('PATRON REPOSADO','ruou-patron-reposado-ava.jpg',1400000,24,750,'Mexico',6,20),
('TWO FINGERS SILVER TEQUILA','ruou-two-fingers-silver-tequilla-ava.jpg',350000,40,750,'Mexico',6,21),
('TWO FINGERS GOLD TEQUILA','ruou-two-fingers-gold-tequila-ava.jpg',300000,40,750,'Mexico',6,21),
('TEQUILA RESERVA 1800 REPOSADO','ruou-tequila-reserva-1800-reposado-ava.jpg',1400000,40,750,'Mexico',6,22),
('TEQUILA RESERVA 1800 SILVER','ruou-tequila-1800-silver-ava.jpg',1350000,40,750,'Mexico',6,22),
('JOSE CUERVO ESPECIALE GOLD','ruou-jose-cuervo-especiale-gold-vang-ava.jpg',350000,40,750,'Mexico',6,23),
('BELUGA ALLURE VODKA','ruou-Beluga-Allure-Vodka-ava.jpg',2400000,40,700,'Russia',7,24),
('BELUGA GOLD LINE VODKA','ruou-Beluga-Gold-Line-vodka-ava.jpg',2100000,40,700,'Russia',7,24),
('BELUGA NOBLE CELEBRATION','ruou-beluga-noble-celebration-vang-ava.jpg',850000,40,700,'Russia',7,24),
('BELUGA TRANSATLANTIC','ruou-beluga-transatlantic-ava.jpg',1050000,40,700,'Russia',7,24),
('ABSOLUT ELYX VODKA','ruou-absolut-elyx-vodka-ava.jpg',1650000,42.3,1000,'Sweden',7,25),
('ABSOLUT VANILIA VODKA','ruou-absolut-vanilia-vodka-ava.jpg',400000,40,750,'Sweden',7,25),
('ABSOLUT RUBY RED VODKA','ruou-absolut-ruby-red-ava.jpg',400000,40,750,'Sweden',7,25),
('ABSOLUT RASPBERRI VODKA','ruou-absolut-raspberri-vodka-dau-ava.jpg',400000,40,750,'Sweden',7,25),
('STANDARD VODKA','ruou-standard-vodka-ava.jpg',350000,38,700,'Russia',7,26),
('STANDARD IMPERIAL VODKA','ruou-Standard-Imperial-Vodka-ava.jpg',1350000,40,700,'Russia',7,26),
('STANDARD GOLD VODKA','ruou-standard-gold-ava.jpg',450000,40,700,'Russia',7,26),
('CIROC COCONUT VODKA','ruou-ciroc-coconut-ava.jpg',1250000,37.5,750,'France',7,27),
('CIROC PINEAPPLE','ruou-ciroc-pineapple-ava.jpg',1250000,37.5,750,'France',7,27),
('CIROC RED BERRY','ruou-ciroc-red-berry-ava.jpg',1250000,37.5,750,'France',7,27),
('CIROC VODKA','ruou-ciroc-vodka-ava.jpg',1250000,37.5,750,'France',7,27);
GO

SET IDENTITY_INSERT [Users] OFF
GO

INSERT INTO [Users]([Username],[Password],[Email],[Role]) VALUES
('user','123','user@mail.co',0),
('admin','123','admin@mail.co',1);
GO

