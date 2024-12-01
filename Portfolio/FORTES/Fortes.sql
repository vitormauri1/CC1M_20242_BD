-- Criar tabela Funcionários
CREATE TABLE IF NOT EXISTS funcionarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    INDEX idx_email (email)
);

-- Criar tabela Donatários
CREATE TABLE IF NOT EXISTS donatarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    tipo VARCHAR(100) NOT NULL,
    INDEX idx_email (email)
);

-- Criar tabela Projetos
CREATE TABLE IF NOT EXISTS projetos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    status ENUM('rascunho', 'ativo', 'concluido', 'cancelado') NOT NULL,
    funcionario_id INT NOT NULL,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id),
    INDEX idx_status (status)
);

-- Criar tabela Reuniões
CREATE TABLE IF NOT EXISTS reunioes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_hora DATETIME NOT NULL,
    projeto_id INT NOT NULL,
    FOREIGN KEY (projeto_id) REFERENCES projetos(id),
    INDEX idx_data_hora (data_hora)
);

-- Criar tabela Editais
CREATE TABLE IF NOT EXISTS editais (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_publicacao DATETIME NOT NULL,
    data_encerramento DATETIME NOT NULL,
    status ENUM('rascunho', 'publicado', 'encerrado') NOT NULL,
    funcionario_id INT NOT NULL,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id),
    INDEX idx_status (status),
    INDEX idx_datas (data_publicacao, data_encerramento)
);

-- Criar tabela Relatórios
CREATE TABLE IF NOT EXISTS relatorios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    conteudo TEXT,
    data_criacao DATETIME NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    projeto_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    FOREIGN KEY (projeto_id) REFERENCES projetos(id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id),
    INDEX idx_data_criacao (data_criacao),
    INDEX idx_tipo (tipo)
);

