-- =======================
-- Comandos INSERT
-- =======================

-- 1. CLIENTES
-- Inserindo um cliente
INSERT INTO Clientes (codigo_cliente, cnpj, razao_social, ramo_atividade, data_cadastramento, pessoa_contato)
VALUES (1, '12.345.678/0001-90', 'TechCorp Ltda.', 'Tecnologia', '2024-01-01', 'João Silva');

-- Inserindo telefones e endereços para o cliente
INSERT INTO Telefones_Clientes (codigo_cliente, telefone)
VALUES (1, '1234-5678'), (1, '9876-5432');

INSERT INTO Enderecos_Clientes (codigo_cliente, tipo_endereco, numero, logradouro, complemento, cep, bairro, cidade, estado)
VALUES (1, 'Comercial', '123', 'Av. Paulista', 'Sala 101', '01310-000', 'Bela Vista', 'São Paulo', 'SP');

-- 2. EMPREGADOS
-- Inserindo um empregado
INSERT INTO Empregados (matricula, nome, cargo, salario, data_admissao, qualificacoes)
VALUES (101, 'Ana Costa', 'Desenvolvedora', 5000.00, '2022-06-15', 'Mestre em Engenharia de Software');

-- Inserindo telefones e endereço para o empregado
INSERT INTO Telefones_Empregados (matricula, telefone)
VALUES (101, '2345-6789'), (101, '9876-1111');

INSERT INTO Enderecos_Empregados (matricula, numero, logradouro, complemento, cep, bairro, cidade, estado)
VALUES (101, '250', 'Rua das Flores', 'Apto 301', '12345-678', 'Jardim Paulista', 'São Paulo', 'SP');

-- 3. EMPRESAS
-- Inserindo uma empresa parceira
INSERT INTO Empresas (cnpj, razao_social, pessoa_contato)
VALUES ('98.765.432/0001-01', 'CompTech Solutions', 'Maria Oliveira');

-- 4. FORNECEDORES
-- Inserindo um fornecedor
INSERT INTO Fornecedores (cnpj, razao_social, pessoa_contato)
VALUES ('12.345.678/0001-10', 'Fabrica Components Ltda.', 'Carlos Ferreira');

-- 5. TIPO DE ENDEREÇO
-- Inserindo tipos de endereço
INSERT INTO Tipos_Endereco (codigo_tipo_endereco, nome)
VALUES (1, 'Comercial'), (2, 'Residencial');

-- 6. ENDEREÇOS
-- Inserindo um endereço
INSERT INTO Enderecos (codigo_endereco, numero, logradouro, complemento, cep, bairro, cidade, estado, tipo_endereco)
VALUES (1, '500', 'Rua da Indústria', 'Bloco B', '45678-987', 'Centro', 'Campinas', 'SP', 1);

-- 7. ENCOMENDAS
-- Inserindo uma encomenda
INSERT INTO Encomendas (numero_encomenda, data_inclusao, valor_total, valor_desconto, valor_liquido, id_forma_pagamento, quantidade_parcelas)
VALUES (1, '2024-11-15', 10000.00, 500.00, 9500.00, 1, 3);

-- 8. PRODUTOS
-- Inserindo um produto
INSERT INTO Produtos (codigo_produto, nome, cor, dimensoes, peso, preco, tempo_fabricacao, desenho_produto, horas_mao_obra)
VALUES (1, 'Software Enterprise', 'Azul', '50x50cm', 0.5, 15000.00, 30, 'Desenho V1', 10);

-- 9. TIPOS DE COMPONENTE
-- Inserindo tipos de componentes
INSERT INTO Tipos_Componentes (codigo_tipo_componente, nome)
VALUES (1, 'Hardware'), (2, 'Software');

-- 10. COMPONENTES
-- Inserindo um componente
INSERT INTO Componentes (codigo_componente, nome, quantidade_estoque, preco_unitario, unidade)
VALUES (1, 'Placa Mãe', 200, 120.00, 'Unidade');

-- 11. MÁQUINAS
-- Inserindo uma máquina
INSERT INTO Maquinas (tempo_vida, data_compra, data_fim_garantia)
VALUES (5, '2023-03-01', '2025-03-01');

-- 12. RE (Recursos Específicos)
-- Inserindo recursos específicos para produção
INSERT INTO Re (quantidade_necessaria, unidade, tempo_uso, horas_mao_obra)
VALUES (50, 'kg', 3, 5);

-- 13. RM (Registro de Manutenção)
-- Inserindo um registro de manutenção de máquina
INSERT INTO Rm (data, descricao)
VALUES ('2024-11-10', 'Troca de peça da máquina de montagem');

-- 14. RS (Registro de Suprimentos)
-- Inserindo um registro de suprimentos
INSERT INTO Rs (quantidade, data_necessidade)
VALUES (100, '2024-12-01');

-- =======================
-- Comandos UPDATE
-- =======================

-- 1. CLIENTES
UPDATE Clientes
SET razao_social = 'TechCorp Solutions', ramo_atividade = 'Desenvolvimento de Software'
WHERE codigo_cliente = 1;

-- 2. EMPREGADOS
UPDATE Empregados
SET salario = 5500.00
WHERE matricula = 101;

-- 3. EMPRESAS
UPDATE Empresas
SET pessoa_contato = 'Carlos Almeida'
WHERE cnpj = '98.765.432/0001-01';

-- 4. FORNECEDORES
UPDATE Fornecedores
SET pessoa_contato = 'Paula Rodrigues'
WHERE cnpj = '12.345.678/0001-10';

-- 5. TIPO DE ENDEREÇO
UPDATE Tipos_Endereco
SET nome = 'Industrial'
WHERE codigo_tipo_endereco = 1;

-- 6. ENDEREÇOS
UPDATE Enderecos
SET cidade = 'São Bernardo do Campo', estado = 'SP'
WHERE codigo_endereco = 1;

-- 7. ENCOMENDAS
UPDATE Encomendas
SET quantidade_parcelas = 4
WHERE numero_encomenda = 1;

-- 8. PRODUTOS
UPDATE Produtos
SET preco = 15500.00
WHERE codigo_produto = 1;

-- 9. TIPOS DE COMPONENTE
UPDATE Tipos_Componentes
SET nome = 'Eletrônico'
WHERE codigo_tipo_componente = 1;

-- 10. COMPONENTES
UPDATE Componentes
SET preco_unitario = 125.00
WHERE codigo_componente = 1;

-- 11. MÁQUINAS
UPDATE Maquinas
SET tempo_vida = 6
WHERE data_compra = '2023-03-01';

-- 12. RE (Recursos Específicos)
UPDATE Re
SET quantidade_necessaria = 60
WHERE tempo_uso = 3;

-- 13. RM (Registro de Manutenção)
UPDATE Rm
SET descricao = 'Substituição de motor na máquina de montagem'
WHERE data = '2024-11-10';

-- 14. RS (Registro de Suprimentos)
UPDATE Rs
SET quantidade = 120
WHERE data_necessidade = '2024-12-01';

-- =======================
-- Comandos DELETE
-- =======================

-- 1. CLIENTES
DELETE FROM Clientes
WHERE codigo_cliente = 1;

-- 2. EMPREGADOS
DELETE FROM Empregados
WHERE matricula = 101;

-- 3. EMPRESAS
DELETE FROM Empresas
WHERE cnpj = '98.765.432/0001-01';

-- 4. FORNECEDORES
DELETE FROM Fornecedores
WHERE cnpj = '12.345.678/0001-10';

-- 5. TIPO DE ENDEREÇO
DELETE FROM Tipos_Endereco
WHERE codigo_tipo_endereco = 1;

-- 6. ENDEREÇOS
DELETE FROM Enderecos
WHERE codigo_endereco = 1;

-- 7. ENCOMENDAS
DELETE FROM Encomendas
WHERE numero_encomenda = 1;

-- 8. PRODUTOS
DELETE FROM Produtos
WHERE codigo_produto = 1;

-- 9. TIPOS DE COMPONENTE
DELETE FROM Tipos_Componentes
WHERE codigo_tipo_componente = 1;

-- 10. COMPONENTES
DELETE FROM Componentes
WHERE codigo_componente = 1;

-- 11. MÁQUINAS
DELETE FROM Maquinas
WHERE data_compra = '2023-03-01';

-- 12. RE (Recursos Específicos)
DELETE FROM Re
WHERE quantidade_necessaria = 60;

-- 13. RM (Registro de Manutenção)
DELETE FROM Rm
WHERE data = '2024-11-10';

-- 14. RS (Registro de Suprimentos)
DELETE FROM Rs
WHERE data_necessidade = '2024-12-01';
