-- Listar os registros dos funcionários

select * from loc_funcionario;

-- Listar código, nome e salário dos funcionários

select cd_func, nm_func, Vl_Salario 
	from loc_funcionario;
    
-- Listar funcionários pelo salário 

select cd_func, nm_func, Vl_Salario
	from loc_funcionario
    order by Vl_Salario;

-- Buscar funcionário pelo código

select * 
	from loc_funcionario
    where cd_func = 5;
    
-- Ver quem trabalha no departamento 42

select *
	from loc_funcionario
	where Cd_Depto = 42;
    
--  Qual o nome do departamento 42

select Nm_Depto
	from loc_depto
    where Cd_Depto = 42;
    
-- Quem ganha mais que 400 reais? Nome e salário

select nm_func, vl_salario
	from loc_funcionario
    where Vl_Salario > 4000;
    
-- Funcionários que ganham entre 4 e 8 mil

select nm_func, vl_salario
	from loc_funcionario
    where Vl_Salario >= 4000 
    and Vl_Salario <= 8000;
    
-- Funcionários que ganham menos de 4 ou mais de 8 mil. Modo normal

select nm_func, vl_salario
	from loc_funcionario
    where Vl_Salario < 4000
    or Vl_Salario > 8000;

-- Funcionários que ganham menos de 4 ou mais de 8 mil. Modo inverso

select nm_func, vl_salario
	from loc_funcionario
    where not (Vl_Salario < 4000
    or Vl_Salario > 8000);
    
-- LIKE procura uma sigla em qualquer nome e o % ignora o resto

select Nm_Func, Vl_Salario
	from loc_funcionario
    where nm_func 
    like '%na%'; 

-- Procurar todas as Ana 

select Nm_Func, Vl_Salario
	from loc_funcionario
    where nm_func 
    like 'Ana%'; 

-- Prucrar todos que termina com 'ra'

select Nm_Func 
	from loc_funcionario
    where Nm_Func
    like '%ra';

-- Porcurar todos que comecem com M e depois tenham 'ri' (O _ pula a letra)

select nm_Func
	from loc_funcionario
    where Nm_Func
    like 'M_ri%';

-- Mostra os nomes dos funcionarios em ordem alfabeta
select * 
	from loc_funcionario
    order by Nm_Func desc;