-- Fernanda
drop database dbLivraria;
create database dbLivraria;
use dbLivraria;

create table tbGenero(
idGenero int not null,
descricao varchar (100),
primary key (idGenero)
);	

create table tbAutor(
idAutor int not null unique,
nome varchar (100) not null, 
email varchar (100),
primary key (idAutor)
);

create table tbCliente(
idCliente int not null,
nomeCliente varchar (100) not null,
telefoneCliente varchar (45),
primary key (idCliente)
);

create table tbLivro(
idLivro int not null,
idGenero int,
titulo varchar (100) not null,
preco float default 0 check (preco >= 0),
estoque int,
primary key (idLivro),
foreign key (idGenero) references tbGenero (idGenero)
);

create table tbEscreve(
idLivro int,
idAutor int,	
foreign key (idLivro) references tbLivro (idLivro),
foreign key (idAutor) references tbAutor (idAutor)
);

create table tbVenda(
idVenda int not null,
idCliente int,
data date,
total float,
primary key (idVenda),
foreign key (idCliente) references tbCliente (idCliente)
);

create table tbItens_da_venda(
idVenda int,
idLivro int,
qtd int,
subtotal varchar (45),
primary key (idVenda),
foreign key (idVenda) references tbVenda (idVenda),
foreign key (idLivro) references tbLivro (idLivro)
);

desc tbGenero;
desc tbAutor;
desc tbCliente;
desc tbLivro;
desc tbEscreve;
desc tbVenda;
desc tbItens_da_venda;

select * from tbGenero;
select * from tbAutor;
select * from tbCliente;
select * from tbLivro;
select * from tbEscreve;
select * from tbVenda;
select * from tbItens_da_venda;

insert into tbGenero (idGenero, descricao) values (1, 'drama');
insert into tbGenero (idGenero, descricao) values (2, 'terror');
insert into tbGenero (idGenero, descricao) values (3, 'conhecimentos gerais');
insert into tbGenero (idGenero, descricao) values (4, 'romance');
insert into tbGenero (idGenero, descricao) values (5, 'forense');
insert into tbGenero (idGenero, descricao) values (6, 'comédia');
insert into tbGenero (idGenero, descricao) values (7, 'mangá');
insert into tbGenero (idGenero, descricao) values (8, 'educação fundamental');
insert into tbGenero (idGenero, descricao) values (9, 'religioso');
insert into tbGenero (idGenero, descricao) values (10, 'história');

insert into tbAutor (idAutor, nome, email) values (600, 'Joana Rasputcha', 'Rasputcha@gmail.com');	
insert into tbAutor (idAutor, nome, email) values (601, 'Cid Leitão', 'leitaozinhodemamae@hotmail.com');
insert into tbAutor (idAutor, nome, email) values (602, 'Jurandir da Esquina', 'oterrordelas@yahoo.com.br');
insert into tbAutor (idAutor, nome, email) values (603, 'Jorge Amado', 'jorgin@icloud.com');
insert into tbAutor (idAutor, nome, email) values (604, 'Rui Barbosa', 'imprensa@editoraabril.com.br');
insert into tbAutor (idAutor, nome, email) values (605, 'Rafaela Maliah', 'rafinha@gmail.com');
insert into tbAutor (idAutor, nome, email) values (606, 'Tokunohiro', 'yakuza@hotmail.com');
insert into tbAutor (idAutor, nome, email) values (607, 'Andrea Biancardi', 'contato@editora.com');
insert into tbAutor (idAutor, nome, email) values (608, 'Marcelo Rossi', 'obombado@sojesusnacausa.com.br');
insert into tbAutor (idAutor, nome, email) values (609, 'Laurentino Gomes', '1808@gmail.com');

insert into tbCliente(idCliente, nomeCliente, telefoneCliente) values (300, 'José Aguiar', '11 3452-2014');	
insert into tbCliente(idCliente, nomeCliente, telefoneCliente) values (301, 'Ster Alencar', '11 4703-2435');
insert into tbCliente(idCliente, nomeCliente, telefoneCliente) values (302, 'Laura Gomes', '11 4148-2640');	
insert into tbCliente(idCliente, nomeCliente, telefoneCliente) values (303, 'Fernanda Maximiniano', '11 9 8263-2477');	
insert into tbCliente(idCliente, nomeCliente, telefoneCliente) values (304, 'Silvani Souza', '11 9 6996-0505');	
insert into tbCliente(idCliente, nomeCliente, telefoneCliente) values (305, 'Renata Maria', '11 9 8076-9794');	
insert into tbCliente(idCliente, nomeCliente, telefoneCliente) values (306, 'Edgar Borges', '11 9 8076-9793');	
insert into tbCliente(idCliente, nomeCliente, telefoneCliente) values (307, 'Fabrício Gianino', '11 4703-8596');	
insert into tbCliente(idCliente, nomeCliente, telefoneCliente) values (308, 'Emanoela Santos', '11 9 8263-3040');	
insert into tbCliente(idCliente, nomeCliente, telefoneCliente) values (309, 'Rafaela Sousa', '11 9 6077-5162');		

insert into tbLivro(idLivro, idGenero, titulo, preco, estoque) values (500, 1, 'O retorno dos que não foram', 59.90, 50);
insert into tbLivro(idLivro, idGenero, titulo, preco, estoque) values (501, 2, 'Meu vizinho', 89.90, 100);
insert into tbLivro(idLivro, idGenero, titulo, preco, estoque) values (502, 3, 'Pico do Jaraguá', 39.90, 150);
insert into tbLivro(idLivro, idGenero, titulo, preco, estoque) values (503, 4, 'O amante', 19.90, 30);
insert into tbLivro(idLivro, idGenero, titulo, preco, estoque) values (504, 5, 'Gunshot', 29.90, 4);
insert into tbLivro(idLivro, idGenero, titulo, preco, estoque) values (505, 6, 'One Punch Man', 69.90, 10);
insert into tbLivro(idLivro, idGenero, titulo, preco, estoque) values (506, 7, 'Death Note', 99.90, 50);
insert into tbLivro(idLivro, idGenero, titulo, preco, estoque) values (507, 8, 'Polegares', 119.90, 2);	
insert into tbLivro(idLivro, idGenero, titulo, preco, estoque) values (508, 9, 'Jacó', 9.90, 120);
insert into tbLivro(idLivro, idGenero, titulo, preco, estoque) values (509, 10, '1808', 79.90, 73);		

insert into tbEscreve(idLivro, idAutor) values (500, 600);
insert into tbEscreve(idLivro, idAutor) values (501, 601);
insert into tbEscreve(idLivro, idAutor) values (502, 602);
insert into tbEscreve(idLivro, idAutor) values (503, 603);
insert into tbEscreve(idLivro, idAutor) values (504, 604);
insert into tbEscreve(idLivro, idAutor) values (505, 605);
insert into tbEscreve(idLivro, idAutor) values (506, 606);
insert into tbEscreve(idLivro, idAutor) values (507, 607);
insert into tbEscreve(idLivro, idAutor) values (508, 608);
insert into tbEscreve(idLivro, idAutor) values (509, 609);

insert into tbVenda(idVenda, idCliente, data, total) values (400, 300, '2023/10/22', 18);
insert into tbVenda(idVenda, idCliente, data, total) values (401, 301, '2023/08/22', 10);
insert into tbVenda(idVenda, idCliente, data, total) values (402, 302, '2023/01/22', 160);
insert into tbVenda(idVenda, idCliente, data, total) values (403, 303, '2023/02/22', 13);
insert into tbVenda(idVenda, idCliente, data, total) values (404, 304, '2023/03/22', 19);
insert into tbVenda(idVenda, idCliente, data, total) values (405, 305, '2023/04/22', 27);
insert into tbVenda(idVenda, idCliente, data, total) values (406, 306, '2023/05/22', 3);
insert into tbVenda(idVenda, idCliente, data, total) values (407, 307, '2023/06/22', 1420);
insert into tbVenda(idVenda, idCliente, data, total) values (408, 308, '2023/07/22', 1);
insert into tbVenda(idVenda, idCliente, data, total) values (409, 309, '2023/09/22', 13);


insert into tbItens_da_venda(idVenda, idLivro, qtd, subtotal) values (400, 500, 1, 59.90);
insert into tbItens_da_venda(idVenda, idLivro, qtd, subtotal) values (401, 501, 2, 179.80);
insert into tbItens_da_venda(idVenda, idLivro, qtd, subtotal) values (402, 502, 3, 119.70);
insert into tbItens_da_venda(idVenda, idLivro, qtd, subtotal) values (403, 503, 4, 79.60);
insert into tbItens_da_venda(idVenda, idLivro, qtd, subtotal) values (404, 504, 5, 149.50);
insert into tbItens_da_venda(idVenda, idLivro, qtd, subtotal) values (405, 505, 6, 419.40);
insert into tbItens_da_venda(idVenda, idLivro, qtd, subtotal) values (406, 506, 7, 699.30);
insert into tbItens_da_venda(idVenda, idLivro, qtd, subtotal) values (407, 507, 8, 959.20);
insert into tbItens_da_venda(idVenda, idLivro, qtd, subtotal) values (408, 508, 9, 89.10);		
insert into tbItens_da_venda(idVenda, idLivro, qtd, subtotal) values (409, 509, 1, 79.90);

select * from tbGenero;
select * from tbAutor;
select * from tbCliente;
select * from tbLivro;
select * from tbEscreve;
select * from tbVenda;
select * from tbItens_da_venda;

update tbGenero set descricao = 'Artes' where idGenero = 1;
update tbGenero set descricao = 'Melancolia' where idGenero = 3;
update tbGenero set descricao = 'Direito Civil' where idGenero = 5;
update tbGenero set descricao = 'Ética' where idGenero = 7;
update tbGenero set descricao = 'Antropologia' where idGenero = 9;	
select * from tbGenero;	

update tbAutor set nome = 'Cid Moreira' where idAutor = 601;
update tbAutor set email = 'vozdeveludo@gmail.com' where idAutor = 601;
update tbAutor set nome = 'Eva Mendez' where idAutor = 606;
update tbAutor set email = 'evamendez@hotmail.com' where idAutor = 606;
update tbAutor set nome = 'Laurentino' where idAutor = 609;		
select * from tbAutor;	

update tbCliente set telefoneCliente = '55 9 9191-0909' where idCliente = 305;
update tbCliente set nomeCliente = 'Renata Borges da Costa' where idCliente = 305;
update tbCliente set telefoneCliente = '33 97788-9900' where idCliente = 309;
update tbCliente set nomeCliente = 'Shingiro Tanaka' where idCliente = 309;
update tbCliente set telefoneCliente = '45 3845-3500' where idCliente = 308;	
select * from tbCliente;

update tbLivro set titulo = 'O valor de um conselho', preco = 27.99, estoque = 3 where idLivro = 503;
update tbLivro set titulo = 'O amanhã', preco = 5.99, estoque = 14 where idLivro = 509;
update tbLivro set titulo = 'Canavial', preco = 109.99, estoque = 1 where idLivro = 506;
update tbLivro set titulo = 'O cortiço', preco = 7.99, estoque = 8 where idLivro = 504;
update tbLivro set titulo = 'Sublime', preco = 11.99, estoque = 66 where idLivro = 507;	
select * from tbLivro;

update tbEscreve set idLivro = 500 where idAutor = 603;
update tbEscreve set idLivro = 508 where idAutor = 604;
update tbEscreve set idAutor = 600 where idLivro = 503;
update tbEscreve set idLivro = 507 where idAutor = 602;
update tbEscreve set idLivro = 501 where idAutor = 607;	
select * from tbEscreve;	

update tbVenda set data = '2021/05/03', total = 17 where idVenda = 403;
update tbVenda set data = '2009/07/05', total = 1 where idVenda = 401;
update tbVenda set data = '1994/05/30', total = 3 where idVenda = 404;
update tbVenda set data = '2017/12/25', total = 300 where idVenda = 407;
update tbVenda set data = '2016/10/13', total = 13 where idVenda = 402;	
select * from tbVenda;	

update tbItens_da_venda set qtd = 19 where idVenda = 409;
update tbItens_da_venda set subtotal = 1985.80 where idVenda = 407;
update tbItens_da_venda set qtd = 0 where idVenda = 401;
update tbItens_da_venda set qtd = 33 where idVenda = 405;
update tbItens_da_venda set subtotal = 375.66 where idVenda = 406;	
select * from tbItens_da_venda;

delete from tbItens_da_venda where idLivro = 509;
delete from tbEscreve where idLivro = 509;
delete from tbLivro where idLivro = 509;
delete from tbGenero where idGenero = 10;

delete from tbItens_da_venda where idLivro = 500;
delete from tbEscreve where idLivro = 500;
delete from tbLivro where idLivro = 500;
delete from tbGenero where idGenero = 1;

delete from tbItens_da_venda where idLivro = 506;
delete from tbEscreve where idLivro = 506;
delete from tbLivro where idLivro = 506;
delete from tbGenero where idGenero = 7;

delete from tbItens_da_venda where idLivro = 502;
delete from tbEscreve where idLivro = 502;
delete from tbLivro where idLivro = 502;
delete from tbGenero where idGenero = 3;

delete from tbItens_da_venda where idLivro = 504;
delete from tbEscreve where idLivro = 504;
delete from tbLivro where idLivro = 504;
delete from tbGenero where idGenero = 5;	

select * from tbItens_da_venda;
select * from tbEscreve;	
select * from tbLivro;
select * from tbGenero;	


