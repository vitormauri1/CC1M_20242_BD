-- 1. Comandos de INSERT

-- Fornecedores
INSERT INTO Fornecedores (id_fornecedor, nome_empresa, endereco, pais_origem, pessoa_contato, telefone, historico_fornecimento)
VALUES (1, 'Fornecedor A', 'Rua X, 123', 'Brasil', 'João Silva', '1234-5678', 'Entregas: 1000 unidades em 01/01/2024, 500 unidades em 01/03/2024');

INSERT INTO Fornecedores (id_fornecedor, nome_empresa, endereco, pais_origem, pessoa_contato, telefone, historico_fornecimento)
VALUES (2, 'Fornecedor B', 'Avenida Y, 456', 'China', 'Li Wei', '9876-5432', 'Entregas: 2000 unidades em 01/02/2024');

-- Produtos
INSERT INTO Produtos (id_produto, nome_produto, descricao, especificacoes_tecnicas, unidade_medida, preco_unitario, quantidade_estoque, localizacao, ponto_ressuprimento)
VALUES (101, 'Produto X', 'Produto de alta qualidade', 'Tecnologia avançada', 'kg', 50.0, 100, 'Armazém A', 50);

INSERT INTO Produtos (id_produto, nome_produto, descricao, especificacoes_tecnicas, unidade_medida, preco_unitario, quantidade_estoque, localizacao, ponto_ressuprimento)
VALUES (102, 'Produto Y', 'Produto para indústria', 'Alta resistência', 'litros', 30.0, 200, 'Armazém B', 100);

INSERT INTO Produtos (id_produto, nome_produto, descricao, especificacoes_tecnicas, unidade_medida, preco_unitario, quantidade_estoque, localizacao, ponto_ressuprimento)
VALUES (103, 'Produto Z', 'Produto de baixo custo', 'Uso geral', 'unidades', 10.0, 300, 'Armazém C', 150);

-- Pedidos de Compra
INSERT INTO Pedidos (id_pedido, data_pedido, data_entrega_esperada, status_pedido, id_fornecedor)
VALUES (1, '2024-10-01', '2024-10-10', 'Em processamento', 1);

INSERT INTO Pedidos (id_pedido, data_pedido, data_entrega_esperada, status_pedido, id_fornecedor)
VALUES (2, '2024-10-05', '2024-10-15', 'Em processamento', 2);

-- Itens do Pedido
INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade_solicitada)
VALUES (1, 101, 50);

INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade_solicitada)
VALUES (1, 102, 30);

-- Recebimento de Materiais
INSERT INTO Recebimento_Materiais (id_recebimento, id_pedido, data_recebimento, quantidade_recebida, condicao_material, motivo_rejeicao)
VALUES (1, 1, '2024-10-10', 50, 'Aceito', NULL);

INSERT INTO Recebimento_Materiais (id_recebimento, id_pedido, data_recebimento, quantidade_recebida, condicao_material, motivo_rejeicao)
VALUES (2, 2, '2024-10-12', 30, 'Aceito', NULL);

-- Filiais
INSERT INTO Filiais (id_filial, nome_filial, endereco_filial, capacidade_armazenamento)
VALUES (1, 'Filial A', 'Rua Z, 789', 500);

INSERT INTO Filiais (id_filial, nome_filial, endereco_filial, capacidade_armazenamento)
VALUES (2, 'Filial B', 'Avenida Q, 123', 1000);

-- Distribuição para Filiais
INSERT INTO Distribuicao_Filiais (id_distribuicao, id_produto, id_filial, quantidade_distribuida)
VALUES (1, 101, 1, 30);

INSERT INTO Distribuicao_Filiais (id_distribuicao, id_produto, id_filial, quantidade_distribuida)
VALUES (2, 102, 2, 50);

-- 2. Comandos de UPDATE

-- Fornecedores
UPDATE Fornecedores
SET telefone = '4321-8765', pessoa_contato = 'Carlos Alberto'
WHERE id_fornecedor = 1;

UPDATE Fornecedores
SET nome_empresa = 'Fornecedor Z', endereco = 'Avenida W, 123'
WHERE id_fornecedor = 2;

-- Produtos
UPDATE Produtos
SET preco_unitario = 55.0, quantidade_estoque = 150
WHERE id_produto = 101;

UPDATE Produtos
SET descricao = 'Produto de excelente desempenho', ponto_ressuprimento = 100
WHERE id_produto = 102;

-- Pedidos de Compra
UPDATE Pedidos
SET status_pedido = 'Enviado', data_entrega_esperada = '2024-10-15'
WHERE id_pedido = 1;

UPDATE Pedidos
SET status_pedido = 'Cancelado'
WHERE id_pedido = 3;

-- Itens do Pedido
UPDATE Itens_Pedido
SET quantidade_solicitada = 60
WHERE id_pedido = 1 AND id_produto = 101;

UPDATE Itens_Pedido
SET quantidade_solicitada = 40
WHERE id_pedido = 2 AND id_produto = 102;

-- Recebimento de Materiais
UPDATE Recebimento_Materiais
SET quantidade_recebida = 60, condicao_material = 'Aceito'
WHERE id_recebimento = 1;

UPDATE Recebimento_Materiais
SET condicao_material = 'Rejeitado', motivo_rejeicao = 'Produto danificado'
WHERE id_recebimento = 2;

-- Filiais
UPDATE Filiais
SET capacidade_armazenamento = 600
WHERE id_filial = 1;

UPDATE Filiais
SET endereco_filial = 'Avenida Q, 500'
WHERE id_filial = 2;

-- Distribuição para Filiais
UPDATE Distribuicao_Filiais
SET quantidade_distribuida = 35
WHERE id_distribuicao = 1;

UPDATE Distribuicao_Filiais
SET quantidade_distribuida = 20
WHERE id_distribuicao = 2;

-- 3. Comandos de DELETE

-- Fornecedores
DELETE FROM Fornecedores
WHERE id_fornecedor = 3;

-- Produtos
DELETE FROM Produtos
WHERE id_produto = 102;

-- Pedidos de Compra
DELETE FROM Pedidos
WHERE id_pedido = 2;

-- Itens do Pedido
DELETE FROM Itens_Pedido
WHERE id_pedido = 1 AND id_produto = 101;

-- Recebimento de Materiais
DELETE FROM Recebimento_Materiais
WHERE id_recebimento = 3;

-- Filiais
DELETE FROM Filiais
WHERE id_filial = 3;

-- Distribuição para Filiais
DELETE FROM Distribuicao_Filiais
WHERE id_distribuicao = 2;
