
DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

	CREATE TABLE SpotifyClone.Artista(
      id INT PRIMARY KEY auto_increment,
      nome_artista VARCHAR(50) NOT NULL
  ) engine = InnoDB;

	CREATE TABLE SpotifyClone.Plano(
      id INT PRIMARY KEY auto_increment,
      nome_plano VARCHAR(50) NOT NULL,
      valor_plano DOUBLE NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.Album(
      id INT PRIMARY KEY auto_increment,
      nome_album VARCHAR(50) NOT NULL,
      id_artista INT NOT NULL,
      FOREIGN KEY(id_artista) REFERENCES Artista(id),
      ano_lancamento INT NOT NULL
  ) engine = InnoDB;
  
	CREATE TABLE SpotifyClone.Cancoes(
      id INT PRIMARY KEY auto_increment,
      nome_cancao VARCHAR(50) NOT NULL,
      duracao_segundos INT NOT NULL,
      id_album INT NOT NULL,
      FOREIGN KEY(id_album) REFERENCES Album(id)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.Perfil_do_usuario(
      id INT PRIMARY KEY auto_increment,
      nome_usuario VARCHAR(50) NOT NULL,
      idade INT NOT NULL,
      data_assinatura DATE NOT NULL,
      id_plano INT NOT NULL,
      FOREIGN KEY(id_plano) REFERENCES Plano(id)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.Historico_de_reproducoes(
      -- id INT PRIMARY KEY auto_increment,
      cancoes_reproduzidas INT NOT NULL,
      data_reproducao DATETIME NOT NULL,
      id_usuario INT NOT NULL,
      CONSTRAINT PRIMARY KEY(id_usuario, cancoes_reproduzidas),
      FOREIGN KEY(cancoes_reproduzidas) REFERENCES Cancoes(id),
      FOREIGN KEY(id_usuario) REFERENCES Perfil_do_usuario(id)
  ) engine = InnoDB;

	CREATE TABLE SpotifyClone.Seguindo(
      id_usuario INT NOT NULL,
      seguindo_artistas INT,
      CONSTRAINT PRIMARY KEY(id_usuario, seguindo_artistas),
      FOREIGN KEY(id_usuario) REFERENCES Perfil_do_usuario(id),
      FOREIGN KEY(seguindo_artistas) REFERENCES Artista(id)
  ) engine = InnoDB;
  
  INSERT INTO SpotifyClone.Artista (id, nome_artista)
  VALUES
    (1,'Beyoncé'),
    (2,'Queen'),
    (3,'Elis Regina'),
    (4,'Baco Exu do Blues'),
    (5,'Blind Guardian'),
    (6,'Nina Simone');

  INSERT INTO SpotifyClone.Plano (id, nome_plano, valor_plano)
  VALUES
    (1,'gratuito',0.00),
    (2,'familiar',7.99),
    (3,'universitário',5.99),
    (4,'pessoal',6.99);

  INSERT INTO SpotifyClone.Album (id, nome_album, id_artista, ano_lancamento)
  VALUES
    (1,'Renaissance',1,2022),
    (2,'Jazz',2,1978),
    (3,'Hot Space',2,1982),
    (4,'Falso Brilhante',3,1998),
    (5,'Vento de Maio',3,2001),
    (6,'QVVJFA?',4,2003),
    (7,'Somewhere Far Beyond',5,2007),
    (8,'I Put A Spell On You',6,2012);

  INSERT INTO SpotifyClone.Cancoes (id, nome_cancao, duracao_segundos, id_album )
  VALUES
    (1,"BREAK MY SOUL",279,1),
    (2,"VIRGO’S GROOVE",369,1),
    (3,"ALIEN SUPERSTAR",116,1),
    (4,"Don’t Stop Me Now",203,2),
    (5,"Under Pressure",152,3),
    (6,"Como Nossos Pais",105,4),
    (7,"O Medo de Amar é o Medo de Ser Livre",207,5),
    (8,"Samba em Paris",267,6),
    (9,"The Bard’s Song",244,7),
    (10,"Feeling Good",100,8);

  INSERT INTO SpotifyClone.Perfil_do_usuario (id, nome_usuario, idade, id_plano, data_assinatura )
  VALUES
    (1,'Barbara Liskov',82,1,'2019-10-20'),
    (2,'Robert Cecil Martin',58,1,'2017-01-06'),
    (3,'Ada Lovelace',37,2,'2017-12-30'),
    (4,'Martin Fowler',46,2,'2017-01-17'),
    (5,'Sandi Metz',58,2,'2018-04-29'),
    (6,'Paulo Freire',19,3,'2018-02-14'),
    (7,'Bell Hooks',26,3,'2018-01-05'),
    (8,'Christopher Alexander',85,4,'2019-06-05'),
    (9,'Judith Butler',45,4,'2020-05-13'),
    (10,'Jorge Amado',58,4,'2017-02-17');

  INSERT INTO SpotifyClone.Historico_de_reproducoes (cancoes_reproduzidas, data_reproducao, id_usuario)
  VALUES
    (8,"2022-02-28 10:45:55",1),
    (2,"2020-05-02 05:30:35",1),
    (10,"2020-03-06 11:22:33",1),
    (10,"2022-08-05 08:05:17",2),
    (7,"2020-01-02 07:40:33",2),
    (10,"2020-11-13 16:55:13",3),
    (2,"2020-12-05 18:38:30",3),
    (8,"2021-08-15 17:10:10",4),
    (8,"2022-01-09 01:44:33",5),
    (5,"2020-08-06 15:23:43",5),
    (7,"2017-01-24 00:31:17",6),
    (1,"2017-10-12 12:35:20",6),
    (4,"2011-12-15 22:30:49",7),
    (4,"2012-03-17 14:56:41",8),
    (9,"2022-02-24 21:14:22",9),
    (3,"2015-12-13 08:30:22",10);

  INSERT INTO SpotifyClone.Seguindo (id_usuario, seguindo_artistas)
  VALUES
    (1,1),
    (1,2),
    (1,3),
    (2,1),
    (2,3),
    (3,2),
    (4,4),
    (5,5),
    (5,6),
    (6,6),
    (6,1),
    (7,6),
    (8,3),
    (9,2);
    