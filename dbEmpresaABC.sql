-- Fernanda Souza

drop database dbEmpresaABC;

create database dbEmpresaABC;

use dbEmpresaABC;

-- visualizar o banco de dados

show databases;

create table tbPRODUTOS( 
 CODIGO INT, 
 NOME VARCHAR(50), 
 TIPO VARCHAR(25), 
 QUANTIDADE INT, 
 VALOR DECIMAL(10,2) 
);

show tables;

desc tbPRODUTOS;

INSERT INTO tbPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 1,'IMPRESSORA', 'INFORMATICA', 200, 600.00 ); 
INSERT INTO tbPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 2,'CAMERA DIGITAL', 'DIGITAIS', 300, 400.00 ); 
INSERT INTO tbPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 3, 'DVD PLAYER', 'ELETRONICOS', 250, 500.00 ); 
INSERT INTO tbPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 4,'MONITOR', 'INFORMATICA', 400, 900.00 ); 
INSERT INTO tbPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 5,'TELEVISOR', 'ELETRONICOS', 350, 650.00 ); 
INSERT INTO tbPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 6,'FILMADORA DIGITAL', 'DIGITAIS', 500, 700.00 ); 
INSERT INTO tbPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 7,'CELULAR', 'TELEFONE', 450, 850.00 ); 
INSERT INTO tbPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 8,'TECLADO', 'INFORMATICA', 300, 450.00 ); 
INSERT INTO tbPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 9,'VIDEOCASSETE', 'ELETRONICOS', 200, 300.00 ); 
INSERT INTO tbPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 10,'MOUSE', 'INFORMATICA', 400, 60.00 ); 

select codigo, nome, tipo from tbProdutos where tipo = 1;

-- aumentar em 15% o valor
update tbProdutos set valor = valor * 1.15 where tipo = 'informatica;'

-- visualizar	
select valor from tbprodutos where tipo = 'informatica';

select * from tbprodutos where tipo = 'eletronicos' and valor < 600;

-- aumentar em porcentagem 
update tbprodutos set valor = valor *1.05 where tipo = 'eletronicos' and valor < 600;

-- alterando valores / reduzindo valor
update tbprodutos set valor = valor * 0.80 where tipo = 'digitais' or valor > 1000;	

-- usando o IN():
select * from tbprodutos where tipo in ('informatica', 'digitais');

-- usando o NOT com o IN:
select * from tbprodutos where tipo not in ('informatica', 'digitais');

-- usando o between:
select * from tbprodutos where valor between 400.00 and 700.00;

-- usando o NOT between:
select * from tbprodutos where valor not  between 400.00 and 700.00;

-- busca por nome = like 'f%'(procurar nomes que comecem com "F")
-- busca por nome = like '%a'(procurar nomes que acabem com "A")
-- busca por nome = like '%FE%'(procurar nomes que contenham "FE" em qualquer parte)
select * from tbprodutos where nome like '%L%';


-- 1. Aumente em 12% o valor dos produtos cujos nomes iniciem com a letra 'F'
update tbprodutos set valor = valor *1.12 where nome  like 'f%';
select * from tbprodutos;

-- 2. Aumentar em 50 unidades todos os produtos cujo valor seja maior que 400 e inferior a 
-- 600 
update tbprodutos set quantidade = quantidade + 50 where valor >= 400 or valor <= 600;
select * from tbprodutos;	

-- 3. Aplicar um desconto de 50% (*0.5) em todos os produtos que as unidades de estoque 
-- sejam maiores que 300 
update tbProdutos set valor = valor * 0.5 where quantidade > 300;
select * from tbprodutos;	

-- 4. Exiba o produto de CODIGO = 4 
select codigo, nome, tipo from tbProdutos where codigo = 4;
select * from tbprodutos;	

-- 5. Exibir todos os produtos que não tenham a letra 'Y' 

select * from tbprodutos where nome not like '%y%';
select * from tbprodutos;

-- . 6.Exibir todos os produtos que se iniciem com nome 'MO' e tenham como tipo as letras 
--'MA' 

select * from tbprodutos where nome like'mo%' and tipo like '%ma%';
select * from tbprodutos;
