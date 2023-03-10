-- Quem ganha mais que a Adriana Doretto?

select *
	from loc_funcionario;
    
select F.Nm_Func 'Funcionário', Vl_Salario 'Salário'
	from loc_funcionario F
	where Vl_Salario > 7146;
    
    -- Subquery

select F.Nm_Func 'Funcionário', Vl_Salario 'Salário'
	from loc_funcionario F
	where Vl_Salario > (select Vl_Salario 
							from loc_funcionario F
							where F.Cd_Func = 4);
                        
-- Quem ganha mais que a média salarial da Carloca
select F.Nm_Func, F.Vl_Salario
	from loc_funcionario F
    where F.Vl_Salario > (select avg(Vl_Salario) 
							from loc_funcionario)
	order by Vl_Salario desc;
    
-- Quem ganha mais que a média salárial de todos os departamentos da Carloca
select F.Nm_Func, F.Vl_Salario
	from loc_funcionario F
    where F.Vl_Salario > all (select avg(Vl_Salario)
								from loc_funcionario
								group by Cd_Depto)
	order by F.Vl_Salario desc;
    
-- Quem ganha mais que alguma média salárial departamental
select F.Nm_Func, F.Vl_Salario
	from loc_funcionario F
    where F.Vl_Salario > any (select avg(Vl_Salario)
								from loc_funcionario
								group by Cd_Depto)
	order by F.Vl_Salario desc;
    
-- Quem ganha mais que alguma média salárial departamental descartando médias menores que 5000
select F.Nm_Func, F.Vl_Salario
	from loc_funcionario F
    where F.Vl_Salario > any (select avg(Vl_Salario)
								from loc_funcionario
								group by Cd_Depto
                                having avg(Vl_Salario) > 5000)
	order by F.Vl_Salario desc;
    
-- Quem ganha mais que alguma média salárial departamental descartando médias menores que 5000, com o nome dos cargos
select F.Nm_Func, C.Nm_Cargo, F.Vl_Salario
	from loc_funcionario F
    inner join loc_cargo C on F.Cd_Cargo = C.Cd_Cargo
    where F.Vl_Salario > any (select avg(Vl_Salario)
								from loc_funcionario
								group by Cd_Depto
                                having avg(Vl_Salario) > 5000)
	order by F.Vl_Salario desc;
    
-- Quem ganha igual a média salárial de algum departamento
select F.Nm_Func, F.Vl_Salario
	from loc_funcionario F
    where Vl_Salario in (select avg(Vl_Salario)
							from loc_funcionario
                            group by Cd_Depto);
                            
-- Listar funcionários que estajam no depto 42, 10 ou 36
select Nm_Func, Cd_Depto
	from loc_funcionario
	where Cd_Depto in (42, 10, 36);
    
-- Quem ganha o menor salário
select F.Nm_Func, F.Vl_Salario
	from loc_funcionario F
    where F.Vl_Salario in (select min(Vl_Salario)
							from loc_funcionario);

-- "Tabela" que tenha nomes de funcionários, cargos e departamentos
select F.Nm_Func, C.Nm_Cargo, D.Nm_Depto
	from loc_funcionario F
    inner join loc_cargo C on F.Cd_Cargo = C.Cd_Cargo
    inner join loc_depto D on F.Cd_Depto = D.Cd_Depto;
    
-- Criando uma visão 
create or replace view funcionario as
		(select F.Nm_Func 'Funcionário', C.Nm_Cargo 'Cargo', D.Nm_Depto 'Departamento'
			from loc_funcionario F
			inner join loc_cargo C on F.Cd_Cargo = C.Cd_Cargo
			inner join loc_depto D on F.Cd_Depto = D.Cd_Depto);
		
select * from funcionario;
    
