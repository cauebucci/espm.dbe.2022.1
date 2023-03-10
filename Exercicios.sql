-- Exercício 9
select *
	from loc_cargo;
    
-- Exercício 5
select F.Nm_Func 'Funcionário', C.Nm_Cargo 'Cargo', F.Vl_Salario 'Salário'
	from loc_funcionario F
    inner join loc_cargo C on F.Cd_Cargo = C.Cd_Cargo
    where F.Vl_Salario > 4500 
    and F.Vl_Salario < 9000
    order by Vl_Salario;

-- Exercício 6
select F.Nm_Func 'Funcionário', C.Nm_Cargo 'Cargo'
	from loc_funcionario F
    inner join loc_cargo C on F.Cd_Cargo = C.Cd_Cargo
    where F.Cd_Depto = 42;
    
-- Exercício 7
select F.Nm_Func 'Funcionário', C.Nm_Cargo 'Cargo'
	from loc_funcionario F
    inner join loc_cargo C on F.Cd_Cargo = C.Cd_Cargo
    where C.Cd_Cargo > 3;
    
-- Exercício 8 
select Nm_Func 'Funcionário', Vl_Perc_Comissao 'Comissão', Vl_Salario 'Salário'
	from loc_funcionario
    where Vl_Perc_Comissao = 3.0
    and Vl_Salario > 4000;

-- Exercício 2
select F.Nm_Func 'Funcionário', D.Nm_Depto 'Departamento', G.Nm_Func 'Gerente', DG.Nm_Depto 'Departamento'
	from loc_funcionario F
    inner join loc_funcionario G on F.Cd_Gerente = G.Cd_Func
    inner join loc_depto D on F.Cd_Depto = D.Cd_Depto
    inner join loc_depto DG on G.Cd_Depto = DG.Cd_Depto;

-- Exercício 3
select F.Nm_Func 'Funcionário', D.Nm_Depto 'Departamento', G.Nm_Func 'Gerente'
	from loc_funcionario F
    left join loc_funcionario G on F.Cd_Gerente = G.Cd_Func
    inner join loc_depto D on F.Cd_Depto = D.Cd_Depto
    order by G.Nm_Func is not null;

-- Exercício 4
select G.Nm_Func 'Funcionário', D.Nm_Depto 'Departamento'
	from loc_funcionario F
    right join loc_funcionario G on F.Cd_Gerente = G.Cd_Func
    inner join loc_depto D on G.Cd_Depto = D.Cd_Depto
    where F.Nm_Func is null
    order by G.Nm_Func;