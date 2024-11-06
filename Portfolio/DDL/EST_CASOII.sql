CREATE TABLE Passageiros (
    ID_Passageiro INT PRIMARY KEY,
    Nome VARCHAR(100),
    CPF VARCHAR(11),
    Telefone VARCHAR(20),
    Endereco VARCHAR(200)
);

CREATE TABLE Aeroportos (
    ID_Aeroporto INT PRIMARY KEY,
    Nome_Aeroporto VARCHAR(100),
    Codigo_Aeroporto VARCHAR(10),
    Cidade VARCHAR(50),
    Pais VARCHAR(50)
);

CREATE TABLE Aeronaves (
    ID_Aeronave INT PRIMARY KEY,
    Modelo VARCHAR(50),
    Capacidade INT,
    Ano_Fabricacao INT,
    Status VARCHAR(20)
);

CREATE TABLE Funcionarios (
    ID_Funcionario INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cargo VARCHAR(50),
    Telefone VARCHAR(20),
    Endereco VARCHAR(200),
    ID_Aeroporto_Alocado INT,
    FOREIGN KEY (ID_Aeroporto_Alocado) REFERENCES Aeroportos(ID_Aeroporto)
);

CREATE TABLE Voos (
    ID_Voo INT PRIMARY KEY,
    Codigo_Voo VARCHAR(10),
    Origem INT,
    Destino INT,
    Horario_Partida DATETIME,
    Horario_Chegada DATETIME,
    ID_Aeronave INT,
    FOREIGN KEY (Origem) REFERENCES Aeroportos(ID_Aeroporto),
    FOREIGN KEY (Destino) REFERENCES Aeroportos(ID_Aeroporto),
    FOREIGN KEY (ID_Aeronave) REFERENCES Aeronaves(ID_Aeronave)
);

CREATE TABLE Reservas (
    ID_Reserva INT PRIMARY KEY,
    ID_Passageiro INT,
    ID_Voo INT,
    Data_Reserva DATETIME,
    Assento VARCHAR(10),
    FOREIGN KEY (ID_Passageiro) REFERENCES Passageiros(ID_Passageiro),
    FOREIGN KEY (ID_Voo) REFERENCES Voos(ID_Voo)
);

CREATE TABLE Operacoes_Voo (
    ID_Operacao INT PRIMARY KEY,
    ID_Voo INT,
    Data_Voo DATETIME,
    ID_Funcionario INT,
    Funcao_Funcionario VARCHAR(50),
    FOREIGN KEY (ID_Voo) REFERENCES Voos(ID_Voo),
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionarios(ID_Funcionario)
);
