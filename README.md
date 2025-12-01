# 💳 Sistema BancoFácil - Modelagem Banco de Dados

Projeto acadêmico de modelagem de banco de dados relacional para um banco digital de varejo. Implementa operações de depósito, saque e transferência com DER normalizado até 3FN.

[![DER BancoFácil](DER_BancoFacil.png)][generated_image:94]

## 📋 Tecnologias Utilizadas

- **SGBD**: MySQL 8.0+ / PostgreSQL 13+
- **Linguagem**: SQL Padrão ANSI
- **Ferramentas**: MySQL Workbench, pgAdmin, DBeaver
- **Modelagem**: Notação Pé de Galinha (Crow's Foot)

## 🗄️ Estrutura do Banco (5 Tabelas)

| Entidade | Registros | Descrição |
|----------|-----------|-----------|
| `CLIENTE` | 3 | Pessoas físicas |
| `CONTA` | 4 | Corrente/Poupança |
| `TRANSACAO` | 3 | Movimentações |
| `TIPO_CONTA` | 2 | Corrente/Poupança |
| `TIPO_TRANSACAO` | 3 | Depósito/Saque/Transferência |

## 🚀 Instruções de Execução

### Pré-requisitos

Instalar MySQL ou PostgreSQL
MySQL: https://dev.mysql.com/downloads/
PostgreSQL: https://www.postgresql.org/download/
