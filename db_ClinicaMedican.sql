-- Fernanda Souza
-- Apagando banco de dados
drop database dbClinicaMedica;
-- Criando banco de dados
create database dbClinicaMedica;
-- Acessando banco de dados
use dbClinicaMedica;
-- Visualizar Banco de Dados
show databases;
-- Criando tabelas
create table tbMedicos(
idMedico int,
nomeMedico varchar(45),
telefoneMedico varchar(11)
);
create table tbConsultas(
idConsulta int,
id_consulta datetime,
Medico_idMedico int,
Paciente_idPaciente int,
ReceitaMedica_ReceitaMedica int
);
create table tbPaciente(
idPaciente int,
nomePaciente varchar(45),
telefonePaciente varchar(9),
convenio varchar(45)
);
create table tbReceitaMedica(
idReceitaMedica int,
descricao varchar(500)
);
desc tbMedicos;
desc tbConsultas;
desc tbPaciente;
desc tbReceitaMedica;