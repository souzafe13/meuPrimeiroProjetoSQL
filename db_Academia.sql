-- Apagando o banco de dados
drop database dbAcademia;
-- criando banco de dados
create database dbAcademia;
-- Acessando banco de dados
use dbAcademia;
-- Visualizar banco de dados
show database;
-- Criando tabelas 
create table tbUsuarios(
codigo int,
nome varchar(50),
senha varchar(50)
);
create table tbFuncionarios(
codigo int,
nome varchar(100),
email varchar(100),
cpf char(14)
);
create table tbTelefones(
codigo int,
nome varchar(50),
telefone char(15)
);
create table tbDependentes(
codigo int,
nomeDoDependente varchar(100),
cpf char(14)
);
-- visualizar as tabelas criadas
show tables;
-- visuzalizar a estrutura da tabela
desc tbUsuarios;
desc tbFuncionarios;
desc tbTelefones;
desc tbDependentes;

