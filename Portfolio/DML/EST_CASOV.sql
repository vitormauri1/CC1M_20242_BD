-- =======================
-- Criação das Tabelas
-- =======================

-- 1. CLIENTES
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    data_nascimento DATE,
    endereco VARCHAR(255),
    status_fidelidade VARCHAR(50) -- Ex: "Ativo", "Inativo"
);

-- 2. PRODUTOS
CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(100),
    preco DECIMAL(10, 2),
    estoque INT,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);

-- 3. FORNECEDORES
CREATE TABLE Fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_empresa VARCHAR(100),
    contato_nome VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(255)
);

-- 4. VENDAS
CREATE TABLE Vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_venda DATETIME,
    valor_total DECIMAL(10, 2),
    id_forma_pagamento INT, -- Ex: "Cartão de Crédito", "Boleto"
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- 5. PAGAMENTOS
CREATE TABLE Pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT,
    data_pagamento DATETIME,
    valor_pago DECIMAL(10, 2),
    status_pagamento VARCHAR(50), -- Ex: "Pago", "Pendente"
    FOREIGN KEY (id_venda) REFERENCES Vendas(id_venda)
);

-- 6. TABELA DE VENDAS-PRODUTOS (Para associar vários produtos a uma venda)
CREATE TABLE Venda_Produtos (
    id_venda INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    PRIMARY KEY (id_venda, id_produto),
    FOREIGN KEY (id_venda) REFERENCES Vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

-- =======================
-- Comandos de Insert
-- =======================

-- Inserindo clientes
INSERT INTO Clientes (nome, cpf, data_nascimento, endereco, status_fidelidade) 
VALUES 
('João Silva', '12345678900', '1985-04-15', 'Rua A, 123', 'Ativo'),
('Maria Oliveira', '98765432100', '1990-06-25', 'Rua B, 456', 'Inativo');

-- Inserindo fornecedores
INSERT INTO Fornecedores (nome_empresa, contato_nome, telefone, endereco) 
VALUES 
('TechSuppliers', 'Carlos Souza', '11987654321', 'Av. Principal, 789'),
('GlobalElectronics', 'Ana Pereira', '11876543210', 'Rua Secundária, 101');

-- Inserindo produtos
INSERT INTO Produtos (nome, categoria, preco, estoque, id_fornecedor) 
VALUES 
('Computador XYZ', 'Computadores', 2500.00, 50, 1),
('Celular ABC', 'Celulares', 1500.00, 100, 2),
('Headset Gamer', 'Acessórios', 300.00, 200, 1);

-- Inserindo vendas
INSERT INTO Vendas (id_cliente, data_venda, valor_total, id_forma_pagamento) 
VALUES 
(1, '2024-11-19 15:00:00', 4000.00, 1), -- Exemplo: Pagamento com Cartão de Crédito
(2, '2024-11-20 16:00:00', 3000.00, 2); -- Exemplo: Pagamento com Boleto

-- Inserindo produtos na venda
INSERT INTO Venda_Produtos (id_venda, id_produto, quantidade, preco_unitario)
VALUES 
(1, 1, 1, 2500.00),
(1, 2, 1, 1500.00),
(2, 2, 2, 1500.00);

-- Inserindo pagamentos
INSERT INTO Pagamentos (id_venda, data_pagamento, valor_pago, status_pagamento) 
VALUES 
(1, '2024-11-19 16:00:00', 4000.00, 'Pago'),
(2, '2024-11-20 17:00:00', 3000.00, 'Pendente');

-- =======================
-- Comandos de Update
-- =======================

-- Atualizar status de fidelidade de um cliente
UPDATE Clientes
SET status_fidelidade = 'Ativo'
WHERE id_cliente = 2;

-- Atualizar quantidade de estoque de um produto após uma venda
UPDATE Produtos
SET estoque = estoque - 1
WHERE id_produto = 1;

-- =======================
-- Comandos de Delete
-- =======================

-- Deletar um pagamento (por exemplo, se o pagamento for cancelado)
DELETE FROM Pagamentos
WHERE id_pagamento = 2;

-- Deletar um cliente
DELETE FROM Clientes
WHERE id_cliente = 2;

-- =======================
-- Consultas e Relatórios
-- =======================

-- Listar todos os produtos comprados por um cliente específico
SELECT p.nome, vp.quantidade, vp.preco_unitario
FROM Venda_Produtos vp
JOIN Produtos p ON vp.id_produto = p.id_produto
WHERE vp.id_venda IN (SELECT id_venda FROM Vendas WHERE id_cliente = 1);

-- Verificar o estoque e os fornecedores de um produto específico
SELECT p.nome AS Produto, p.estoque AS Estoque, f.nome_empresa AS Fornecedor
FROM Produtos p
JOIN Fornecedores f ON p.id_fornecedor = f.id_fornecedor
WHERE p.id_produto = 1;

-- Acompanhar o status de pagamento de cada venda
SELECT v.id_venda, v.data_venda, v.valor_total, p.status_pagamento
FROM Vendas v
JOIN Pagamentos p ON v.id_venda = p.id_venda;

-- Gerar relatório de vendas por período e cliente
SELECT v.id_venda, v.data_venda, v.valor_total, c.nome
FROM Vendas v
JOIN Clientes c ON v.id_cliente = c.id_cliente
WHERE v.data_venda BETWEEN '2024-11-01' AND '2024-11-30';
