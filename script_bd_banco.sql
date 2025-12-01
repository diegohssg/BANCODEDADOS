CREATE TABLE TIPO_CONTA (
    id_tipo_conta INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(20) UNIQUE
);

CREATE TABLE TIPO_TRANSACAO (
    id_tipo_transacao INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(20) UNIQUE
);

CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    data_nascimento DATE,
    endereco VARCHAR(200),
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE CONTA (
    id_conta INT PRIMARY KEY AUTO_INCREMENT,
    numero_conta VARCHAR(20) UNIQUE,
    data_abertura DATE,
    saldo_atual DECIMAL(15,2) DEFAULT 0.00,
    status_conta ENUM('ativa','bloqueada','encerrada') DEFAULT 'ativa',
    id_cliente INT,
    id_tipo_conta INT,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_tipo_conta) REFERENCES TIPO_CONTA(id_tipo_conta)
);

CREATE TABLE TRANSACAO (
    id_transacao INT PRIMARY KEY AUTO_INCREMENT,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor DECIMAL(15,2),
    observacao VARCHAR(255),
    id_tipo_transacao INT,
    id_conta_origem INT,
    id_conta_destino INT,
    FOREIGN KEY (id_tipo_transacao) REFERENCES TIPO_TRANSACAO(id_tipo_transacao),
    FOREIGN KEY (id_conta_origem) REFERENCES CONTA(id_conta),
    FOREIGN KEY (id_conta_destino) REFERENCES CONTA(id_conta)
);