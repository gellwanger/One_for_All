DROP DATABASE IF EXISTS SpotifyClone;

CREATE SCHEMA SpotifyClone;

CREATE TABLE SpotifyClone.plano (
    plano_id INT AUTO_INCREMENT,
    plano VARCHAR(15) NOT NULL,
    valor_plano DECIMAL(3,2) NOT NULL,
    PRIMARY KEY (plano_id)
)  ENGINE=INNODB;

INSERT INTO 
	SpotifyClone.plano (plano, valor_plano) 
	VALUES 
		('gratuito', 0.00),
		('gratuito', 5.99),
		('gratuito', 6.99),
		('gratuito', 7.99);

CREATE TABLE SpotifyClone.usuario (
    usuario_id INT AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    idade INT NOT NULL,
    plano INT NOT NULL,
    data_assinatura DATE NOT NULL,
    PRIMARY KEY (usuario_id),
    FOREIGN KEY (plano)
        REFERENCES plano (plano_id)
)  ENGINE=INNODB;

INSERT INTO 
	SpotifyClone.usuario (nome, idade, plano, data_assinatura) 
	VALUES 
		('Thati', 23, 1, '2019-10-20'),
		('Cintia', 35, 4, '2017-12-30'),
		('Bill', 20, 2, '2019-06-05'),
		('Roger', 45, 3, '2020-05-13'),
		('Norman', 58, 3, '2017-02-17'),
		('Patrick', 33, 4, '2017-01-06'),
		('Vivian', 26, 2, '2018-01-05'),
		('Carol', 19, 2, '2018-02-14'),
		('Angelina', 42, 4, '2018-04-29'),
		('Paul', 46, 4, '2017-01-29');

CREATE TABLE SpotifyClone.data_info (
    ano_id INT AUTO_INCREMENT,
    ano_lancamento INT NOT NULL,
    PRIMARY KEY (ano_id)
)  ENGINE=INNODB;

INSERT INTO 
	SpotifyClone.data_info(ano_id, ano_lancamento)
	VALUES
		(1, 1990),
		(2, 1991),
		(3, 1992),
		(4, 1993),
		(5, 1994),
		(6, 1995),
		(7, 1996),
		(8, 1997),
		(9, 1998),
		(10, 1999),
		(11, 2000),
		(12, 2001),
		(13, 2002),
		(14, 2003),
		(15, 2004),
		(16, 2005),
		(17, 2006),
		(18, 2007),
		(19, 2008),
		(20, 2009),
		(21, 2010),
		(22, 2011),
		(23, 2012),
		(24, 2013),
		(25, 2014),
		(26, 2015),
		(27, 2016),
		(28, 2017),
		(29, 2018),
		(30, 2019),
		(31, 2020),
		(32, 2021),
		(33, 2022);
        
CREATE TABLE SpotifyClone.artista (
    artista_id INT AUTO_INCREMENT,
    artista_nome VARCHAR(30) NOT NULL,
    PRIMARY KEY (artista_id)
)  ENGINE=INNODB;

INSERT INTO
	SpotifyClone.artista(artista_nome)
	VALUES
	('Walter Phoenix'),
	('Freedie Shannon'),
	('Lance Day'),
	('Peter Strong'),
	('Tyler Isle'),
	('Fog');

CREATE TABLE SpotifyClone.album (
    album_id INT AUTO_INCREMENT,
    album_nome VARCHAR(25) NOT NULL,
    artista INT NOT NULL,
    ano_id INT NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (ano_id)
        REFERENCES data_info (ano_id),
    FOREIGN KEY (artista)
        REFERENCES artista (artista_id)
)  ENGINE=INNODB;

INSERT INTO 
	SpotifyClone.album(album_nome, ano_id, artista)
	VALUES
		('Envious', 1, 1),
		('Exuberant', 4, 1),
		('Hallowed Steam', 5, 4),
		('Incandescent', 9, 3),
		('Temporary Culture', 12, 2),
		('Library of liberty', 14, 2),
		('Chained Down', 18, 5),
		('Cabinet of fools', 23, 5),
		('No guarantees', 26, 5),
		('Apparatus', 26, 6);
            
CREATE TABLE SpotifyClone.musicas (
    album_id INT NOT NULL,
    musica_id INT AUTO_INCREMENT,
    musica_nome VARCHAR(40) NOT NULL,
    duracao_segundos INT NOT NULL,
    PRIMARY KEY (musica_id),
    FOREIGN KEY (album_id)
        REFERENCES album (album_id)
)  ENGINE=INNODB;

INSERT INTO 
	SpotifyClone.musicas (album_id, musica_nome, duracao_segundos)
	VALUES
		(1, "Soul For Us", 200),
		(1, "Reflections Of Magic", 163),
		(1, "Dance With Her Own", 116),
		(2, "Troubles Of My Inner Fire", 203),
		(2, "Time Fireworks", 152),
		(3, "Magic Circus", 105),
		(3, "Honey, So Do I", 207),
		(3, "Sweetie, Let's Go Wild", 139),
		(3, "She Knows", 244),
		(4, "Fantasy For Me", 100),
		(4, "Celebration Of More", 146),
		(4, "Rock His Everything", 223),
		(4, "Home Forever", 231),
		(4, "Diamond Power", 241),
		(4, "Let's Be Silly", 132),
		(5, "Thang Of Thunder", 240),
		(5, "Words Of Her Life", 185),
		(5, "Without My Streets", 176),
		(6, "Need Of The Evening", 190),
		(6, "History Of My Roses", 222),
		(6, "Without My Love", 111),
		(6, "Walking And Game", 123),
		(6, "Young And Father", 197),
		(7, "Finding My Traditions", 179),
		(7, "Walking And Man", 229),
		(7, "Hard And Time", 135),
		(7, "Honey, I'm A Lone Wolf", 150),
		(8, "She Thinks I Won't Stay Tonight", 166),
		(8, "He Heard You're Bad For Me", 154),
		(8, "He Hopes We Can't Stay", 210),
		(8, "I Know I Know", 117),
		(9, "He's Walking Away", 159),
		(9, "He's Trouble", 138),
		(9, "I Heard I Want To Bo Alone", 120),
		(9, "I Ride Alone", 151),
		(10, "Honey", 79),
		(10, "You Cheated On Me", 95),
		(10, "Wouldn't It Be Nice", 213),
		(10, "Baby", 136),
		(10, "You Make Me Feel So...", 83);

CREATE TABLE SpotifyClone.reproducao (
    usuario_id INT NOT NULL,
    historico_reproducao INT NOT NULL,
    data_ultima_reproducao DATETIME NOT NULL,
    PRIMARY KEY (usuario_id , historico_reproducao),
    FOREIGN KEY (usuario_id)
        REFERENCES usuario (usuario_id),
    FOREIGN KEY (historico_reproducao)
        REFERENCES musicas (musica_id)
)  ENGINE=INNODB;

INSERT INTO 
	SpotifyClone.reproducao(usuario_id, historico_reproducao, data_ultima_reproducao)
	VALUES
		(1, 36, '2020-02-28 10:45:55'),
		(1, 25, '2020-05-02 05:30:35'),
		(1, 23, '2020-03-06 11:22:33'),
		(1, 14, '2020-08-05 08:05:17'),
		(1, 15, '2020-09-14 16:32:22'),
		(2, 34, '2020-01-02 07:40:33'),
		(2, 24, '2020-05-16 06:16:22'),
		(2, 21, '2020-10-09 12:27:48'),
		(2, 39, '2020-09-21 13:14:46'),
		(3, 6, '2020-11-13 16:55:13'),
		(3, 3, '2020-12-05 18:38:30'),
		(3, 26, '2020-07-30 10:00:00'),
		(4, 2, '2021-08-15 17:10:10'),
		(4, 35, '2021-07-10 15:20:30'),
		(4, 27, '2021-01-09 01:44:33'),
		(5, 7, '2020-07-03 19:33:28'),
		(5, 12, '2017-02-24 21:14:22'),
		(5, 14, '2020-08-06 15:23:43'),
		(5, 1, '2020-11-10 13:52:27'),
		(6, 38, '2019-02-07 20:33:48'),
		(6, 29, '2017-01-24 00:31:17'),
		(6, 30, '2017-10-12 12:35:20'),
		(6, 22, '2018-05-29 14:56:41'),
		(7, 5, '2018-05-09 22:30:49'),
		(7, 4, '2020-07-27 12:52:58'),
		(7, 11, '2018-01-16 18:40:43'),
		(8, 39, '2018-03-21 16:56:40'),
		(8, 40, '2020-10-18 13:38:05'),
		(8, 32, '2019-05-25 08:14:03'),
		(8, 33, '2021-08-15 21:37:09'),
		(9, 16, '2021-05-24 17:23:45'),
		(9, 17, '2018-12-07 22:48:52'),
		(9, 8, '2021-03-14 06:14:26'),
		(9, 9, '2020-04-01 03:36:00'),
		(10, 20, '2017-02-06 08:21:34'),
		(10, 21, '2017-12-04 05:33:43'),
		(10, 12, '2017-07-27 05:24:49'),
		(10, 13, '2017-12-25 01:03:57');

CREATE TABLE SpotifyClone.seguindo (
    usuario_id INT,
    seguindo_artistas INT NOT NULL,
    PRIMARY KEY (usuario_id , seguindo_artistas),
    FOREIGN KEY (usuario_id)
        REFERENCES usuario (usuario_id),
    FOREIGN KEY (seguindo_artistas)
        REFERENCES artista (artista_id)
)  ENGINE=INNODB;

INSERT INTO 
	SpotifyClone.seguindo(usuario_id, seguindo_artistas)
	VALUES
		(1, 1),
		(1, 2),
		(1, 3),
		(2, 1),
		(2, 3),
		(3, 4),
		(3, 1),
		(4, 2),
		(5, 5),
		(5, 6),
		(6, 6),
		(6, 3),
		(6, 1),
		(7, 4),
		(7, 5),
		(8, 1),
		(8, 5),
		(9, 6),
		(9, 2),
		(9, 3),
		(10, 4),
		(10, 6);