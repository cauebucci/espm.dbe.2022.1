-- Exercício 1
select E.Cd_Estado 'Código', E.Nm_Estado 'Estado', E.Sigla_Estado 'Sigla'
	from loc_estado E
    order by E.Sigla_Estado;
    
-- Exercício 2
select C.Cd_Cidade 'Código', C.Nm_Cidade 'Cidade', C.Cd_Estado 'Código Estado', E.Sigla_Estado 'Estado'
	from loc_cidade C
    inner join loc_estado E on C.Cd_Estado = E.Cd_Estado
    where C.Cd_Estado = 3 
    and (C.Nm_Cidade like '%z%' 
    or C.Nm_Cidade like '%b%');

-- Exercício 3
select F.Cd_Func 'Código', F.Nm_Func 'Funcionário'
	from loc_funcionario F
    where F.Nm_Func like '%si%';
    
-- Exercício 4
select V.Nr_Placa 'Placa', V.Nr_Chassis 'Chassis', V.Km_Atual 'Quilometragem Atual', C.Desc_Cor 'Cor'
	from loc_veiculo V
    inner join loc_cor C on V.cd_cor = C.cd_Cor
    where V.Km_Atual >= 10000
    and V.Km_Atual <= 25000;

-- Exercício 5
select V.Nr_Placa 'Placa', P.Nm_Proprietario 'Proprietário'
	from loc_veiculo V
    inner join loc_proprietario P on V.cd_proprietario = P.cd_proprietario;

-- Exercício 6
select F.Cd_Depto 'Código', D.Nm_Depto 'Departamento', avg(F.Vl_Salario) 'Média Salarial'
	from loc_funcionario F
    inner join loc_depto D on F.Cd_Depto = D.Cd_Depto
    where F.Vl_Perc_Comissao != 3
    group by D.Nm_Depto;

-- Exercício 7
select F.Cd_Depto 'Código', D.Nm_Depto 'Departamento', avg(F.Vl_Salario) 'Média Salarial'
	from loc_funcionario F
    inner join loc_depto D on F.Cd_Depto = D.Cd_Depto
    group by D.Nm_Depto
    having avg(F.Vl_Salario) > 5000;
    
-- Exercício 8

select G.Nm_Func 'Gerente', sum(F.Vl_Salario) 'Total dos Subordinados'
	from loc_funcionario F
    inner join loc_funcionario G on F.Cd_Gerente = G.Cd_Func
    group by G.Nm_Func
    order by F.Cd_Cargo;

-- Exercício 9
select F.Nm_Func 'Funcionário', F.Vl_Salario 'Salário'
	from loc_funcionario F
    where F.Vl_Salario > all (select avg(Vl_Salario)
							from loc_funcionario
                            group by Cd_Depto);

-- Exercício 10 (OBS: No enunciado está falando que é um exc de Subquery, mas usando o group by aparentemente deu o mesmo resultado)
select F.Cd_Depto, D.Nm_Depto 'Departamento', count(F.Cd_Func) 'Funcionários'
	from loc_funcionario F
    inner join loc_depto D on F.Cd_Depto = D.Cd_Depto
    group by D.Nm_Depto
    having count(F.Cd_Func) <= 3;
   
    

