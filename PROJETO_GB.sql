
CREATE TABLE Tb_FORNECEDOR (
                Cod_fornecedor VARCHAR NOT NULL,
                nome_contato VARCHAR NOT NULL,
                telefone_1 VARCHAR(15),
                telefone_2 VARCHAR(15),
                email VARCHAR(50) NOT NULL,
                CONSTRAINT Tb_FORNECEDOR_pk PRIMARY KEY (Cod_fornecedor)
);
COMMENT ON TABLE Tb_FORNECEDOR IS 'tabela fornecedor';
COMMENT ON COLUMN Tb_FORNECEDOR.telefone_1 IS 'DDD e numero';


CREATE TABLE Tb_PRODUTO (
                cod_produto VARCHAR NOT NULL,
                nome VARCHAR(20) NOT NULL,
                categoria VARCHAR(20) NOT NULL,
                valor_produto DECIMAL NOT NULL,
                Cod_fornecedor VARCHAR NOT NULL,
                CONSTRAINT Tb_PRODUTO_pk PRIMARY KEY (cod_produto)
);
COMMENT ON TABLE Tb_PRODUTO IS 'tabela dos produtos';
COMMENT ON COLUMN Tb_PRODUTO.cod_produto IS 'codigo referente ao produto';


CREATE TABLE Tb_ESTOQUE (
                cod_produto VARCHAR NOT NULL,
                Cod_fornecedor VARCHAR NOT NULL,
                qtd_estoque INTEGER NOT NULL,
                CONSTRAINT Tb_ESTOQUE_pk PRIMARY KEY (cod_produto, Cod_fornecedor)
);
COMMENT ON TABLE Tb_ESTOQUE IS 'tabela de estoque';
COMMENT ON COLUMN Tb_ESTOQUE.cod_produto IS 'codigo referente ao produto';


CREATE TABLE Tb_CLIENTE (
                cod_cliente VARCHAR(20) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                telefone_1 VARCHAR(15),
                telefone_2 VARCHAR(15),
                email VARCHAR(50) NOT NULL,
                rua VARCHAR(50) NOT NULL,
                bairro VARCHAR(50) NOT NULL,
                cidade VARCHAR(30) NOT NULL,
                estado VARCHAR(20) NOT NULL,
                cep VARCHAR(15) NOT NULL,
                CONSTRAINT Tb_CLIENTE_pk PRIMARY KEY (cod_cliente)
);
COMMENT ON TABLE Tb_CLIENTE IS 'Essa tabela referente aos clientes';
COMMENT ON COLUMN Tb_CLIENTE.cod_cliente IS 'tabela baseada em dados do cliente';
COMMENT ON COLUMN Tb_CLIENTE.nome IS 'nome e sobrenome';
COMMENT ON COLUMN Tb_CLIENTE.telefone_1 IS 'ddd e numero';
COMMENT ON COLUMN Tb_CLIENTE.telefone_2 IS 'ddd e telefone';


CREATE TABLE Tb_PESSOA_JURIDICA (
                cod_cliente VARCHAR(20) NOT NULL,
                cnpj VARCHAR(20) NOT NULL,
                ie VARCHAR(20) NOT NULL,
                CONSTRAINT Tb_PESSOA_JURIDICA_pk PRIMARY KEY (cod_cliente)
);
COMMENT ON COLUMN Tb_PESSOA_JURIDICA.cod_cliente IS 'tabela baseada em dados do cliente';


CREATE TABLE Tb_PESSOA_FISICA (
                cod_cliente VARCHAR(20) NOT NULL,
                cof VARCHAR(11) NOT NULL,
                rg VARCHAR(15) NOT NULL,
                CONSTRAINT Tb_PESSOA_FISICA_pk PRIMARY KEY (cod_cliente)
);
COMMENT ON COLUMN Tb_PESSOA_FISICA.cod_cliente IS 'tabela baseada em dados do cliente';


CREATE TABLE Tb_PEDIDO (
                Cod_pedido VARCHAR(10) NOT NULL,
                data DATE NOT NULL,
                valor_pedido DECIMAL NOT NULL,
                cod_cliente VARCHAR(20) NOT NULL,
                CONSTRAINT Tb_PEDIDO_pk PRIMARY KEY (Cod_pedido)
);
COMMENT ON TABLE Tb_PEDIDO IS 'tabela relacionada aos pedidos';
COMMENT ON COLUMN Tb_PEDIDO.cod_cliente IS 'tabela baseada em dados do cliente';


CREATE TABLE Tb_VENDEDOR (
                cod_vendedor VARCHAR(10) NOT NULL,
                Cod_pedido VARCHAR(10) NOT NULL,
                PEDIDO_Cod_pedido VARCHAR(10) NOT NULL,
                nome VARCHAR(20) NOT NULL,
                pontos_pedido INTEGER NOT NULL,
                CONSTRAINT Tb_VENDEDOR_pk PRIMARY KEY (cod_vendedor, Cod_pedido, PEDIDO_Cod_pedido)
);
COMMENT ON TABLE Tb_VENDEDOR IS 'tabela vendedor';
COMMENT ON COLUMN Tb_VENDEDOR.nome IS 'nome e sobrenome';


CREATE TABLE Tb_ITEM_PEDIDO (
                Cod_pedido VARCHAR(10) NOT NULL,
                cod_produto VARCHAR NOT NULL,
                qtd_pedido INTEGER NOT NULL,
                valor_item DECIMAL NOT NULL,
                CONSTRAINT Tb_ITEM_PEDIDO_pk PRIMARY KEY (Cod_pedido, cod_produto)
);
COMMENT ON TABLE Tb_ITEM_PEDIDO IS 'tabela com itens pedidos';
COMMENT ON COLUMN Tb_ITEM_PEDIDO.cod_produto IS 'codigo referente ao produto';


ALTER TABLE Tb_PRODUTO ADD CONSTRAINT Tb_FORNECEDOR_Tb_PRODUTO_fk
FOREIGN KEY (Cod_fornecedor)
REFERENCES Tb_FORNECEDOR (Cod_fornecedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_ESTOQUE ADD CONSTRAINT Tb_FORNECEDOR_Tb_ESTOQUE_fk
FOREIGN KEY (Cod_fornecedor)
REFERENCES Tb_FORNECEDOR (Cod_fornecedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_ITEM_PEDIDO ADD CONSTRAINT Tb_PRODUTO_Tb_ITEM_PEDIDO_fk
FOREIGN KEY (cod_produto)
REFERENCES Tb_PRODUTO (cod_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_ESTOQUE ADD CONSTRAINT Tb_PRODUTO_Tb_ESTOQUE_fk
FOREIGN KEY (cod_produto)
REFERENCES Tb_PRODUTO (cod_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_PEDIDO ADD CONSTRAINT Tb_CLIENTE_Tb_PEDIDO_fk
FOREIGN KEY (cod_cliente)
REFERENCES Tb_CLIENTE (cod_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_PESSOA_FISICA ADD CONSTRAINT Tb_CLIENTE_Tb_PESSOA_FISICA_fk
FOREIGN KEY (cod_cliente)
REFERENCES Tb_CLIENTE (cod_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_PESSOA_JURIDICA ADD CONSTRAINT Tb_CLIENTE_Tb_PESSOA_JURIDICA_fk
FOREIGN KEY (cod_cliente)
REFERENCES Tb_CLIENTE (cod_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_ITEM_PEDIDO ADD CONSTRAINT Tb_PEDIDO_Tb_ITEM_PEDIDO_fk
FOREIGN KEY (Cod_pedido)
REFERENCES Tb_PEDIDO (Cod_pedido)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_VENDEDOR ADD CONSTRAINT Tb_PEDIDO_Tb_VENDEDOR_fk
FOREIGN KEY (Cod_pedido)
REFERENCES Tb_PEDIDO (Cod_pedido)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_VENDEDOR ADD CONSTRAINT Tb_PEDIDO_Tb_VENDEDOR_fk1
FOREIGN KEY (PEDIDO_Cod_pedido)
REFERENCES Tb_PEDIDO (Cod_pedido)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
