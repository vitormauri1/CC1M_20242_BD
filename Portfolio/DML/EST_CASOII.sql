-- 1. Comandos de INSERT

-- Passageiros
INSERT INTO Passageiros (id_passageiro, nome, cpf, telefone, endereco)
VALUES (1, 'Carlos Silva', '123.456.789-00', '9876-5432', 'Rua A, 123, São Paulo');

INSERT INTO Passageiros (id_passageiro, nome, cpf, telefone, endereco)
VALUES (2, 'Maria Oliveira', '987.654.321-00', '9123-4567', 'Avenida B, 456, Rio de Janeiro');

-- 3 mais comandos de INSERT para Passageiros...

-- Voos
INSERT INTO Voos (id_voo, codigo_voo, origem, destino, hora_partida, hora_chegada)
VALUES (1, 'FHA100', 'São Paulo', 'Rio de Janeiro', '2024-11-20 10:00:00', '2024-11-20 11:30:00');

INSERT INTO Voos (id_voo, codigo_voo, origem, destino, hora_partida, hora_chegada)
VALUES (2, 'FHA200', 'Rio de Janeiro', 'São Paulo', '2024-11-21 15:00:00', '2024-11-21 16:30:00');

-- 3 mais comandos de INSERT para Voos...

-- Aeroportos
INSERT INTO Aeroportos (id_aeroporto, codigo_aeroporto, nome_aeroporto, localizacao)
VALUES (1, 'GRU', 'Aeroporto Internacional de São Paulo', 'São Paulo');

INSERT INTO Aeroportos (id_aeroporto, codigo_aeroporto, nome_aeroporto, localizacao)
VALUES (2, 'SDU', 'Aeroporto Santos Dumont', 'Rio de Janeiro');

-- 3 mais comandos de INSERT para Aeroportos...

-- Aeronaves
INSERT INTO Aeronaves (id_aeronave, codigo_aeronave, modelo, capacidade)
VALUES (1, 'B737', 'Boeing 737', 180);

INSERT INTO Aeronaves (id_aeronave, codigo_aeronave, modelo, capacidade)
VALUES (2, 'A320', 'Airbus A320', 150);

-- 3 mais comandos de INSERT para Aeronaves...

-- Funcionários
INSERT INTO Funcionarios (id_funcionario, nome_funcionario, cargo, telefone)
VALUES (1, 'João Pereira', 'Piloto', '9876-1111');

INSERT INTO Funcionarios (id_funcionario, nome_funcionario, cargo, telefone)
VALUES (2, 'Ana Souza', 'Comissária de bordo', '9123-2222');

-- 3 mais comandos de INSERT para Funcionários...

-- Reservas
INSERT INTO Reservas (id_reserva, id_passageiro, id_voo, data_reserva)
VALUES (1, 1, 1, '2024-11-15');

INSERT INTO Reservas (id_reserva, id_passageiro, id_voo, data_reserva)
VALUES (2, 2, 2, '2024-11-16');

-- 3 mais comandos de INSERT para Reservas...

-- Operações de Voo
INSERT INTO Operacoes_Voo (id_operacao, id_voo, id_funcionario, data_operacao, papel)
VALUES (1, 1, 1, '2024-11-20', 'Piloto');

INSERT INTO Operacoes_Voo (id_operacao, id_voo, id_funcionario, data_operacao, papel)
VALUES (2, 1, 2, '2024-11-20', 'Comissário de bordo');

-- 3 mais comandos de INSERT para Operações de Voo...

-- 2. Comandos de UPDATE

-- Passageiros
UPDATE Passageiros
SET telefone = '9876-4321', endereco = 'Rua C, 789, Belo Horizonte'
WHERE id_passageiro = 1;

UPDATE Passageiros
SET nome = 'Maria Santos', telefone = '9123-4567'
WHERE id_passageiro = 2;

-- Voos
UPDATE Voos
SET hora_partida = '2024-11-20 12:00:00', hora_chegada = '2024-11-20 13:30:00'
WHERE id_voo = 1;

UPDATE Voos
SET origem = 'São Paulo', destino = 'Recife'
WHERE id_voo = 2;

-- Aeroportos
UPDATE Aeroportos
SET nome_aeroporto = 'Aeroporto Internacional de Belo Horizonte', localizacao = 'Belo Horizonte'
WHERE id_aeroporto = 1;

UPDATE Aeroportos
SET localizacao = 'Brasília'
WHERE id_aeroporto = 2;

-- Aeronaves
UPDATE Aeronaves
SET modelo = 'Boeing 747', capacidade = 300
WHERE id_aeronave = 1;

UPDATE Aeronaves
SET capacidade = 160
WHERE id_aeronave = 2;

-- Funcionários
UPDATE Funcionarios
SET cargo = 'Piloto Senior', telefone = '9876-9999'
WHERE id_funcionario = 1;

UPDATE Funcionarios
SET nome_funcionario = 'Cláudia Oliveira'
WHERE id_funcionario = 2;

-- Reservas
UPDATE Reservas
SET data_reserva = '2024-11-17'
WHERE id_reserva = 1;

UPDATE Reservas
SET id_voo = 2
WHERE id_reserva = 2;

-- Operações de Voo
UPDATE Operacoes_Voo
SET papel = 'Co-piloto'
WHERE id_operacao = 1;

UPDATE Operacoes_Voo
SET data_operacao = '2024-11-21'
WHERE id_operacao = 2;

-- 3. Comandos de DELETE

-- Passageiros
DELETE FROM Passageiros
WHERE id_passageiro = 3;

-- Voos
DELETE FROM Voos
WHERE id_voo = 2;

-- Aeroportos
DELETE FROM Aeroportos
WHERE id_aeroporto = 3;

-- Aeronaves
DELETE FROM Aeronaves
WHERE id_aeronave = 3;

-- Funcionários
DELETE FROM Funcionarios
WHERE id_funcionario = 3;

-- Reservas
DELETE FROM Reservas
WHERE id_reserva = 4;

-- Operações de Voo
DELETE FROM Operacoes_Voo
WHERE id_operacao = 3;

