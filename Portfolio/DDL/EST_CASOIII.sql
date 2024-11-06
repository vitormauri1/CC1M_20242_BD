
CREATE TABLE Clientes (
    codigo INT PRIMARY KEY,
    cnpj VARCHAR(14) UNIQUE,
    razao_social VARCHAR(255),
    ramo_atividade VARCHAR(255),
    data_cadastramento DATE,
    pessoa_contato VARCHAR(255)
);


CREATE TABLE Telefones_Clientes (
    id INT PRIMARY KEY,
    codigo_cliente INT,
    telefone VARCHAR(20),
    FOREIGN KEY (codigo_cliente) REFERENCES Clientes(codigo)
);


CREATE TABLE Enderecos_Clientes (
    id INT PRIMARY KEY,
    codigo_cliente INT,
    tipo_endereco INT,
    numero VARCHAR(10),
    logradouro VARCHAR(255),
    complemento VARCHAR(255),
    cep VARCHAR(10),
    bairro VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(255),
    FOREIGN KEY (codigo_cliente) REFERENCES Clientes(codigo),
    FOREIGN KEY (tipo_endereco) REFERENCES Tipo_Endereco(codigo)
);


CREATE TABLE Empregados (
    matricula INT PRIMARY KEY,
    nome VARCHAR(255),
    cargo VARCHAR(255),
    salario DECIMAL(10, 2),
    data_admissao DATE,
    qualificacoes TEXT,
    endereco VARCHAR(255)
);


CREATE TABLE Telefones_Empregados (
    id INT PRIMARY KEY,
    matricula_empregado INT,
    telefone VARCHAR(20),
    FOREIGN KEY (matricula_empregado) REFERENCES Empregados(matricula)
);


CREATE TABLE Empresas (
    cnpj VARCHAR(14) PRIMARY KEY,
    razao_social VARCHAR(255),
    pessoa_contato VARCHAR(255),
    endereco VARCHAR(255)
);


CREATE TABLE Fornecedores (
    cnpj VARCHAR(14) PRIMARY KEY,
    razao_social VARCHAR(255),
    endereco VARCHAR(255),
    pessoa_contato VARCHAR(255)
);


CREATE TABLE Tipo_Endereco (
    codigo INT PRIMARY KEY,
    nome VARCHAR(255)
);


CREATE TABLE Produtos (
    codigo INT PRIMARY KEY,
    nome VARCHAR(255),
    cor VARCHAR(50),
    dimensoes VARCHAR(100),
    peso DECIMAL(10, 2),
    preco DECIMAL(10, 2),
    tempo_fabricacao INT,
    desenho_produto TEXT,
    horas_mao_obra DECIMAL(10, 2)
);


CREATE TABLE Tipos_Componente (
    codigo INT PRIMARY KEY,
    nome VARCHAR(255)
);


CREATE TABLE Componentes (
    codigo INT PRIMARY KEY,
    nome VARCHAR(255),
    quantidade_estoque INT,
    preco_unitario DECIMAL(10, 2),
    unidade VARCHAR(50),
    tipo_componente INT,
    FOREIGN KEY (tipo_componente) REFERENCES Tipos_Componente(codigo)
);


CREATE TABLE Maquinas (
    id INT PRIMARY KEY,
    tempo_vida INT,
    data_compra DATE,
    data_fim_garantia DATE
);


CREATE TABLE Recursos_Especificos (
    id INT PRIMARY KEY,
    quantidade_necessaria INT,
    unidade VARCHAR(50),
    tempo_uso INT,
    horas_mao_obra DECIMAL(10, 2),
    codigo_produto INT,
    FOREIGN KEY (codigo_produto) REFERENCES Produtos(codigo)
);


CREATE TABLE Registro_Manutencao (
    id INT PRIMARY KEY,
    data DATE,
    descricao TEXT,
    id_maquina INT,
    FOREIGN KEY (id_maquina) REFERENCES Maquinas(id)
);


CREATE TABLE Registro_Suprimentos (
    id INT PRIMARY KEY,
    quantidade INT,
    data_necessidade DATE,
    codigo_componente INT,
    FOREIGN KEY (codigo_componente) REFERENCES Componentes(codigo)
);


CREATE TABLE Encomendas (
    numero INT PRIMARY KEY,
    data_inclusao DATE,
    valor_total DECIMAL(10, 2),
    valor_desconto DECIMAL(10, 2),
    valor_liquido DECIMAL(10, 2),
    id_forma_pagamento INT,
    quantidade_parcelas INT,
    codigo_cliente INT,
    FOREIGN KEY (codigo_cliente) REFERENCES Clientes(codigo)
);


CREATE TABLE Produtos_Encomendas (
    id INT PRIMARY KEY,
    numero_encomenda INT,
    codigo_produto INT,
    quantidade INT,
    FOREIGN KEY (numero_encomenda) REFERENCES Encomendas(numero),
    FOREIGN KEY (codigo_produto) REFERENCES Produtos(codigo)
);


CREATE TABLE Formas_Pagamento (
    id INT PRIMARY KEY,
    tipo_pagamento VARCHAR(255)
);

