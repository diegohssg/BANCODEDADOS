SELECT 
    c.nome, co.numero_conta, co.saldo_atual,
    t.data_hora, tt.descricao AS tipo, t.valor, t.observacao
FROM CLIENTE c
JOIN CONTA co ON c.id_cliente = co.id_cliente
LEFT JOIN TRANSACAO t ON co.id_conta = t.id_conta_origem OR co.id_conta = t.id_conta_destino
LEFT JOIN TIPO_TRANSACAO tt ON t.id_tipo_transacao = tt.id_tipo_transacao
WHERE c.cpf = '123.456.789-00'
ORDER BY t.data_hora DESC
LIMIT 10;

-- Consulta 2: Top 3 clientes com maior saldo
SELECT 
    c.nome, c.cpf, 
    SUM(co.saldo_atual) as total_saldo,
    COUNT(co.id_conta) as qtd_contas
FROM CLIENTE c
JOIN CONTA co ON c.id_cliente = co.id_cliente
WHERE co.status_conta = 'ativa'
GROUP BY c.id_cliente, c.nome, c.cpf
ORDER BY total_saldo DESC
LIMIT 3;

-- Consulta 3: Resumo transações por tipo (últimos 30 dias)
SELECT 
    tt.descricao,
    COUNT(*) as qtd_transacoes,
    SUM(t.valor) as total_valor,
    AVG(t.valor) as valor_medio
FROM TRANSACAO t
JOIN TIPO_TRANSACAO tt ON t.id_tipo_transacao = tt.id_tipo_transacao
WHERE t.data_hora >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
GROUP BY tt.id_tipo_transacao, tt.descricao
ORDER BY total_valor DESC;

-- Consulta 4: Contas bloqueadas
SELECT 
    c.nome, co.numero_conta, co.saldo_atual, co.status_conta,
    tc.descricao as tipo_conta
FROM CONTA co
JOIN CLIENTE c ON co.id_cliente = c.id_cliente
JOIN TIPO_CONTA tc ON co.id_tipo_conta = tc.id_tipo_conta
WHERE co.status_conta = 'bloqueada';

-- Consulta 5: Histórico transferências
SELECT 
    t.data_hora, t.valor,
    co_orig.numero_conta as origem,
    co_dest.numero_conta as destino,
    c_orig.nome as cliente_origem
FROM TRANSACAO t
JOIN TIPO_TRANSACAO tt ON t.id_tipo_transacao = tt.id_tipo_transacao
JOIN CONTA co_orig ON t.id_conta_origem = co_orig.id_conta
LEFT JOIN CONTA co_dest ON t.id_conta_destino = co_dest.id_conta
LEFT JOIN CLIENTE c_orig ON co_orig.id_cliente = c_orig.id_cliente
WHERE tt.descricao = 'transferencia'
ORDER BY t.data_hora DESC
LIMIT 5;