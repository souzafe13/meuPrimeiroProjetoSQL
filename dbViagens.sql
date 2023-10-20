drop database dbViagens;

create database dbViagens;

use dbViagens;


create table tbPassagens(
idTicket int not null unique,
passaporte varchar (12) not null unique,
destino varchar (3),
partida varchar (3),
data date not null,
bagagem varchar(100),
modalidade varchar (15),
primary key (idTicket)
);

create table tbHoteis(
idReserva int not null unique,
acomodacao varchar (100),
nomeDoHotel varchar (50) not null,
amenities varchar (100),
dependencia varchar (150),
data date not null,
localidade varchar (100),
primary key (idReserva)
);

create table tbPacotes(	
idTicket int not null unique,
idReserva int not null unique,
traslado varchar (25),
seguro varchar (25),
passeio varchar (100),
data date not null,
foreign key (idTicket) references tbPassagens (idTicket),
foreign key (idReserva) references tbHoteis (idReserva)
);

desc tbPassagens;
desc tbHoteis;
desc tbPacotes;

insert into tbPassagens (idTicket, passaporte, destino, partida, data, bagagem, modalidade) values (14, 'JM141020', 'CUR', 'GRU', '2023/12/25', 'bagagem de mão 10 quilos', 'CARIBE');
insert into tbPassagens (idTicket, passaporte, destino, partida, data, bagagem, modalidade) values (13, 'FM131020', 'LDN', 'GRU', '2024/10/13', 'sem benefício de bagagem de mão', 'INGLATERRA');
insert into tbPassagens (idTicket, passaporte, destino, partida, data, bagagem, modalidade) values (01, 'LM102030', 'CNF', 'VCP', '2026/01/01', 'bagagem  de 23 quilos - adicional de bagagem de mão de 10 quilos', 'MINAS GERAIS');
insert into tbPassagens (idTicket, passaporte, destino, partida, data, bagagem, modalidade) values (03, 'RF270793', 'BPS', 'CGH', '2030/07/27', 'bagagem de mão 10 quilos', 'BAHIA');
insert into tbPassagens (idTicket, passaporte, destino, partida, data, bagagem, modalidade) values (02, 'BM211014', 'CDG', 'GRU', '2023/12/30', 'bagagem  de 23 quilos - adicional de bagagem de mão de 10 quilos', 'FRANÇA');
insert into tbPassagens (idTicket, passaporte, destino, partida, data, bagagem, modalidade) values (04, 'SS270793', 'TVV', 'GRU', '2023/10/20', 'bagagem de mão 10 quilos', 'ISRAEL');

select * from tbPassagens;

insert into tbHoteis (idReserva, acomodacao, nomeDoHotel, amenities, dependencia, data, localidade) values (030201, 'Três Estrelas', 'Grande Hotel de Ouro Preto', 'breakfast, bedlines, bathline',  'double studio twins beds (3)', '2023/12/25', 'Próximo a feira de artesanato de Ouro Preto');
insert into tbHoteis (idReserva, acomodacao, nomeDoHotel, amenities, dependencia, data, localidade) values (030202, 'Quatro Estrelas', 'London Roxford Grand Hotel', 'colonial breakfast, sauna, bedlines, shower kit, teatime',  'king bed luxuos', '2024/10/13', 'Próximo a Arena 3 Rugby');
insert into tbHoteis (idReserva, acomodacao, nomeDoHotel, amenities, dependencia, data, localidade) values (030203, 'Resort', 'Club Med', 'all inclusive',  'double bed', '2026/01/01', 'Próximo a a praia Taipe');
insert into tbHoteis (idReserva, acomodacao, nomeDoHotel, amenities, dependencia, data, localidade) values (030204, 'Três Estrelas', 'Ibis Paris Torre Eiffel', 'breakfast, bedlines, kitchen',  'single bed plus office', '2030/07/27', 'Próximo a Torre Eiffel');
insert into tbHoteis (idReserva, acomodacao, nomeDoHotel, amenities, dependencia, data, localidade) values (030205, 'Resort', 'Hilton Corendon Hotel', 'all inclusive',  'king bed luxuos', '2023/12/30', 'Próximo ao aeroporto internacional de Curação');
insert into tbHoteis(idReserva, acomodacao, nomeDoHotel, amenities, dependencia, data, localidade)values(030206, 'Resort', 'Hilton Corendon Hotel', 'all inclusive',  'king bed luxuos', '2023/12/30', 'Próximo ao aeroporto internacional de Curação');

select * from tbHoteis;

insert into tbPacotes (idTicket, idReserva, traslado, seguro, passeio, data) values (14, 030205, 'possui traslado de luxo', 'Axus', 'Diária/passeio a HATO CAVES', '2023/12/26');
insert into tbPacotes (idTicket, idReserva, traslado, seguro, passeio, data) values (13, 030202, 'N/A', 'N/A', 'Diária/passeio a London Bridge', '2024/10/13');
insert into tbPacotes (idTicket, idReserva, traslado, seguro, passeio, data) values (01, 030201, 'possui traslado de luxo', 'Zurich', 'Diária/passeio a Centro Histórico', '2026/01/01');
insert into tbPacotes (idTicket, idReserva, traslado, seguro, passeio, data) values (03, 030203, 'possui traslado de luxo', 'Axus Plus', 'Diárias/passeios a Travessia Arraial Trancoso e Rio da Barra', '2030/07/27');
insert into tbPacotes (idTicket, idReserva, traslado, seguro, passeio, data) values (02, 030204, 'N/A', 'N/A', 'Diária/passeio a Torre Eiffel', '2023/12/30');
insert into tbPacotes(idTicket, idReserva, traslado, seguro, passeio, data)values(4, 030206, 'N/A', 'N/A', 'Diária/passeio a Torre Eiffel', '2023/12/30');
select * from tbPacotes;

-- delete from tbPacotes where idTicket = 14;
 	
-- select localidade from tbPassagens where localidade = @localidade;


