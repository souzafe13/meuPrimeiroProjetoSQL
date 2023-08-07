-- Fernanda Souza
-- Apagando banco de dados
drop database db_smartFit;
-- Criando banco de dados
create database db_smartFit;
-- Acessando banco de dados
use db_smartFit;
-- Visualizar banco de dados
show databases;
-- criado tabelas
create table tbRegistro(
id_aluno int,
id_turma int,
ausencia int,
id_registro int
);
create table tbAluno(
matricula int,
data_matricula date,
nome varchar(45),
endereco varchar(45),
telefone varchar(45),
nascimento date,
altura float,
peso float, 
id_turma int
);
create table tbMonitor(
id_aluno int
);
create table tbInstrutor(
rg int,
nome varchar(45),
nascimento date,
titulacao varchar(45),
telefone varchar(45)
);
create table tbTurma(
id int,
quant_alunos int,
horario_aula datetime,
duracao_aula datetime,
data_inicio date,
data_fim date,
atividade int,
id_instrutor int,
id_monitor int
);
create table tbAtividade(
id int,
atividade varchar(45)
);
desc tbRegistro;
desc tbAluno;
desc tbMonitor;
desc tbInstrutor;
desc tbTurma;
desc tbAtividade;
