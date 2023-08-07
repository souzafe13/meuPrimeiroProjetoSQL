-- apagar banco de dados
drop database db_Manicure;

-- criar bando de dados
create database db_Manicure;

-- acessando banco de dados
use db_Manicure;

-- visualizar o banco de dados
show databases;

-- criar as tabelas do banco de dados
create table tbProdutos(
codProd int,
descricao varchar(100),
quantidade decimal (9,2),
dataEntrada date,
valorUnit decimal (9,2)
);	

-- visualizando as tabelas
show tables;

-- visualizando a estrutura da tabela
desc tbProdutos;

-- inserindo/cadastrar registros na tabela
insert into tbProdutos(codProd, descricao, quantidade, dataEntrada, valorUnit)values(1, 'Alicate de unha', 10, '2023/08/01', 5.50);
insert into tbProdutos(codProd, descricao, quantidade, dataEntrada, valorUnit)values(10, 'Esmalte vermelho', 100, '2023/07/01', 3.75);
insert into tbProdutos(codProd, descricao, quantidade, dataEntrada, valorUnit)values(150, 'Esmalte de renda', 250, '2023/01/11', 4.25);
insert into tbProdutos(codProd, descricao, quantidade, dataEntrada, valorUnit)values(18, 'Palito de madeira', 610, '2023/05/25', 0.90);
insert into tbProdutos(codProd, descricao, quantidade, dataEntrada, valorUnit)values(6, 'Unha', 610, '2023/05/25', 0.90);
insert into tbProdutos(codProd, descricao, quantidade, dataEntrada, valorUnit)values(7, 'Postiça', 610, '2023/05/25', 0.90);


-- Visualizar os registros da tabela
select * from tbProdutos;

-- alterando registros das tabelas
update tbProdutos set descricao = 'Palito de unha médio', valorUnit = 1.35 where codProd = 6;
update tbProdutos set descricao = 'Unha postiça média', valorUnit = 10.99 where codProd = 7;

-- Visualizar os registros alterados
select * from tbProdutos;

-- apagar registros das tabelas
delete from tbProdutos where codProd = 7;

-- Visualizar os registros alterados
select * from tbProdutos;	
