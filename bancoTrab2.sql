CREATE TABLE Empresa(
	cod_emp INT PRIMARY KEY,
	nome_emp varchar(30)
);

CREATE TABLE Mecanico(
	cod_mec INT PRIMARY KEY,
	nome_mec varchar(30),
	cod_emp INT,
	FOREIGN KEY (cod_emp) REFERENCES Empresa (cod_emp) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Especialista(
	cod_mec INT PRIMARY KEY,
	especialidade varchar(30),
	FOREIGN KEY (cod_mec) REFERENCES Mecanico (cod_mec) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Aprendiz(
	cod_apren INT PRIMARY KEY,
	nome_aprend varchar(30),
	FOREIGN KEY (cod_mec) REFERENCES Mecanico (cod_mec) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Supervisiona(
	cod_super INT,
	cod_mec INT,
	cod_apren INT,
	PRIMARY KEY( cod_apren, cod_mec),
	FOREIGN KEY (cod_mec) REFERENCES Mecanico (cod_mec) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (cod_apren) REFERENCES Aprendiz (cod_apren) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Servico_Terceirizado(
	cod_serv_t INT PRIMARY KEY,
	cod_emp INT,
	descricao varchar(30),
	ano INT,
	preco FLOAT,
	FOREIGN KEY (cod_emp) REFERENCES Empresa (cod_emp) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Cliente(
	cod_cli INT PRIMARY KEY,
	cod_emp INT,
	nome_cli varchar(30),
	FOREIGN KEY (cod_emp) REFERENCES Empresa (cod_emp) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Atendente(
	cod_aten INT PRIMARY KEY,
	nome_aten varchar(30)
);

CREATE TABLE Comissao(
	id_comis INT,
	cod_aten INT,
	percentual FLOAT,
	PRIMARY KEY(id_comis, cod_aten),
	FOREIGN KEY (cod_aten) REFERENCES Atendente (cod_aten) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Servico(
	cod_serv INT PRIMARY KEY,
	descricao varchar(30)
);

CREATE TABLE Motocicleta(
	cod_moto INT PRIMARY KEY,
	modelo varchar(30),
	cod_serv INT,
	cod_cli INT,
	FOREIGN KEY (cod_serv) REFERENCES Servico (cod_serv) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (cod_cli) REFERENCES Cliente (cod_cli) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Agenda(
	cod_agen INT PRIMARY KEY,
	cod_serv INT,
	descricao varchar(30)
cod_emp INT,
cod_aten INT,
	FOREIGN KEY (cod_emp) REFERENCES Empresa (cod_emp) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (cod_serv) REFERENCES Servico (cod_serv) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Empresa (cod_emp, nome_emp)
VALUES (001,'Julio Motos');

INSERT INTO Mecanico (cod_mec, cod_emp, nome_mec)
VALUES (001, 001, 'Joaquim Palmeiras');
INSERT INTO Mecanico (cod_mec, cod_emp, nome_mec)
VALUES (002, 001, 'Marta Freitas');
INSERT INTO Mecanico (cod_mec, cod_emp, nome_mec)
VALUES (003, 001, 'Elisa Regina');
INSERT INTO Mecanico (cod_mec, cod_emp, nome_mec)
VALUES (004, 001, 'Julia Grilo');
INSERT INTO Mecanico (cod_mec, cod_emp, nome_mec)
VALUES (005, 001, 'Laura Rodrigues');
INSERT INTO Mecanico (cod_mec, cod_emp, nome_mec)
VALUES (006, 001, 'Vinicius Miranda');
INSERT INTO Mecanico (cod_mec, cod_emp, nome_mec)
VALUES (007, 001, 'Victor Antonio');

INSERT INTO Especialista (cod_mec, especialidade)
VALUES (001, 'Equalização de carburadores');
INSERT INTO Especialista (cod_mec, especialidade)
VALUES (002, 'Pintura e lavagem');

INSERT INTO Aprendiz (cod_apren, nome_aprend)
VALUES (001, 'Clóvis Barreto');
INSERT INTO Aprendiz (cod_apren, nome_aprend)
VALUES (002, 'Carlos Magna');
INSERT INTO Aprendiz (cod_apren, nome_aprend)
VALUES (003, 'Roberto Altore');
INSERT INTO Aprendiz (cod_apren, nome_aprend)
VALUES (004, 'Willson Chagas');
INSERT INTO Aprendiz (cod_apren, nome_aprend)
VALUES (005, 'Marta Elis');
INSERT INTO Aprendiz (cod_apren, nome_aprend)
VALUES (006, 'Wellington Estevam');
INSERT INTO Aprendiz (cod_apren, nome_aprend)
VALUES (007, 'Aberto Nunes');

INSERT INTO Supervisiona (cod_mec, cod_apren)
VALUES (001,001);
INSERT INTO Supervisiona ( cod_mec, cod_apren)
VALUES (001,002);
INSERT INTO Supervisiona ( cod_mec, cod_apren)
VALUES (002,003);
INSERT INTO Supervisiona ( cod_mec, cod_apren)
VALUES (002,004);
INSERT INTO Supervisiona ( cod_mec, cod_apren)
VALUES (003,005);
INSERT INTO Supervisiona ( cod_mec, cod_apren)
VALUES (003,006);
INSERT INTO Supervisiona ( cod_mec, cod_apren)
VALUES (004,007);

INSERT INTO Servico_Terceirizado (cod_serv_t, cod_emp, descricao, ano, preco)
VALUES (001, 001, 'Carreta', 2019, 1500);
INSERT INTO Servico_Terceirizado (cod_serv_t, cod_emp, descricao, ano, preco)
VALUES (002, 001, 'Carro', 2018, 150);
INSERT INTO Servico_Terceirizado (cod_serv_t, cod_emp, descricao, ano, preco)
VALUES (003, 001, 'Caminhão', 2019, 220);
INSERT INTO Servico_Terceirizado (cod_serv_t, cod_emp, descricao, ano, preco)
VALUES (004, 001, 'Transporte aéreo', 2018, 3000);
INSERT INTO Servico_Terceirizado (cod_serv_t, cod_emp, descricao, ano, preco)
VALUES (005, 001, 'Transporte fluvial', 2018, 2000);
INSERT INTO Servico_Terceirizado (cod_serv_t, cod_emp, descricao, ano, preco)
VALUES (006, 001, 'Carro com carroceria', 2018, 250);
INSERT INTO Servico_Terceirizado (cod_serv_t, cod_emp, descricao, ano, preco)
VALUES (007, 001, 'Taxi para cliente', 2018, 40);

INSERT INTO Cliente (cod_cli, cod_emp, nome_cli)
VALUES (001, 001, 'Josimar Ferreira');
INSERT INTO Cliente (cod_cli, cod_emp, nome_cli)
VALUES (002, 001, 'Josimar Lopes');
INSERT INTO Cliente (cod_cli, cod_emp, nome_cli)
VALUES (003, 001, 'Pedro Martin');
INSERT INTO Cliente (cod_cli, cod_emp, nome_cli)
VALUES (004, 001, 'Anna Martelo');
INSERT INTO Cliente (cod_cli, cod_emp, nome_cli)
VALUES (005, 001, 'Jonatan Mirian');
INSERT INTO Cliente (cod_cli, cod_emp, nome_cli)
VALUES (006, 001, 'Eusebio Jusemiro');
INSERT INTO Cliente (cod_cli, cod_emp, nome_cli)
VALUES (007, 001, 'Jurandir Pinto');

INSERT INTO Atendente (cod_aten, nome_aten)
VALUES (001, 'Marcia Melo');
INSERT INTO Atendente (cod_aten, nome_aten)
VALUES (002, 'Jacinto Oliveira');
INSERT INTO Atendente (cod_aten, nome_aten)
VALUES (003, 'Isadora Mercurio');
INSERT INTO Atendente (cod_aten, nome_aten)
VALUES (004, 'Nildo Pereira');
INSERT INTO Atendente (cod_aten, nome_aten)
VALUES (005, 'Gabriel Jesus');
INSERT INTO Atendente (cod_aten, nome_aten)
VALUES (006, 'Neymar Junior');
INSERT INTO Atendente (cod_aten, nome_aten)
VALUES (007, 'Neiva do Céu');

INSERT INTO Comissao (id_comis, cod_aten, percentual)
VALUES (001, 001, 25);
INSERT INTO Comissao (id_comis, cod_aten, percentual)
VALUES (002, 002, 10);
INSERT INTO Comissao (id_comis, cod_aten, percentual)
VALUES (003, 001, 5);

INSERT INTO Servico (cod_serv, descricao)
VALUES (001, 'Troca de relação');
INSERT INTO Servico (cod_serv, descricao)
VALUES (002, 'Manutenção geral');
INSERT INTO Servico (cod_serv, descricao)
VALUES (003, 'Substituição de fluido');
INSERT INTO Servico (cod_serv, descricao)
VALUES (004, 'Regulagem de injecao');
INSERT INTO Servico (cod_serv, descricao)
VALUES (005, 'Alinhamento');
INSERT INTO Servico (cod_serv, descricao)
VALUES (006, 'Equalização de carburador');
INSERT INTO Servico (cod_serv, descricao)
VALUES (007, 'Troca de oleo');

INSERT INTO Motocicleta (cod_moto, modelo, cod_cli, cod_serv)
VALUES (001, 'kawasaki Zx10', 001, 001);
INSERT INTO Motocicleta (cod_moto, modelo, cod_cli, cod_serv)
VALUES (002, 'suzuki gsx750', 001, 002);
INSERT INTO Motocicleta (cod_moto, modelo, cod_cli, cod_serv)
VALUES (003, 'Honda CBR1000RR', 002, 003);
INSERT INTO Motocicleta (cod_moto, modelo, cod_cli, cod_serv)
VALUES (004, 'kawasaki Er6n', 004, 004);
INSERT INTO Motocicleta (cod_moto, modelo, cod_cli, cod_serv)
VALUES (005, 'kawasaki Ninja 300', 005, 005);
INSERT INTO Motocicleta (cod_moto, modelo, cod_cli, cod_serv)
VALUES (006, 'Yamaha Fz25', 006, 006);
INSERT INTO Motocicleta (cod_moto, modelo, cod_cli, cod_serv)
VALUES (007, 'Yamaha MT-09', 007, 007);

INSERT INTO Agenda (cod_agen, cod_serv, descricao, cod_emp, cod_aten)
VALUES (001,001,'Servico simples', 001, 001);
INSERT INTO Agenda (cod_agen, cod_serv, descricao, cod_emp, cod_aten)
VALUES (002,002,'Servico completo', 001, 002);
INSERT INTO Agenda (cod_agen, cod_serv, descricao, cod_emp, cod_aten)
VALUES (003,003,'Servico 003', 001, 003);
INSERT INTO Agenda (cod_agen, cod_serv, descricao, cod_emp, cod_aten)
VALUES (004,004,'Servico amigo', 001, 001);
INSERT INTO Agenda (cod_agen, cod_serv, descricao, cod_emp, cod_aten)
VALUES (005,006,'Servico remarcado', 001, 001);
INSERT INTO Agenda (cod_agen, cod_serv, descricao, cod_emp, cod_aten)
VALUES (006,001,'Servico cooperativo', 001, 002);
INSERT INTO Agenda (cod_agen, cod_serv, descricao, cod_emp, cod_aten)
VALUES (007,007,'Servico 007', 001, 005);
