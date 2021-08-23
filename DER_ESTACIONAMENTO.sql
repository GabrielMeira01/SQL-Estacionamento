CREATE DATABASE db_Estacionamento

USE db_Estacionamento


CREATE TABLE tb_Modelo(
	PK_IDModelo INT PRIMARY KEY  NOT NULL,
	Modelo VARCHAR(30) NOT NULL
)

INSERT INTO tb_Modelo VALUES (1, 'HONDA CIVIC');
INSERT INTO tb_Modelo VALUES (2, 'SANDEIRO'); 
INSERT INTO tb_Modelo VALUES (3, 'SIENA'); 

SELECT * FROM  tb_Modelo





CREATE TABLE tb_Marca(
	PK_IDMarca INT PRIMARY KEY  NOT NULL,
	Marca VARCHAR(20) NOT NULL,
)
ALTER TABLE tb_Marca ADD 
FK_Modelo_Marca INT FOREIGN KEY (PK_IDMarca)REFERENCES tb_Modelo(PK_IDModelo);

INSERT INTO tb_Marca VALUES (1, 'HONDA', 1);
INSERT INTO tb_Marca VALUES (2, 'RENAULT', 2); 
INSERT INTO tb_Marca VALUES (3, 'FIAT', 3);

SELECT * FROM tb_Marca;





CREATE TABLE tb_Carro(
	PK_IDCarro INT PRIMARY KEY  NOT NULL,
	Placa CHAR(8) NOT NULL,
	Cor VARCHAR(15),
)

ALTER TABLE tb_Carro ADD 
FK_Marca_Carro INT FOREIGN KEY (PK_IDCarro)REFERENCES tb_Marca(PK_IDMarca),
FK_Modelo_Carro INT FOREIGN KEY (PK_IDCarro)REFERENCES tb_Modelo(PK_IDModelo);

INSERT INTO tb_Carro VALUES (1, 'AFL-7241', 'PRETO', 1, 1); 
INSERT INTO tb_Carro VALUES (2, 'BAE-4094', 'AZUL', 2, 2);
INSERT INTO tb_Carro VALUES (3, 'AUH-8794', 'VERMELHO',3 ,3);

SELECT * FROM tb_Carro





CREATE TABLE tb_Hora
(
	PK_IDHora INT PRIMARY KEY  NOT NULL,
	HoraEntrada TIME NOT NULL,
	HoraSaida TIME NOT NULL,
)
INSERT INTO tb_Hora VALUES (1, '12:00:00','12:00:00'); 
INSERT INTO tb_Hora VALUES (2, '13:15:01','13:30:41'); 
INSERT INTO tb_Hora VALUES (3, '13:00:54','14:00:12');

SELECT * FROM  tb_Hora		





CREATE TABLE tb_Data
(
	PK_IDData INT PRIMARY KEY  NOT NULL,
	DataChegada DATE NOT NULL,
	DataSaida DATE NOT NULL,
)

INSERT INTO tb_Data VALUES (1, '2021-03-07', '2021-04-07' );
INSERT INTO tb_Data VALUES (2, '2021-04-07', '2021-04-07');
INSERT INTO tb_Data VALUES (3, '2021-04-07', '2021-04-07');

SELECT * FROM tb_Data;





CREATE TABLE tb_Boleto(
	PK_IDBoleto INT PRIMARY KEY  ,
	Valor FLOAT NOT NULL,
)

ALTER TABLE tb_Boleto ADD
FK_Entrada_Boleto INT FOREIGN KEY (PK_IDBoleto)REFERENCES tb_Hora(PK_IDHora),
FK_Saida_Boleto INT FOREIGN KEY (PK_IDBoleto)REFERENCES tb_Data(PK_IDData);

INSERT INTO tb_Boleto VALUES (1, 100, 1, 1);
INSERT INTO tb_Boleto VALUES (2, 0, 2, 2);
INSERT INTO tb_Boleto VALUES (3, 4, 3, 3); 

SELECT * FROM tb_Boleto





CREATE TABLE tb_Registro
(
	PK_IDRegistro INT PRIMARY KEY,
)

ALTER TABLE tb_Registro ADD
FK_Carro_Registro INT FOREIGN KEY (PK_IDRegistro)REFERENCES tb_Carro(PK_IDCarro),
FK_Boleto_Registro INT FOREIGN KEY (PK_IDRegistro)REFERENCES tb_Boleto(PK_IDBoleto),
FK_Entrada_Registro INT FOREIGN KEY (PK_IDRegistro)REFERENCES tb_Hora(PK_IDHora),
FK_Saida_Registro INT FOREIGN KEY (PK_IDRegistro)REFERENCES tb_Data(PK_IDData);

INSERT INTO tb_Registro VALUES (1, 1, 1, 1, 1);
INSERT INTO tb_Registro VALUES (2, 2, 2, 2, 2); 
INSERT INTO tb_Registro VALUES (3, 3, 3 ,3 ,3); 

SELECT * FROM tb_Registro





CREATE TABLE tb_Horista(
	PK_IDClienteHorista INT PRIMARY KEY   ,
)

ALTER TABLE tb_Horista ADD
FK_IDCarro_Horista INT FOREIGN KEY (PK_IDClienteHorista)REFERENCES tb_Carro(PK_IDCarro),
FK_Boleto_Horista INT FOREIGN KEY (PK_IDClienteHorista)REFERENCES tb_Boleto(PK_IDBoleto);

INSERT INTO tb_Horista VALUES (1, 1, 1); 
INSERT INTO tb_Horista VALUES (2, 2, 2); 
INSERT INTO tb_Horista VALUES (3, 3, 3); 

SELECT * FROM tb_Horista





CREATE TABLE tb_PessoaConfiaca1(
	PK_IDPessoaConfiaca INT PRIMARY KEY   ,
	NomeCompleto VARCHAR(100),
	CPF CHAR(11)
)
INSERT INTO tb_PessoaConfiaca1 VALUES (1, 'ALINE FERREIRA', '12312312312'); 
INSERT INTO tb_PessoaConfiaca1 VALUES (2, ' ', '');
INSERT INTO tb_PessoaConfiaca1 VALUES (3, ' ', '');

SELECT * FROM tb_PessoaConfiaca1



CREATE TABLE tb_PessoaConfiaca2(
	PK_IDPessoaConfiaca INT PRIMARY KEY  ,
	NomeCompleto VARCHAR(100),
	CPF CHAR(11)
)
INSERT INTO tb_PessoaConfiaca2 VALUES (1, 'FELIPE SOUZA', '32132132132');
INSERT INTO tb_PessoaConfiaca2 VALUES (2, ' ', '');
INSERT INTO tb_PessoaConfiaca2 VALUES (3, ' ', '');

SELECT * FROM tb_PessoaConfiaca2





CREATE TABLE tb_Mensalista(
	PK_IDClienteMenasalista INT PRIMARY KEY,
	NomeCompleto VARCHAR(100),
	CPF CHAR(11) NOT NULL,
)

ALTER TABLE tb_Mensalista ADD
FK_PessoaConfiaca1_Mensalista INT FOREIGN KEY (PK_IDClienteMenasalista)REFERENCES tb_PessoaConfiaca1(PK_IDPessoaConfiaca),
FK_PessoaConfiaca2_Mensalista INT FOREIGN KEY (PK_IDClienteMenasalista)REFERENCES tb_PessoaConfiaca2(PK_IDPessoaConfiaca),
FK_Boleto_Registro INT FOREIGN KEY (PK_IDClienteMenasalista)REFERENCES tb_Boleto(PK_IDBoleto);

INSERT INTO tb_Mensalista VALUES (1, 'LUCAS LIMA', '12332112332', 1, 1, 1); 
INSERT INTO tb_Mensalista VALUES (2, '', '', 2 , 2, 2); 
INSERT INTO tb_Mensalista VALUES (3, '', '', 3 , 3, 3);

SELECT * FROM tb_Mensalista





CREATE TABLE tb_Ticket(
	PK_IDTicket INT PRIMARY KEY ,
)
INSERT INTO tb_Ticket VALUES (1); 
INSERT INTO tb_Ticket VALUES (2); 
INSERT INTO tb_Ticket VALUES (3); 

SELECT * FROM tb_Ticket





CREATE TABLE tb_Loja(
	PK_IDLoja INT PRIMARY KEY ,
	Nome VARCHAR(50),
	CNPJ CHAR(14),
)

ALTER TABLE tb_Loja ADD
FK_Ticket_Loja INT FOREIGN KEY (PK_IDLoja)REFERENCES tb_Ticket(PK_IDTicket),
FK_Boleto_Registro INT FOREIGN KEY (PK_IDLoja)REFERENCES tb_Boleto(PK_IDBoleto);

INSERT INTO tb_Loja VALUES (1, '', '', 1, 1); 
INSERT INTO tb_Loja VALUES (2, 'RESTAURANTE', '11111111111111', 2, 2); 
INSERT INTO tb_Loja VALUES (3, '', '', 3, 3); 




CREATE TABLE tb_Convenio(
	PK_IDConvenio INT PRIMARY KEY,
)

ALTER TABLE tb_Convenio ADD
FK_Loja_Convenio INT FOREIGN KEY (PK_IDConvenio) REFERENCES tb_Loja(PK_IDLoja);

INSERT INTO tb_Convenio VALUES (1, 1);
INSERT INTO tb_Convenio VALUES (2, 2);
INSERT INTO tb_Convenio VALUES (3, 3);

SELECT * FROM tb_Convenio



CREATE TABLE tb_Cliente(
	PK_IDCliente INT PRIMARY KEY,
	FK_Convenio_Cliente INT FOREIGN KEY (PK_IDCliente) REFERENCES tb_Convenio(PK_IDConvenio),
	FK_Ticket_Cliente INT FOREIGN KEY (PK_IDCliente)REFERENCES tb_Ticket(PK_IDTicket),
	FK_Horista_Cliente INT FOREIGN KEY (PK_IDCliente) REFERENCES tb_Horista(PK_IDClienteHorista),
	FK_Carro_Cliente INT FOREIGN KEY (PK_IDCliente)REFERENCES tb_Carro(PK_IDCarro),
	FK_Mensalista_Cliente INT FOREIGN KEY (PK_IDCliente)REFERENCES tb_Carro(PK_IDCarro)
)

/*Inserts*/
INSERT INTO tb_Cliente VALUES (1, 1, 1, 1, 1, 1); 
INSERT INTO tb_Cliente VALUES (2, 2, 2, 2, 2, 2); 
INSERT INTO tb_Cliente VALUES (3, 3, 3, 3, 3, 3); 

SELECT * FROM tb_Cliente