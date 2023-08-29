drop database dbMercadoSA;

create database dbMercadoSA;

use dbMercadoSA;

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar (100) not null,
email varchar (100),
CPF char (14) not null unique, 
salario decimal (9,2) default 0 check (salario >= 0),
sexo char (1) default 'F'check (sexo in( 'F', 'M')),
primary key(codFunc)
);



create table tbClientes(
codCliente int not null auto_increment,
nome varchar (100) not null,
email varchar (100),
telefone char (10),
primary key (codCliente)
);


create table tbFornecedores(
codForn int not null auto_increment,
nome varchar (100) not null,
emailForn varchar (100),
cnpj char (18) not null unique,
primary key (codForn)
);

create table tbUsuarios(
codUser int not null auto_increment,
nome varchar (50) not null,
senha varchar(20) not null,
codFunc int not null,
primary key(codUser),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbProdutos(
codProduto int not null auto_increment,
descricao varchar (100), 
dataEntrada date,
horaEntrada time,
quantidade decimal (9,2),
valorUnit decimal (9,2),
codForn int not null,
primary key (codProduto), 
foreign key (codForn) references tbFornecedores (codForn)
);


create table tbVendas(
codVenda int not null auto_increment,
codUser int not null,
codCliente int not null,
codProduto int not null,
dataVenda date,
horarioDaVenda time,
quantidadeVenda decimal (9,2),
valorTotal decimal (9,2),
primary key (codVenda),
foreign key (codUser) references tbUsuarios (codUser),
foreign key (codCliente) references tbClientes (codCliente),
foreign key (codProduto) references tbProdutos (codProduto)
);



desc tbFuncionarios;
desc tbClientes;
desc tbFornecedores;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;

-- inserir registros nas tabelas
insert into tbFuncionarios(nome,email,CPF,salario,sexo)values('Fernanda Souza','souzafe13@gmail.com','316.785.498-78',150000.00,'F');
insert into tbFuncionarios(nome,email,CPF,salario,sexo)values('Jubileu Silva','silvajubileu@gmail.com','161.108.238-21',150000.00,'M');	
insert into tbClientes(nome,email,telefone)values('Renata Souza Borges','fiscal@borgesesouzacontabil.com.br','3452-2014');
insert into tbFornecedores(nome,emailForn,cnpj)values('Fazenda Bang Bang','fazendabangbagn@fazendabangbang.com.br','01.001.001-0001-01');
insert into tbUsuarios(nome,senha,codFunc)values('Fernanda.Souza','1234',1);
insert into tbUsuarios(nome,senha,codFunc)values('Jubileu.Silva','4321',2);	
insert into tbProdutos(descricao,dataEntrada,horaEntrada, quantidade,valorUnit,codForn)values('banana','2023/08/10','16:53:53',10,5.50,1);
insert into tbProdutos(descricao,dataEntrada,horaEntrada, quantidade,valorUnit,codForn)values('morango','2023/08/09','09:10:59',100,20.99,1);
insert into tbProdutos(descricao,dataEntrada,horaEntrada, quantidade,valorUnit,codForn)values('bicicleta','2023/08/01','07:30:59',3,599.99,1);
insert into tbVendas(codUser,codCliente,codProduto,dataVenda,quantidadeVenda,valorTotal)values(1,1,2,'2023/08/10',10,50.00);
	
select * from tbFuncionarios;
select * from tbClientes;
select * from tbUsuarios;
select * from tbProdutos;
select * from tbVendas;

-- inner joy
select usu.nome as 'Nome de Usuário', func.nome as 'Nome de Funcionário', func.email as 'E-mail do Funcionário' from tbUsuarios as usu inner join tbFuncionarios as func on usu.codFunc = func.codFunc;

select forn.nome, forn.cnpj, prod.descricao from tbProdutos as prod inner join tbFornecedores as forn on prod.codForn = forn.codForn;

select cli.nome as 'Nome do Cliente', cli.email as 'E-mail do Cliente', cli.telefone as 'Telefone do Cliente', vend.dataVenda as 'Data da Venda', vend.valorTotal as 'Valor Total da Venda' from tbVendas as vend inner join tbClientes as Cli on vend.codCliente = cli.codCliente;

select cli.nome, cli.email, prod.descricao, vend.dataVenda  from tbVendas as vend inner join tbClientes as cli on vend.codCliente = cli.codCliente inner join tbProdutos as prod on vend.codProduto = prod.codProduto where vend.codVenda = 1;

select cli.nome, cli.email, prod.descricao, vend.dataVenda  from tbVendas as vend inner join tbClientes as cli on vend.codCliente = cli.codCliente inner join tbProdutos as prod on vend.codProduto = prod.codProduto where prod.descricao like '%b%';

-- perguntando pra tabela de usuários nome do usuário, nome do funcionário, data da venda, quantidade vendida, valor total da venda

select  user.nome as 'Nome do Usuário', func.nome as 'Nome do Funcionário', vend.dataVenda as 'Data da Venda', vend.quantidadeVenda 'Quantidade Vendida', vend.valorTotal 'Total de vendas' from tbFuncionarios as func inner join tbUsuarios as user on func.codFunc = user.codFunc inner join tbVendas as vend on vend.codUser = user.codUser where user.nome like '%j%';

-- Perguntando para tabela de clientes: nome do cliente, data da venda, nome do produto, nome do fornecedor.

-- cliente pra venda, venda pra produtos, produtos para fornecedor
select cli.nome, prod.descricao, vend.dataVenda, forn.nome from tbFornecedores as forn inner join tbProdutos as prod on  forn.codForn = prod.codForn inner join tbVendas as vend on prod.codProduto = vend.codProduto inner join tbClientes as cli on cli.codCliente = vend.codCliente;

-- perguntando pra tabela de funcionarios: nome do funcionário, nome do usuário, data da venda, valor total, nome do produto, data da entrada, nome de fornecedor, cnpj do fornecedor

select func.nome as 'Nome do Funcionário', user.nome as 'Usuário',  vend.dataVenda as 'Data da Venda', vend.valorTotal as 'Valor Total da Venda', prod.descricao as 'Descrição do Produto',prod.dataEntrada as 'Data de Entrada', forn.nome as 'Nome de Fornecedor', forn.cnpj as 'CNPJ do Fornecedor' from tbFornecedores as forn inner join tbProdutos as prod on  forn.codForn = prod.codForn inner join tbVendas as vend on prod.codProduto = vend.codProduto inner join tbUsuarios as user on user.codUser = vend.codUser inner join tbFuncionarios as func on func.codFunc = user.codFunc;

-- perguntar para tbfuncionarios quais os produtos cadastrados e quantidade

-- left join 

select prod.descricao as 'Descrição dos produtos de verdura', prod.quantidade as 'quantidade de frutas do mercadinho' from tbFuncionarios as func left join tbProdutos as prod on func.codFunc = prod.codProduto;

-- right join 

select prod.descricao, prod.quantidade from tbFuncionarios as func right join tbProdutos as prod on func.codFunc = prod.codProduto;
