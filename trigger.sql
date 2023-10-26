CREATE DATABASE exercicios_trigger;
USE exercicios_trigger;

-- Criação das tabelas
CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Auditoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mensagem TEXT NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

--exercicio 1

DELIMITER //

CREATE TRIGGER cliente_data BEFORE INSERT ON Clientes

FOR EACH ROW

BEGIN

INSERT INTO Auditoria (mensagem)

VALUES ('Informação após mudança na tabela clientes')

END;

//

--exercicio 2
DELIMITER //

CREATE TRIGGER cliente_exclusao AFTER DELETE ON Clientes

FOR EACH ROW

BEGIN

INSERT INTO Auditoria (mensagem)

VALUES ('Tentaiva de exclusão em Clientes')

END;

//

--exercicio 3
DELIMITER //

CREATE TRIGGER cliente_att BEFORE UPDATE ON Clientes

FOR EACH ROW

BEGIN

INSERT INTO Auditoria (mensagem)

VALUES ('')

END;

//