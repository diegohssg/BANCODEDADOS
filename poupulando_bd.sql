INSERT INTO TIPO_CONTA (descricao) VALUES ('corrente'), ('poupanca');
INSERT INTO TIPO_TRANSACAO (descricao) VALUES ('deposito'), ('saque'), ('transferencia');

INSERT INTO CLIENTE (nome, cpf, data_nascimento, endereco, telefone, email) VALUES 
('João Silva', '123.456.789-00', '1985-03-15', 'Rua A, 123, SP', '(11)99999-1111', 'joao@email.com'),
('Maria Santos', '987.654.321-00', '1990-07-22', 'Av B, 456, RJ', '(21)99999-2222', 'maria@email.com'),
('Pedro Oliveira', '111.222.333-44', '1978-11-10', 'Rua C, 789, SP', '(11)99999-3333', 'pedro@email.com');

INSERT INTO CONTA (numero_conta, data_abertura, saldo_atual, status_conta, id_cliente, id_tipo_conta) VALUES 
('12345-6', '2025-01-10', 1500.00, 'ativa', 1, 1),
('67890-1', '2025-02-15', 2500.75, 'ativa', 2, 2),
('11111-2', '2025-01-20', 800.50, 'ativa', 1, 1),
('22222-3', '2025-03-01', 3200.00, 'bloqueada', 3, 2);