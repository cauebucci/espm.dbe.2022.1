-- Exercicio 1

select F.Cd_Func 'Código', F.Nm_Func 'Funcionário', F.Vl_Salario 'Salário'
	from loc_funcionario F;
    
-- Exercicio 2

select P.cd_proprietario 'Código', P.Nm_Proprietario 'Nome', P.Nr_CPF 'CPF'
	from loc_proprietario P;
    
-- Exercício 3

select B.cd_Banco 'Código', B.Nm_Banco 'Nome', B.url 'URL'
	from loc_banco B;
    
-- Exercício 4

select G.cd_Grupo 'Código', G.Nm_Grupo 'Grupo'
	from loc_grupo G;

-- Exercício 5

select *
	from loc_pedido_locacao PL
    order by PL.Vl_Total desc;

-- Exercício 6

select *
	from loc_cliente C
    order by C.Cd_cliente;

-- Exercício 7

select *
	from loc_cliente C
    order by C.Nr_Estrelas desc;

-- -- Exercício 8

select *
	from loc_estado E
    order by E.Sigla_Estado;
    
-- Exercício 9

select F.Nm_Func 'Funcionário', F.Cd_Depto 'Departamento', F.Vl_Perc_Comissao 'Percentual da Comissão', F.Dt_Inicio 'Início'
	from loc_funcionario F
    order by F.Nm_Func;
    
-- Exercício 10

select C.Cd_Cidade, C.Nm_Cidade, C.Cd_Estado
	from loc_cidade C
    order by C.Cd_Estado;
    
-- Exercício 11

select *
	from loc_cidade C
    where Nm_Cidade like '% %'
    order by C.Cd_Estado;
    
-- Exercício 12

select F.Cd_Func, F.Nm_Func, F.Cd_Depto, F.Nr_CPF
	from loc_funcionario F
    where F.Nr_CPF is not null;
    
-- Exercício 13

select F.Cd_Func, F.Nm_Func, F.Vl_Salario, F.Vl_Perc_Comissao
	from loc_funcionario F
    