drop database db_cds;

create database db_cds;

use db_cds;

create table artistas(
cod_art int not null,
nome_art varchar(100) not null unique,
primary key(cod_art)
);

create table gravadoras(
cod_grav int not null,
nome_grav varchar(50) not null unique,
primary key(cod_grav)
);

create table categorias(
cod_cat int not null,
nome_cat varchar(50) not null unique,
primary key (cod_cat)
);

create table estados(
sigla_est char(2) not null,
nome_est varchar(50) not null unique,
primary key (sigla_est)
);

create table cidades(
cod_cid int not null ,
sigla_est char(2) not null,
nome_cid varchar(50) not null,
primary key (cod_cid),
foreign key (sigla_est) references estados (sigla_est)
);

create table clientes(
cod_cli int not null,
cod_cid int not null,
nome_cli varchar(50) not null,
end_cli varchar(100) not null,
renda_cli decimal(9,2) not null default 0 check (renda_cli >= 0),
sexo_cli char(1) not null default 'F' check (sexo_cli in('F','M')), 
primary key(cod_cli),
foreign key (cod_cid) references cidades (cod_cid)
);

create table conjuge(
cod_conj int not null,
cod_cli int not null,
nome_conj varchar(50) not null,
renda_conj decimal(9,2) not null default 0 check(renda_conj >= 0),
sexo_conj char(1) not null default 'F' check (sexo_conj in('F','M')),
primary key(cod_conj),
foreign key (cod_cli) references clientes (cod_cli)
);

create table funcionarios(
cod_func int not null,
nome_func varchar(50) not null,
end_func varchar (100) not null,
sal_func decimal(9,2) not null default 0 check(sal_func >= 0),
sexo_func char(1) not null default 'F' check(sexo_func in('F', 'M')),
primary key (cod_func)
);

create table dependentes(
cod_dep int not null,
cod_func int not null,
nome_dep varchar(100) not null,
sexo_dep char(1) not null default'F' check(sexo_dep in('F','M')),
primary key (cod_dep),
foreign key (cod_func) references funcionarios(cod_func)
);

create table titulos(
cod_tit int not null,
cod_cat int not null,
cod_grav int not null,
nome_cd varchar(50) not null unique,
val_cd decimal(9,2) not null check(val_cd > 0),
qtd_estq int not null check(qtd_estq >= 0),
primary key (cod_tit),
foreign key (cod_cat) references categorias(cod_cat),
foreign key (cod_grav) references gravadoras(cod_grav)
);

create table pedidos(
num_ped int not null,
cod_cli int not null,
cod_func int not null,
data_ped datetime not null,
val_ped decimal(9,2) not null default 0 check(val_ped >= 0),
primary key(num_ped),
foreign key (cod_cli) references clientes(cod_cli),
foreign key (cod_func) references funcionarios(cod_func)
);

create table titulos_pedidos(
num_ped int not null,
cod_tit int not null,
qtd_cd int not null check(qtd_cd >= 1),
val_cd decimal(9,2) not null check(val_cd > 0),
foreign key (num_ped) references pedidos (num_ped),
foreign key (cod_tit) references titulos (cod_tit)
);

create table titulos_artistas(
cod_tit int not null,
cod_art int not null,
foreign key (cod_tit) references titulos (cod_tit),
foreign key (cod_art) references artistas (cod_art)
);

desc artistas;
desc gravadoras;
desc categorias;
desc estados;
desc cidades;
desc clientes;
desc conjuge;
desc funcionarios;
desc dependentes;
desc titulos;
desc pedidos;
desc titulos_pedidos;
desc titulos_artistas;

insert into artistas(cod_art, nome_art) values (1, 'MARISA MONTE');
insert into artistas(cod_art, nome_art) values (2, 'GILBERTO GIL');
insert into artistas(cod_art, nome_art) values (3, 'CAETANO VELOSO');
insert into artistas(cod_art, nome_art) values (4, 'MILTON NASCIMENTO');	
insert into artistas(cod_art, nome_art) values (5, 'LEGIÃO URBANA');
insert into artistas(cod_art, nome_art) values (6, 'THE BEATLES');
insert into artistas(cod_art, nome_art) values (7, 'RITA LEE');	

insert into gravadoras(cod_grav, nome_grav) values (1,'POLYGRAM');
insert into gravadoras(cod_grav, nome_grav) values (2,'EMI');
insert into gravadoras(cod_grav, nome_grav) values (3,'SOM LIVRE');
insert into gravadoras(cod_grav, nome_grav) values (4,'SOM MUSIC');

insert into categorias(cod_cat, nome_cat) values (1,'MPB');
insert into categorias(cod_cat, nome_cat) values (2,'TRILHA SONORA');
insert into categorias(cod_cat, nome_cat) values (3,'ROCK INTERNACIONAL');
insert into categorias(cod_cat, nome_cat) values (4,'ROCK NACIONAL');

insert into estados(sigla_est,nome_est) values ('SP','SÃO PAULO');	
insert into estados(sigla_est,nome_est) values ('MG','MINAS GERAIS');
insert into estados(sigla_est,nome_est) values ('RJ','RIO DE JANEIRO');
insert into estados(sigla_est,nome_est) values ('ES','ESPÍRITO SANTO');	

insert into cidades(cod_cid, sigla_est, nome_cid) values (1,'SP','SÃO PAULO');
insert into cidades(cod_cid, sigla_est, nome_cid) values (2, 'SP','SOROCABA');	
insert into cidades(cod_cid, sigla_est, nome_cid) values (3,'SP','JUNDIAÍ');
insert into cidades(cod_cid, sigla_est, nome_cid) values (4, 'SP','AMERICANA');
insert into cidades(cod_cid, sigla_est, nome_cid) values (5,'SP','ARARAQUARA');
insert into cidades(cod_cid, sigla_est, nome_cid) values (6, 'MG','OURO PRETO');
insert into cidades(cod_cid, sigla_est, nome_cid) values (7, 'ES','CACHOEIRA DO ITAPEMERIM');

insert into clientes(cod_cli, cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (1,1, 'JOSÉ NOGUEIRA', 'RUA A', 1500.00, 'M');
insert into clientes(cod_cli, cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (2,1, 'ÂNGELO PEREIRA', 'RUA B', 2000.00, 'M');
insert into clientes(cod_cli, cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (3,1, 'ALÉM MAR PARANHOS', 'RUA C', 1500.00, 'M');
insert into clientes(cod_cli, cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (4,1, 'CATARINA SOUZA', 'RUA D', 892.00, 'F');
insert into clientes(cod_cli, cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (5,1, 'VAGNER COSTA', 'RUA E', 950.00, 'M');
insert into clientes(cod_cli, cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (6,2, 'ANTENOR DA COSTA', 'RUA F', 1582.00, 'M');
insert into clientes(cod_cli, cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (7,2, 'MARIA AMÉLIA DE SOUZA', 'RUA G', 1152.00, 'F');
insert into clientes(cod_cli, cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (8,2, 'PAULO ROBERTO SILVA', 'RUA H', 3250.00, 'M');
insert into clientes(cod_cli, cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (9,3, 'FÁTIMA SOUZA', 'RUA I', 1632.00, 'F');
insert into clientes(cod_cli, cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (10,3, 'JOEL DA ROCHA', 'RUA J', 2000.00, 'M');	

insert into conjuge(cod_conj, cod_cli, nome_conj, renda_conj, sexo_conj) values (1,1,'CARLA NOGUEIRA', 2500.00, 'F');
insert into conjuge(cod_conj, cod_cli, nome_conj, renda_conj, sexo_conj) values (2,2,'EMILIA PEREIRA', 5500.00, 'F');
insert into conjuge(cod_conj, cod_cli, nome_conj, renda_conj, sexo_conj) values (3,6,'ALTIVA DA COSTA', 3000.00, 'F');
insert into conjuge(cod_conj, cod_cli, nome_conj, renda_conj, sexo_conj) values (4,7,'CARLOS DE SOUZA', 3250.00, 'M');	

insert into funcionarios(cod_func, nome_func, end_func, sal_func, sexo_func) values (1, 'VÂNIA GABRIELA PEREIRA', 'RUA A', 2500.00, 'F');
insert into funcionarios(cod_func, nome_func, end_func, sal_func, sexo_func) values (2, 'NORBERTO PEREIRA DA SILVA', 'RUA B', 300.00, 'M');
insert into funcionarios(cod_func, nome_func, end_func, sal_func, sexo_func) values (3, 'OLAVO LINHARES', 'RUA C', 580.00, 'M');
insert into funcionarios(cod_func, nome_func, end_func, sal_func, sexo_func) values (4, 'PAULA DA SILVA', 'RUA D', 3000.00, 'F');
insert into funcionarios(cod_func, nome_func, end_func, sal_func, sexo_func) values (5, 'ROLANDO ROCHA', 'RUA E', 2000.00, 'F');
insert into funcionarios(cod_func, nome_func, end_func, sal_func, sexo_func) values (7, 'FERNANDA PODEROSA', 'RUA ZERO', 2680.00, 'F');	

insert into dependentes(cod_dep, cod_func, nome_dep, sexo_dep) values (1, 1, 'ANA PEREIRA', 'F');
insert into dependentes(cod_dep, cod_func, nome_dep, sexo_dep) values (2, 1, 'ROBERTO PEREIRA', 'M');
insert into dependentes(cod_dep, cod_func, nome_dep, sexo_dep) values (3, 1, 'CELSO PEREIRA', 'M');
insert into dependentes(cod_dep, cod_func, nome_dep, sexo_dep) values (4, 3, 'BRISA LINHARES', 'F');
insert into dependentes(cod_dep, cod_func, nome_dep, sexo_dep) values (5, 3, 'MARI SOL LINHARES', 'F');
insert into dependentes(cod_dep, cod_func, nome_dep, sexo_dep) values (6, 4, 'SONIA DA SILVA', 'F');

insert into titulos(cod_tit, cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (1, 1, 1, 'TRIBALISTAS', 30.00, 1500);	
insert into titulos(cod_tit, cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (2, 1, 2, 'TROPICÁLIA', 50.00, 500);
insert into titulos(cod_tit, cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (3, 1, 1, 'AQUELE ABRAÇO', 50.00, 600);
insert into titulos(cod_tit, cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (4, 1, 2, 'REFAZENDA', 60.00, 1000);
insert into titulos(cod_tit, cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (5, 1, 3, 'TOTALMENTE DEMAIS', 50.00, 2000);
insert into titulos(cod_tit, cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (6, 1, 3, 'TRAVESSIA', 55.00, 500);
insert into titulos(cod_tit, cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (7, 1, 2, 'COURAGE', 30.00, 200);
insert into titulos(cod_tit, cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (8, 4, 3, 'LEGIÃO URBANA', 20.00, 100);
insert into titulos(cod_tit, cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (9, 3, 2, 'THE BEATLES', 30.00, 300);
insert into titulos(cod_tit, cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (10, 4, 1, 'RITA LEE', 30.00, 500);

insert into pedidos(num_ped, cod_cli, cod_func, data_ped, val_ped) values (1, 1, 2, '2002.05.02', 1500.00);
insert into pedidos(num_ped, cod_cli, cod_func, data_ped, val_ped) values (2, 3, 4, '2002.05.02', 50.00);
insert into pedidos(num_ped, cod_cli, cod_func, data_ped, val_ped) values (3, 4, 7, '2002.06.02', 100.00);
insert into pedidos(num_ped, cod_cli, cod_func, data_ped, val_ped) values (4, 1, 4, '2003.02.02', 200.00);
insert into pedidos(num_ped, cod_cli, cod_func, data_ped, val_ped) values (5, 7, 5, '2003.03.02', 300.00);
insert into pedidos(num_ped, cod_cli, cod_func, data_ped, val_ped) values (6, 4, 4, '2003.03.02', 100.00);
insert into pedidos(num_ped, cod_cli, cod_func, data_ped, val_ped) values (7, 5, 5, '2003.03.02', 50.00);
insert into pedidos(num_ped, cod_cli, cod_func, data_ped, val_ped) values (8, 8, 2, '2003.03.02', 50.00);
insert into pedidos(num_ped, cod_cli, cod_func, data_ped, val_ped) values (9, 2, 2, '2003.03.02', 2000.00);
insert into pedidos(num_ped, cod_cli, cod_func, data_ped, val_ped) values (10, 7, 1, '2003.03.02', 3000.00);

insert into titulos_artistas(cod_tit, cod_art) values (1, 1);
insert into titulos_artistas(cod_tit, cod_art) values (2, 2);
insert into titulos_artistas(cod_tit, cod_art) values (3, 2);
insert into titulos_artistas(cod_tit, cod_art) values (4, 2);
insert into titulos_artistas(cod_tit, cod_art) values (5, 3);
insert into titulos_artistas(cod_tit, cod_art) values (6, 4);
insert into titulos_artistas(cod_tit, cod_art) values (7, 4);
insert into titulos_artistas(cod_tit, cod_art) values (8, 5);
insert into titulos_artistas(cod_tit, cod_art) values (9, 6);
insert into titulos_artistas(cod_tit, cod_art) values (10, 7);	

insert into titulos_pedidos(num_ped, cod_tit, qtd_cd, val_cd) values (1, 1, 2, 30);
insert into titulos_pedidos(num_ped, cod_tit, qtd_cd, val_cd) values (1, 2, 3, 20);
insert into titulos_pedidos(num_ped, cod_tit, qtd_cd, val_cd) values (2, 1, 1, 50);
insert into titulos_pedidos(num_ped, cod_tit, qtd_cd, val_cd) values (2, 2, 3, 30);
insert into titulos_pedidos(num_ped, cod_tit, qtd_cd, val_cd) values (3, 1, 2, 40);
insert into titulos_pedidos(num_ped, cod_tit, qtd_cd, val_cd) values (4, 2, 3, 20);
insert into titulos_pedidos(num_ped, cod_tit, qtd_cd, val_cd) values (5, 1, 2, 25);
insert into titulos_pedidos(num_ped, cod_tit, qtd_cd, val_cd) values (6, 2, 3, 30);
insert into titulos_pedidos(num_ped, cod_tit, qtd_cd, val_cd) values (6, 3, 1, 35);
insert into titulos_pedidos(num_ped, cod_tit, qtd_cd, val_cd) values (7, 4, 2, 55);
insert into titulos_pedidos(num_ped, cod_tit, qtd_cd, val_cd) values (8, 1, 4, 60);
insert into titulos_pedidos(num_ped, cod_tit, qtd_cd, val_cd) values (9, 2, 3, 15);
insert into titulos_pedidos(num_ped, cod_tit, qtd_cd, val_cd) values (10, 7, 2, 15);	

select * from artistas;
select * from gravadoras;
select * from categorias;
select * from estados;
select * from cidades;
select * from clientes;
select * from conjuge;
select * from funcionarios;
select * from dependentes;
select * from titulos;
select * from pedidos; 
select * from titulos_artistas;
select * from titulos_pedidos;


-- 1. Selecione o nome dos CDs e o nome da gravadora de cada CD.

select tit.nome_cd as 'Nome do CD', grav.nome_grav as 'Nome da gravadora' from titulos as tit left join gravadoras as grav on tit.cod_grav = grav.cod_grav;

 

-- 2. Selecione o nome dos CDs e o nome da categoria de cada CD.

select tit.nome_cd as 'Nome do CD', cat.nome_cat as 'Código da categoria' from Titulos as tit right join Categorias as cat on tit.cod_cat = cat.cod_cat;

 

-- 3. Selecione o nome dos CDs, o nome das gravadoras de cada CD e o nome da categoria de cada CD.

select tit.nome_cd as 'Nome dos CDs', grav.nome_grav as 'Nome das gravadoras', cat.nome_cat as 'Nome da categoria' from Titulos as tit right join Categorias as cat on tit.cod_cat = cat.cod_cat right join Gravadoras as grav on grav.cod_grav = tit.cod_grav;

 

-- 4.Selecione o nome dos clientes e os títulos dos CDs vendidos em cada pedido que o cliente fez.

select cli.nome_cli as 'Nome do cliente', tit.nome_cd as 'Títulos dos CDs', ped.num_ped as 'Pedido' from Titulos as tit right join titulos_pedidos as pedi on tit.cod_tit = pedi.cod_tit right join Pedidos as ped on ped.num_ped = pedi.num_ped right join Clientes as cli on cli.cod_cli = ped.cod_cli;

 

-- 5. Selecione o nome do funcionário, número, data e valor dos pedidos que este funcionário registrou, além do nome do cliente que está fazendo o pedido.

select func.nome_func as 'Nome do funcionário', ped.num_ped as 'Número do pedido', ped.data_ped as 'Data do pedido', ped.val_ped as 'Valor do pedido', cli.nome_cli as 'Nome do cliente' from Clientes as cli right join Pedidos as ped on cli.cod_cli = ped.cod_cli right join Funcionarios as func on func.cod_func = ped.cod_func;

 

-- 6.Selecione o nome dos funcionários e o nome de todos os dependentes de cada funcionário.

select func.nome_func as 'Nome do funcionário', dep.nome_dep as 'Nome dos dependentes' from Dependentes as dep right join Funcionarios as func on dep.cod_func = func.cod_func;

 

-- 7. Selecione o nome dos clientes e o nome dos cônjuges de cada cliente.

select cli.nomeCli as 'Nome do cliente', conj.nomeConj as 'Nome do cônjuge' from tbConjuge as conj left join tbClientes as cli on conj.codCli = cli.codCli;

 

-- 8. Selecione o nome de todos os clientes. Se estes possuem cônjuges, mostrar os nomes de seus cônjuges também.

select cli.nomeCli as 'Nome do cliente', conj.nomeConj as 'Nome do cônjuge' from tbConjuge as conj right join tbClientes as cli on conj.codCli = cli.codCli;

 

-- 9. Selecione nome do cliente, nome do cônjuge, número do pedido que cada cliente fez, valor de cada pedido que cada cliente fez e código do funcionário que atendeu a cada pedido.

select cli.nomeCli as 'Nome do cliente', conj.nomeConj as 'Nome do cônjuge', ped.numPed as 'Número do pedido', ped.valPed as 'Valor do pedido', func.codFunc as 'Código do funcionário' from tbFuncionarios as func right join tbPedidos as ped on func.codFunc = ped.codFunc left join tbClientes as cli on ped.codCli = cli.codCli left join tbConjuge as conj on conj.codCli = cli.codCli;