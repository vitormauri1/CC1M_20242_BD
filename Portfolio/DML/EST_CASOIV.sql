-- =======================
-- Criação das Tabelas
-- =======================

-- 1. ALUNOS
CREATE TABLE Alunos (
    codigo_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    data_nascimento DATE,
    endereco VARCHAR(255)
);

-- 2. INSTRUTORES
CREATE TABLE Instrutores (
    codigo_instrutor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    especialidade VARCHAR(100)
);

-- 3. MODALIDADES
CREATE TABLE Modalidades (
    codigo_modalidade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT
);

-- 4. PLANOS DE TREINAMENTO
CREATE TABLE Planos_Treinamento (
    codigo_plano INT AUTO_INCREMENT PRIMARY KEY,
    codigo_aluno INT,
    codigo_instrutor INT,
    data_criacao DATE,
    descricao TEXT,
    FOREIGN KEY (codigo_aluno) REFERENCES Alunos(codigo_aluno),
    FOREIGN KEY (codigo_instrutor) REFERENCES Instrutores(codigo_instrutor)
);

-- 5. AULAS
CREATE TABLE Aulas (
    codigo_aula INT AUTO_INCREMENT PRIMARY KEY,
    codigo_modalidade INT,
    horario TIME,
    capacidade INT,
    codigo_instrutor INT,
    FOREIGN KEY (codigo_modalidade) REFERENCES Modalidades(codigo_modalidade),
    FOREIGN KEY (codigo_instrutor) REFERENCES Instrutores(codigo_instrutor)
);

-- 6. ALUNOS X MODALIDADES (Relacionamento muitos-para-muitos)
CREATE TABLE Alunos_Modalidades (
    codigo_aluno INT,
    codigo_modalidade INT,
    PRIMARY KEY (codigo_aluno, codigo_modalidade),
    FOREIGN KEY (codigo_aluno) REFERENCES Alunos(codigo_aluno),
    FOREIGN KEY (codigo_modalidade) REFERENCES Modalidades(codigo_modalidade)
);

-- 7. PAGAMENTOS
CREATE TABLE Pagamentos (
    codigo_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    codigo_aluno INT,
    data_pagamento DATE,
    valor DECIMAL(10, 2),
    status ENUM('Pago', 'Pendente') DEFAULT 'Pendente',
    FOREIGN KEY (codigo_aluno) REFERENCES Alunos(codigo_aluno)
);

-- =======================
-- Comandos INSERT
-- =======================

-- 1. Inserindo Alunos
INSERT INTO Alunos (nome, cpf, data_nascimento, endereco)
VALUES ('Lucas Oliveira', '123.456.789-01', '1990-06-15', 'Rua A, 123, São Paulo');

-- 2. Inserindo Instrutores
INSERT INTO Instrutores (nome, cpf, especialidade)
VALUES ('Carlos Silva', '987.654.321-00', 'Musculação');

-- 3. Inserindo Modalidades
INSERT INTO Modalidades (nome, descricao)
VALUES ('Musculação', 'Atividade de levantamento de pesos para ganho muscular'),
       ('Natação', 'Atividade aquática para condicionamento físico');

-- 4. Inserindo Planos de Treinamento
INSERT INTO Planos_Treinamento (codigo_aluno, codigo_instrutor, data_criacao, descricao)
VALUES (1, 1, '2024-01-10', 'Plano de treino para ganho de massa muscular');

-- 5. Inserindo Aulas
INSERT INTO Aulas (codigo_modalidade, horario, capacidade, codigo_instrutor)
VALUES (1, '08:00:00', 20, 1),
       (2, '10:00:00', 15, 1);

-- 6. Inserindo Alunos nas Modalidades (Relacionamento muitos-para-muitos)
INSERT INTO Alunos_Modalidades (codigo_aluno, codigo_modalidade)
VALUES (1, 1), (1, 2);

-- 7. Inserindo Pagamentos
INSERT INTO Pagamentos (codigo_aluno, data_pagamento, valor, status)
VALUES (1, '2024-01-15', 150.00, 'Pago');

-- =======================
-- Comandos UPDATE
-- =======================

-- 1. Atualizando o status de pagamento de um aluno
UPDATE Pagamentos
SET status = 'Pendente'
WHERE codigo_pagamento = 1;

-- 2. Atualizando o horário de uma aula
UPDATE Aulas
SET horario = '09:00:00'
WHERE codigo_aula = 1;

-- =======================
-- Comandos DELETE
-- =======================

-- 1. Excluindo um aluno
DELETE FROM Alunos
WHERE codigo_aluno = 1;

-- 2. Excluindo um pagamento
DELETE FROM Pagamentos
WHERE codigo_pagamento = 1;

-- 3. Excluindo uma aula
DELETE FROM Aulas
WHERE codigo_aula = 1;
