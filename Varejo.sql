use mydb;

insert into var_categoria
	(CatCodi, CatNome) 
values
	(1,'Alimentos');
    
select * 
	from var_categoria;
    
insert into var_categoria
	values (2, 'Limpeza');

insert into var_categoria
	(CatNome,CatCodi) 
	values
	('Automotivo', 3);

insert into var_categoria
	values (4, 'Orti-fruiti');

update var_categoria
	set CatNome = 'horti fruti' 
    where CatCodi=4;

insert var_categoria 
	values (5, 'Tomate');

select *
	from var_categoria 
    where CatCodi=5;

delete 
	from var_categoria
	where CatCodi=5;
    
select * from var_categoria;

describe var_produto;

insert into var_produto
	(ProCodi, ProNome, ProUnid, ProPrec, CatCodi, ProSal)
	values 
    (1, 'Tomate', 'quilo', 6, 4, 120);

select * 
	from var_produto;
    
insert into var_produto
	(ProCodi, ProNome, ProUnid, ProPrec, CatCodi, ProSal)
	values 
    (2, 'Abobrinha', 'quilo', 10, 8, 120);
-- Falha pois a chave estrangeira 8 não existe ^^

insert into var_produto
	(ProCodi, ProNome, ProUnid, ProPrec, CatCodi, ProSal)
	values 
    (2, 'Abobrinha', 'quilo', 10, 4, 120);
    
update var_produto 
	set ProNome = 'Couve-flor', ProPrec = 15 
    where ProCodi = 3;

insert into var_produto
	(ProCodi, ProNome, ProUnid, ProPrec, CatCodi, ProSal)
	values 
    (5, 'Sabão em Pó Bobão', null, 10, 4, null);
    
insert into var_produto
	(ProCodi, ProNome, ProPrec, CatCodi)
	values 
    (4, 'Alvejante Campeão', 10, 4);