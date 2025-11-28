CREATE TABLE IF NOT EXISTS clientes (
    id TEXT PRIMARY KEY,
    nome TEXT NOT NULL,
    telefone TEXT NOT NULL,
    email TEXT,
    endereco TEXT
);

CREATE TABLE IF NOT EXISTS produtos (
    id TEXT PRIMARY KEY,
    categoria TEXT NOT NULL,
    nome TEXT NOT NULL,
    descricao TEXT,
    preco NUMERIC(10,2) NOT NULL,
    meta TEXT
);

CREATE TABLE IF NOT EXISTS pedidos (
    id TEXT PRIMARY KEY,
    cliente_id TEXT REFERENCES clientes(id),
    cliente_nome TEXT,
    total NUMERIC(10,2),
    forma_pagamento TEXT,
    troco_para NUMERIC(10,2),
    data_iso TEXT
);

CREATE TABLE IF NOT EXISTS itens_pedido (
    id SERIAL PRIMARY KEY,
    pedido_id TEXT REFERENCES pedidos(id),
    produto_id TEXT,
    nome TEXT,
    quantidade INTEGER,
    preco_unit NUMERIC(10,2),
    observacao TEXT
);

CREATE TABLE IF NOT EXISTS avaliacoes (
    id SERIAL PRIMARY KEY,
    cliente_nome TEXT,
    nota INT,
    data_hora TEXT
);

-- Inserindo produtos padrões da pizzaria
INSERT INTO produtos (id, categoria, nome, descricao, preco) VALUES
('p1', 'Pizza', 'Pizza Margherita Meia', 'Meia', 32.90),
('p2', 'Pizza', 'Pizza Margherita Inteira', 'Inteira', 42.90),
('p3', 'Pizza', 'Pizza Calabresa Meia', 'Meia', 32.90),
('p4', 'Pizza', 'Pizza Calabresa Inteira', 'Inteira', 42.90),
('p5', 'Pizza', 'Pizza Quatro Queijos Meia', 'Meia', 37.90),
('p6', 'Pizza', 'Pizza Quatro Queijos Inteira', 'Inteira', 47.90),
('p7', 'Pizza', 'Pizza Frango com Catupiry Meia', 'Meia', 37.90),
('p8', 'Pizza', 'Pizza Frango com Catupiry Inteira', 'Inteira', 47.90),
('b1', 'Bebida', 'Coca-Cola 2L', '2L', 12.00),
('b2', 'Bebida', 'Guaraná Antarctica 2L', '2L', 11.00),
('b3', 'Bebida', 'Água Mineral 500ml', '500ml', 4.00),
('b4', 'Bebida', 'Suco de Laranja 500ml', '500ml', 8.00),
('o1', 'Outros', 'Batata Frita Média', 'Média', 14.00),
('o2', 'Outros', 'Batata Frita Grande', 'Grande', 18.00);
