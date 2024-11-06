-- Tabela: Fornecedor
CREATE TABLE Fornecedor (
    codigo_fornecedor INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    pais_origem VARCHAR(100) NOT NULL,
    pessoa_contato VARCHAR(255),
    telefone VARCHAR(20),
    historico_fornecimento TEXT
);

-- Tabela: Produto
CREATE TABLE Produto (
    codigo_produto INT PRIMARY KEY,
    nome_produto VARCHAR(255) NOT NULL,
    descricao TEXT,
    especificacoes TEXT,
    unidade_medida VARCHAR(50),
    preco_unitario DECIMAL(10, 2),
    quantidade_estoque INT DEFAULT 0,
    localizacao_armazenagem VARCHAR(255),
    ponto_ressuprimento INT DEFAULT 0
);

-- Tabela: Pedido de Compra
CREATE TABLE PedidoCompra (
    numero_pedido INT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    data_entrega_esperada DATE NOT NULL,
    status_pedido VARCHAR(20) NOT NULL,
    codigo_fornecedor INT,
    FOREIGN KEY (codigo_fornecedor) REFERENCES Fornecedor(codigo_fornecedor)
);

-- Tabela Associativa: PedidoCompra_Produto
CREATE TABLE PedidoCompra_Produto (
    numero_pedido INT,
    codigo_produto INT,
    quantidade_solicitada INT,
    PRIMARY KEY (numero_pedido, codigo_produto),
    FOREIGN KEY (numero_pedido) REFERENCES PedidoCompra(numero_pedido),
    FOREIGN KEY (codigo_produto) REFERENCES Produto(codigo_produto)
);

-- Tabela: Recebimento de Materiais
CREATE TABLE RecebimentoMateriais (
    numero_recebimento INT PRIMARY KEY,
    data_recebimento DATE NOT NULL,
    quantidade_recebida INT,
    condicao_materiais VARCHAR(20),
    motivo_rejeicao TEXT,
    numero_pedido INT,
    FOREIGN KEY (numero_pedido) REFERENCES PedidoCompra(numero_pedido)
);

-- Tabela: Filial
CREATE TABLE Filial (
    codigo_filial INT PRIMARY KEY,
    nome_filial VARCHAR(255) NOT NULL,
    endereco_filial VARCHAR(255) NOT NULL,
    capacidade_armazenagem INT
);

-- Tabela Associativa: DistribuicaoFilial_Produto
CREATE TABLE DistribuicaoFilial_Produto (
    codigo_distribuicao INT,
    codigo_produto INT,
    quantidade_transferida INT,
    PRIMARY KEY (codigo_distribuicao, codigo_produto),
    FOREIGN KEY (codigo_distribuicao) REFERENCES DistribuicaoFilial(codigo_distribuicao),
    FOREIGN KEY (codigo_produto) REFERENCES Produto(codigo_produto)
);

-- Tabela: Distribuição para Filiais
CREATE TABLE DistribuicaoFilial (
    codigo_distribuicao INT PRIMARY KEY,
    data_transferencia DATE NOT NULL,
    codigo_filial INT,
    FOREIGN KEY (codigo_filial) REFERENCES Filial(codigo_filial)
);

