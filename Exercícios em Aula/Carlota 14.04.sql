select *
	from loc_depto;
    
-- Ver o departamento 0
select * 
	from loc_depto
    where Cd_Depto = 0;
    
-- Excluir o departamento 0
delete 
	from loc_depto
	where cd_depto = 0;
    
-- Ver todos funcionários    
select *
	from loc_funcionario;
    
-- Ver o departamento 50
select *
	from loc_depto
    where Cd_Depto = 50;

-- Excluir departamento 50
delete
	from loc_depto
    where Cd_Depto = 50; -- Retorna erro, pois o departamento 50 tem funcionários ativos e consequentemente gera
						 -- um erro de integridade diferencial

-- Mudar o salário da MariaLinda para 8500
update loc_funcionario
	set Vl_Salario = 8500
    where Cd_Func = 5;
    
    
-- Mudar o departamento da MariaLinda para o depto 50
update loc_funcionario
	set Cd_Depto = 50
    where Cd_Func = 5;
    
-- Mudar o departamento da MariaLinda para o depto 1
update loc_funcionario
	set Cd_Depto = 1
    where Cd_Func = 5; -- Retorna erro pois não existe o departamento 1

-- Criar um departamento
insert into loc_depto
	values (0, 'Departamento Secreto', 60000);

-- Criar um departamento já existente   
insert into loc_depto
	values (50, 'Departamento Secreto', 60000); -- Retorna erro pois já existe o departamento 50
    
-- Listar nomes de pessoas, cargos e departamentos
select Nm_Func, Nm_depto, Nm_Cargo 
	from loc_funcionario
    inner join loc_depto on loc_funcionario.Cd_Depto = loc_depto.Cd_Depto
    inner join loc_cargo on loc_funcionario.Cd_Cargo = loc_cargo.Cd_Cargo;

-- Mesma coisa que cima mas dando apelido para abreviar
select Nm_Func, Nm_depto, Nm_Cargo 
	from loc_funcionario F
    inner join loc_depto D on F.Cd_Depto = D.Cd_Depto
    inner join loc_cargo C on F.Cd_Cargo = C.Cd_Cargo;

-- Listar nomes e códigos de pessoas, cargos e departamentos
select f.Cd_Func, f.Nm_Func, f.Cd_Cargo, c.Nm_Cargo, f.Cd_Depto, d.Nm_Depto
	from loc_funcionario F
    inner join loc_depto D on F.Cd_Depto = D.Cd_Depto
    inner join loc_cargo C on F.Cd_Cargo = C.Cd_Cargo;
    
-- Nomes de funcionarios e departamentos para funcionarios que ganham mais de 4 mil
select Nm_Func, d.Nm_Depto, f.Vl_Salario
	from loc_funcionario F
    inner join loc_depto D on F.Cd_Depto = D.Cd_Depto
    where Vl_Salario >= 4000
    order by Vl_Salario;
    
-- Nome de funcionarios, salarios para funcionarios que ganhem mais que 4000
-- e que tenham codigo de cargo menores ou iguais a 3
select Nm_Func, d.Nm_Depto, f.Vl_Salario
	from loc_funcionario F
    inner join loc_depto D on F.Cd_Depto = D.Cd_Depto
    where F.Vl_Salario > 4000
    and F.Cd_Cargo <= 3
    order by Vl_Salario;

-- Nome de funcionarios, salarios para funcionarios que ganhem mais que 4000
-- ou que tenham codigo de cargo menores ou iguais a 3
select Nm_Func, d.Nm_Depto, f.Vl_Salario
	from loc_funcionario F
    inner join loc_depto D on F.Cd_Depto = D.Cd_Depto
    where F.Vl_Salario > 4000
    or F.Cd_Cargo <= 3
    order by Vl_Salario;
    
-- Liste todas as locações de veículos (Locação e item) Número, data e valor
select P.Nr_Pedido, P.Dt_Locacao, I.Vl_Diaria
	from loc_pedido_locacao P
    inner join loc_item_locacao I on P.Nr_Pedido = I.Nr_Pedido;


-- Analista de Negócios Cliente X Veículo (Marca)
select P.Nr_Pedido, P.Dt_Locacao, I.Vl_Diaria, C.Nm_Cliente, V.Nr_Placa, M.Nm_Modelo, F.Nm_Fabricante
	from loc_pedido_locacao P
    inner join loc_item_locacao I on P.Nr_Pedido = I.Nr_Pedido
    inner join loc_cliente C on P.Cd_Cliente = C.Cd_cliente
    inner join loc_veiculo V on I.Nr_Placa = V.Nr_Placa
    inner join loc_modelo M on V.cd_Modelo = M.cd_Modelo
    inner join loc_fabricante F on M.cd_Fabricante = F.cd_Fabricante;
    
-- Analista de Negócios Funcionário/Função

select P.Nr_Pedido, P.Vl_Total, F.Nm_Func, C.Nm_Cargo, Cl.Nm_Cliente, T.Nm_Tp_Cliente
	from loc_pedido_locacao P
    inner join loc_funcionario F on P.Cd_Func = F.Cd_Func
    inner join loc_cargo C on F.Cd_Cargo = C.Cd_Cargo
    inner join loc_cliente Cl on P.Cd_Cliente = Cl.Cd_cliente
    inner join loc_tp_cliente T on Cl.Cd_Tp_Cliente = T.cd_Tp_Cliente;
    
select * 
	from loc_depto;

insert into loc_depto
	(Cd_Depto, Nm_Depto, Vl_Orc_Depto)
values 
    (13, "Comercial Belo Horizonte", 200000);

insert into loc_depto
values (14, "Comercial Brasília", 200000);

insert into loc_depto
	(Cd_Depto, Vl_Orc_Depto, Nm_Depto)
values 
    (15, 200000,"Comercial Belo Horizonte");

insert into loc_depto
values (16, "Comercial Belém", null);

insert into loc_depto(Cd_Depto, Nm_Depto)
values (17, "Comercial Santarém");

select *
	from loc_depto
    where Cd_Depto = 22;
    
delete from loc_depto
	where Cd_Depto = 15;

update loc_depto
	set Vl_Orc_Depto = 300000
    where Cd_Depto = 17;

update loc_depto
	set Cd_Depto = 22
    where Cd_Depto  = 17;

select *
	from loc_depto;
    
    
-- Self Join (Juntar consigo mesmo) - (Funcionários e seus chefes)
select F.Cd_Func, F.Nm_Func, G.Cd_Func, G.Nm_Func
	from loc_funcionario F
    inner join loc_funcionario G on F.Cd_Gerente = G.Cd_Func
    order by F.Nm_Func;
    
-- Self Join (Juntar consigo mesmo) - (Funcionários e seus chefes, mesmo que não tenha chefe)
select F.Cd_Func, F.Nm_Func, G.Cd_Func, G.Nm_Func
	from loc_funcionario F
    left join loc_funcionario G on F.Cd_Gerente = G.Cd_Func
    order by F.Nm_Func;

    
-- Self Join (Juntar consigo mesmo) - (Funcionários e seus chefes)
select F.Cd_Func, F.Nm_Func, G.Cd_Func, G.Nm_Func
	from loc_funcionario F
    right join loc_funcionario G on F.Cd_Gerente = G.Cd_Func
    order by G.Nm_Func;


