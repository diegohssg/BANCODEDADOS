INSERT INTO TRANSACAO (valor, observacao, id_tipo_transacao, id_conta_origem, id_conta_destino) VALUES
(500.00, 'Salário', 1, NULL, 1),                    -- Depósito João
(200.00, 'Compra mercado', 2, 2, NULL),             -- Saque Maria
(300.00, 'Transferência João→Pedro', 3, 1, 3);      -- Transferência

-- === UPDATES ===
-- 1. Depositar R$1000 na conta 12345-6
UPDATE CONTA 
SET saldo_atual = saldo_atual + 1000.00
WHERE numero_conta = '12345-6';

-- 2. Desbloquear conta do Pedro
UPDATE CONTA 
SET status_conta = 'ativa'
WHERE numero_conta = '22222-3';

-- 3. Atualizar dados do cliente Maria
UPDATE CLIENTE 
SET telefone = '(21)99999-8888', email = 'maria.nova@email.com'
WHERE cpf = '987.654.321-00';

-- === DELETES ===
-- 1. Remover transação específica (saque Maria)
DELETE FROM TRANSACAO 
WHERE observacao = 'Compra mercado';

-- 2. Remover TODAS transações de depósito de uma conta
DELETE FROM TRANSACAO 
WHERE id_conta_destino = 1 AND 
      id_tipo_transacao = (SELECT id_tipo_transacao FROM TIPO_TRANSACAO WHERE descricao = 'deposito');

-- 3. Remover transações antigas (mais de 90 dias)
DELETE FROM TRANSACAO 
WHERE data_hora < DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY);