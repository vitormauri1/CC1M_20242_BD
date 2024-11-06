
CREATE TABLE Alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255) NOT NULL
);


CREATE TABLE Modalidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);


CREATE TABLE Instrutores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    especialidade VARCHAR(255) NOT NULL
);


CREATE TABLE Alunos_Modalidades (
    id_aluno INT,
    id_modalidade INT,
    PRIMARY KEY (id_aluno, id_modalidade),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id) ON DELETE CASCADE,
    FOREIGN KEY (id_modalidade) REFERENCES Modalidades(id) ON DELETE CASCADE
);


CREATE TABLE Planos_Treinamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT,
    id_aluno INT,
    id_instrutor INT,
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id) ON DELETE CASCADE,
    FOREIGN KEY (id_instrutor) REFERENCES Instrutores(id) ON DELETE CASCADE
);


CREATE TABLE Aulas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_modalidade INT,
    id_instrutor INT,
    horario DATETIME NOT NULL,
    capacidade INT NOT NULL,
    vagas_restantes INT NOT NULL,
    FOREIGN KEY (id_modalidade) REFERENCES Modalidades(id) ON DELETE CASCADE,
    FOREIGN KEY (id_instrutor) REFERENCES Instrutores(id) ON DELETE CASCADE
);


CREATE TABLE Alunos_Aulas (
    id_aluno INT,
    id_aula INT,
    PRIMARY KEY (id_aluno, id_aula),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id) ON DELETE CASCADE,
    FOREIGN KEY (id_aula) REFERENCES Aulas(id) ON DELETE CASCADE
);


CREATE TABLE Pagamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    data_pagamento DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    status ENUM('PAGO', 'PENDENTE') NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id) ON DELETE CASCADE
);
