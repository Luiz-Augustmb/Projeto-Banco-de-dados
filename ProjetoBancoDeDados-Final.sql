CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8;
USE `mydb`;

CREATE TABLE IF NOT EXISTS `mydb`.`Loja` (
  `Nome` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nome`)
);

CREATE TABLE IF NOT EXISTS `mydb`.`Produtos` (
  `idProdutos` INT NOT NULL AUTO_INCREMENT,
  `Categoria` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(10,2) NOT NULL, 
  `Quantidade` INT NOT NULL,
  `Loja_Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProdutos`),
  CONSTRAINT `fk_Produtos_Loja1`
    FOREIGN KEY (`Loja_Nome`)
    REFERENCES `mydb`.`Loja` (`Nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `Usuario` VARCHAR(45) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Senha` VARCHAR(45) NOT NULL,
  `Cargo` VARCHAR(45) NOT NULL,
  `Loja_Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Usuario`),
  CONSTRAINT `fk_Funcionario_Loja1`
    FOREIGN KEY (`Loja_Nome`)
    REFERENCES `mydb`.`Loja` (`Nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `CPF` VARCHAR(45) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Endereco` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Loja_Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CPF`),
  CONSTRAINT `fk_Cliente_Loja1`
    FOREIGN KEY (`Loja_Nome`)
    REFERENCES `mydb`.`Loja` (`Nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS `mydb`.`Carrinho_de_Compras` (
  `idCarrinho_de_Compras` INT NOT NULL AUTO_INCREMENT,
  `Status` VARCHAR(45) NOT NULL,
  `Cliente_CPF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCarrinho_de_Compras`),
  CONSTRAINT `fk_Carrinho_de_Compras_Cliente1`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `mydb`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS `mydb`.`Produtos_has_Carrinho_de_Compras` (
  `Produtos_idProdutos` INT NOT NULL,
  `Carrinho_de_Compras_idCarrinho_de_Compras` INT NOT NULL,
  PRIMARY KEY (`Produtos_idProdutos`, `Carrinho_de_Compras_idCarrinho_de_Compras`),
  CONSTRAINT `fk_Produtos_has_Carrinho_de_Compras_Produtos1`
    FOREIGN KEY (`Produtos_idProdutos`)
    REFERENCES `mydb`.`Produtos` (`idProdutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produtos_has_Carrinho_de_Compras_Carrinho_de_Compras1`
    FOREIGN KEY (`Carrinho_de_Compras_idCarrinho_de_Compras`)
    REFERENCES `mydb`.`Carrinho_de_Compras` (`idCarrinho_de_Compras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS `mydb`.`Ofertas_Especiais` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Descricao` TEXT NOT NULL,
  `Data_Inicio` DATE NOT NULL,
  `Data_Termino` DATE NOT NULL,
  `Loja_Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_Ofertas_Especiais_Loja1`
    FOREIGN KEY (`Loja_Nome`)
    REFERENCES `mydb`.`Loja` (`Nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Inserções de exemplo
INSERT INTO Loja (Nome, Telefone, Email) VALUES ('SMARTSTOCK CONTROLL', '32417070', 'smartstock@gmail.com');

-- Inserir dados na tabela Funcionario
INSERT INTO Funcionario (Usuario, Nome, Senha, Cargo, Loja_Nome) VALUES ('admin', 'Luiz Augusto', 'admin', 'dono', 'SMARTSTOCK CONTROLL');
INSERT INTO Funcionario (Usuario, Nome, Senha, Cargo, Loja_Nome) VALUES ('funcionario1', 'João Silva', 'senha123', 'Vendedor', 'SMARTSTOCK CONTROLL');
INSERT INTO Funcionario (Usuario, Nome, Senha, Cargo, Loja_Nome) VALUES ('funcionario2', 'Maria Souza', 'senha456', 'Gerente', 'SMARTSTOCK CONTROLL');
INSERT INTO Funcionario (Usuario, Nome, Senha, Cargo, Loja_Nome) VALUES ('funcionario3', 'Pedro Jorge', 'senhaPedro', 'Vendedor', 'SMARTSTOCK CONTROLL');

-- Inserir dados na tabela Cliente
INSERT INTO Cliente (CPF, Nome, Endereco, Telefone, Email, Loja_Nome) VALUES ('12345678910', 'Luiz', 'Rua dos ricos', '(35)998775754', 'luiz_cliente@gmail.com', 'SMARTSTOCK CONTROLL');
INSERT INTO Cliente (CPF, Nome, Endereco, Telefone, Email, Loja_Nome) VALUES ('98765432100', 'Carlos Oliveira', 'Av. das Flores', '(11)987654321', 'carlos@example.com', 'SMARTSTOCK CONTROLL');
INSERT INTO Cliente (CPF, Nome, Endereco, Telefone, Email, Loja_Nome) VALUES ('11122233344', 'Ana Rodrigues', 'Rua dos Anjos', '(22)33334444', 'ana@example.com', 'SMARTSTOCK CONTROLL');
INSERT INTO Cliente (CPF, Nome, Endereco, Telefone, Email, Loja_Nome) VALUES ('14758269853', 'Caio Freitas', 'Av. Barão', '(35)963258741', 'caio@example.com', 'SMARTSTOCK CONTROLL');
INSERT INTO Cliente (CPF, Nome, Endereco, Telefone, Email, Loja_Nome) VALUES ('35715962485', 'Maria Clara', 'Rua da Esperança', '(14)998775753', 'mclara@example.com', 'SMARTSTOCK CONTROLL');

-- Inserir dados na tabela Produtos
INSERT INTO Produtos (Categoria, Marca, Modelo, Preco, Quantidade, Loja_Nome) VALUES ('Notebook', 'Apple', 'Macbook Air', 5000.00, 10, 'SMARTSTOCK CONTROLL');
INSERT INTO Produtos (Categoria, Marca, Modelo, Preco, Quantidade, Loja_Nome) VALUES ('Smartphone', 'Apple', 'iPhone 15', 6500.00, 20, 'SMARTSTOCK CONTROLL');
INSERT INTO Produtos (Categoria, Marca, Modelo, Preco, Quantidade, Loja_Nome) VALUES ('Smartphone', 'Motorola', 'Moto ONE', 1500.00, 20, 'SMARTSTOCK CONTROLL');
INSERT INTO Produtos (Categoria, Marca, Modelo, Preco, Quantidade, Loja_Nome) VALUES ('Notebook', 'Dell', 'Inspiron 5000', 4500.00, 5, 'SMARTSTOCK CONTROLL');
INSERT INTO Produtos (Categoria, Marca, Modelo, Preco, Quantidade, Loja_Nome) VALUES ('Smartphone', 'Samsung', 'Galaxy S20', 3500.00, 10, 'SMARTSTOCK CONTROLL');
INSERT INTO Produtos (Categoria, Marca, Modelo, Preco, Quantidade, Loja_Nome) VALUES ('Notebook', 'HP', 'Pavilion X360', 4200.00, 8, 'SMARTSTOCK CONTROLL');
INSERT INTO Produtos (Categoria, Marca, Modelo, Preco, Quantidade, Loja_Nome) VALUES ('Smartphone', 'Apple', 'iPhone SE', 2800.00, 15, 'SMARTSTOCK CONTROLL');
INSERT INTO Produtos (Categoria, Marca, Modelo, Preco, Quantidade, Loja_Nome) VALUES ('Tablet', 'Samsung', 'Galaxy Tab S7', 5500.00, 6, 'SMARTSTOCK CONTROLL');
INSERT INTO Produtos (Categoria, Marca, Modelo, Preco, Quantidade, Loja_Nome) VALUES ('Monitor', 'LG', 'UltraGear 27GL850', 3200.00, 12, 'SMARTSTOCK CONTROLL');
INSERT INTO Produtos (Categoria, Marca, Modelo, Preco, Quantidade, Loja_Nome) VALUES ('Teclado', 'Logitech', 'G Pro X', 600.00, 20, 'SMARTSTOCK CONTROLL');
INSERT INTO Produtos (Categoria, Marca, Modelo, Preco, Quantidade, Loja_Nome) VALUES ('Mouse', 'Razer', 'DeathAdder Elite', 300.00, 25, 'SMARTSTOCK CONTROLL');
INSERT INTO Produtos (Categoria, Marca, Modelo, Preco, Quantidade, Loja_Nome) VALUES ('Fone de Ouvido', 'Sony', 'WH-1000XM4', 1500.00, 18, 'SMARTSTOCK CONTROLL');
INSERT INTO Produtos (Categoria, Marca, Modelo, Preco, Quantidade, Loja_Nome) VALUES ('Impressora', 'Epson', 'EcoTank L3150', 1200.00, 10, 'SMARTSTOCK CONTROLL');
INSERT INTO Produtos (Categoria, Marca, Modelo, Preco, Quantidade, Loja_Nome) VALUES ('Câmera', 'Canon', 'EOS Rebel T7i', 4500.00, 5, 'SMARTSTOCK CONTROLL');

-- Inserir dados na tabela Carrinho_de_Compras
INSERT INTO Carrinho_de_Compras (Status, Cliente_CPF) VALUES ('Aberto', '98765432100'); -- Carrinho aberto para o cliente Carlos Oliveira
INSERT INTO Carrinho_de_Compras (Status, Cliente_CPF) VALUES ('Aberto', '11122233344');
INSERT INTO Carrinho_de_Compras (Status, Cliente_CPF) VALUES ('Aberto', '14758269853');

-- Inserir dados na tabela Ofertas_Especiais
INSERT INTO Ofertas_Especiais (Descricao, Data_Inicio, Data_Termino, Loja_Nome) VALUES ('Desconto de Aniversário', '2024-07-01', '2024-07-15', 'SMARTSTOCK CONTROLL');
INSERT INTO Ofertas_Especiais (Descricao, Data_Inicio, Data_Termino, Loja_Nome)VALUES ('Black Friday', '2024-11-29', '2024-11-30', 'SMARTSTOCK CONTROLL');
INSERT INTO Ofertas_Especiais (Descricao, Data_Inicio, Data_Termino, Loja_Nome)VALUES ('Promoção do Mês', '2024-06-01', '2024-06-30', 'SMARTSTOCK CONTROLL');

-- Inserir produtos aleatoriamente no primeiro carrinho de compras
INSERT INTO Produtos_has_Carrinho_de_Compras (Produtos_idProdutos, Carrinho_de_Compras_idCarrinho_de_Compras)
SELECT idProdutos, 1 -- 1 é o id do primeiro carrinho de compras
FROM Produtos
ORDER BY RAND()
LIMIT 5; -- Inserir 2 produtos no primeiro carrinho

-- Inserir produtos aleatoriamente no segundo carrinho de compras
INSERT INTO Produtos_has_Carrinho_de_Compras (Produtos_idProdutos, Carrinho_de_Compras_idCarrinho_de_Compras)
SELECT idProdutos, 2 -- 2 é o id do segundo carrinho de compras
FROM Produtos
ORDER BY RAND()
LIMIT 3; -- Inserir 3 produtos no segundo carrinho

-- Definição da função para calcular o valor total do carrinho de compras
DELIMITER //

CREATE FUNCTION calcular_valor_carrinho(idCarrinho INT) RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE total DECIMAL(10,2);
    
    -- Inicializa o total com 0
    SET total = 0.0;
    
    -- Soma os preços dos produtos no carrinho
    SELECT SUM(Preco) INTO total
    FROM Produtos_has_Carrinho_de_Compras AS pc
    JOIN Produtos AS p ON pc.Produtos_idProdutos = p.idProdutos
    WHERE pc.Carrinho_de_Compras_idCarrinho_de_Compras = idCarrinho;
    
    RETURN total;
END //

DELIMITER ;

-- Selecionar o valor total do carrinho de compras que inserimos
SELECT calcular_valor_carrinho(idCarrinho_de_Compras) AS Valor_Total
FROM Carrinho_de_Compras
WHERE idCarrinho_de_Compras = 2;

-- Selecionar o valor total do carrinho de compras e os produtos no formato "Categoria - Modelo"
SELECT 
    calcular_valor_carrinho(cc.idCarrinho_de_Compras) AS Valor_Total,
    GROUP_CONCAT(CONCAT(p.Categoria, ' - ', p.Modelo) SEPARATOR ', ') AS Produtos
FROM Carrinho_de_Compras cc
JOIN Produtos_has_Carrinho_de_Compras pc ON cc.idCarrinho_de_Compras = pc.Carrinho_de_Compras_idCarrinho_de_Compras
JOIN Produtos p ON pc.Produtos_idProdutos = p.idProdutos
WHERE cc.idCarrinho_de_Compras = 2
GROUP BY cc.idCarrinho_de_Compras;

ALTER TABLE Carrinho_de_Compras
ADD COLUMN Nome_Cliente VARCHAR(45);
-- Atualizar os registros na tabela Carrinho_de_Compras com o nome do cliente correspondente
UPDATE Carrinho_de_Compras cc
JOIN Cliente c ON cc.Cliente_CPF = c.CPF
SET cc.Nome_Cliente = c.Nome
WHERE cc.idCarrinho_de_Compras = 1;

UPDATE Carrinho_de_Compras cc
JOIN Cliente c ON cc.Cliente_CPF = c.CPF
SET cc.Nome_Cliente = c.Nome
WHERE cc.idCarrinho_de_Compras = 2;

UPDATE Carrinho_de_Compras cc
JOIN Cliente c ON cc.Cliente_CPF = c.CPF
SET cc.Nome_Cliente = c.Nome
WHERE cc.idCarrinho_de_Compras = 3;


INSERT INTO Ofertas_Especiais (Descricao, Data_Inicio, Data_Termino, Loja_Nome)VALUES ('Oferta Teste', '2024-06-01', '2024-06-22', 'SMARTSTOCK CONTROLL');
-- Excluir ofertas especiais cuja data de término seja anterior a uma data específica (por exemplo, hoje)
DELETE Ofertas_Especiais
FROM Ofertas_Especiais 
JOIN (
    SELECT ID
    FROM Ofertas_Especiais
    WHERE Data_Termino < CURDATE()
) AS temp ON Ofertas_Especiais.ID = temp.ID;






















