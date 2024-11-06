
CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    status_fidelidade ENUM('Não Participante', 'Participante', 'VIP') DEFAULT 'Não Participante'
);


CREATE TABLE Fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cnpj VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    endereco VARCHAR(255) NOT NULL
);


CREATE TABLE Produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT DEFAULT 0,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id) ON DELETE SET NULL
);


CREATE TABLE Vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10, 2) NOT NULL,
    status ENUM('Pendente', 'Concluída', 'Cancelada') DEFAULT 'Pendente',
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id) ON DELETE CASCADE
);


CREATE TABLE Itens_Venda (
    id_venda INT,
    id_produto INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_venda, id_produto),
    FOREIGN KEY (id_venda) REFERENCES Vendas(id) ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES Produtos(id) ON DELETE CASCADE
);


CREATE TABLE Pagamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT,
    data_pagamento DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    status ENUM('Pendente', 'Pago') DEFAULT 'Pendente',
    FOREIGN KEY (id_venda) REFERENCES Vendas(id) ON DELETE CASCADE
);
