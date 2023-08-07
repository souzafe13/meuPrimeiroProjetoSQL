-- apagar banco de dados
drop database dbLoterica;

-- criar bando de dados
create database dbLoterica;

-- acessando banco de dados
use dbLoterica;

-- visualizar o banco de dados
show databases;

-- criar as tabelas do banco de dados
create table tbJogos(
codDoJogo int,
nomeDoJogo varchar(33),
valorDoJogo decimal (5,2),
dataDoJogo date
);	

-- visualizando as tabelas
show tables;

-- visualizando a estrutura da tabela
desc tbJogos;

-- inserindo/cadastrar registros na tabela
insert into tbJogos(codDoJogo, nomeDoJogo, valorDoJogo, dataDoJogo )values(100, 'Mega-Sena', 5.00, '2023/08/04');
insert into tbJogos(codDoJogo, nomeDoJogo, valorDoJogo, dataDoJogo )values(200, 'Lotofácil', 3.50, '2023/08/31');
insert into tbJogos(codDoJogo, nomeDoJogo, valorDoJogo, dataDoJogo )values(300, 'Quina', 2.00, '2023/10/01');
insert into tbJogos(codDoJogo, nomeDoJogo, valorDoJogo, dataDoJogo )values(400, 'Lotomania', 1.50, '2023/08/12');
insert into tbJogos(codDoJogo, nomeDoJogo, valorDoJogo, dataDoJogo )values(500, 'Timemania', 3.50, '2023/08/31');
insert into tbJogos(codDoJogo, nomeDoJogo, valorDoJogo, dataDoJogo )values(600, 'Dupla-Sena', 12.90, '2023/12/01');
insert into tbJogos(codDoJogo, nomeDoJogo, valorDoJogo, dataDoJogo )values(700, 'Federal', 8.00, '2023/08/01');
insert into tbJogos(codDoJogo, nomeDoJogo, valorDoJogo, dataDoJogo )values(800, 'Loteca', 1.95, '2023/08/23');
insert into tbJogos(codDoJogo, nomeDoJogo, valorDoJogo, dataDoJogo )values(900, 'Dia de sorte', 6.90, '2023/09/05');
insert into tbJogos(codDoJogo, nomeDoJogo, valorDoJogo, dataDoJogo )values(1000, 'Super 7', 5.00, '2023/08/04');
insert into tbJogos(codDoJogo, nomeDoJogo, valorDoJogo, dataDoJogo )values(1100, 'Milionária', 5.00, '2023/12/31');	

-- alterando registros das tabelas
update tbJogos set nomeDoJogo = 'Mega-Sena Milionária', valorDoJogo = 25.90 where codDoJogo = 100;
update tbJogos set nomeDoJogo = 'Loteca semanal', valorDoJogo = 21.95 where codDoJogo = 800;

-- Visualizar os registros alterados
select * from tbJogos;

-- apagar os registros da tabela
delete from tbJogos where codDoJogo = 1100;
delete from tbJogos where codDoJogo = 300;
delete from tbJogos where codDoJogo = 700;