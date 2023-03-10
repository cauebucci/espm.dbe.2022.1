-- Ver quem ganha mais
select F.Nm_Func, F.Vl_Salario
	from loc_funcionario F
    order by Vl_Salario;
    
select max(Vl_Salario)
	from loc_funcionario;
    
-- Qual é o maior, menos e a média salarial
select max(Vl_Salario), min(Vl_Salario), avg(Vl_Salario)
	from loc_funcionario;
    
-- Salário máximo de cada departamento e o valor total de cada departamento
select D.Nm_Depto 'Departamento', max(F.Vl_Salario) 'Salário Máximo', sum(F.Vl_Salario) 'Salário total'
	from loc_funcionario F
    inner join loc_depto D on F.Cd_Depto = D.Cd_Depto
    group by D.Nm_Depto;
    
-- Salário máximo de cada departamento e o valor total de cada departamento, 
-- desconsiderando salários abaixos de 3000

select D.Nm_Depto 'Departamento', max(F.Vl_Salario) 'Salário Máximo', sum(F.Vl_Salario) 'Salário total'
	from loc_funcionario F
    inner join loc_depto D on F.Cd_Depto = D.Cd_Depto
    where F.Vl_Salario >= 3000
    group by D.Nm_Depto;
    
-- Salário máximo de cada departamento e o valor total de cada departamento, 
-- desconsiderando salários abaixos de 3000 E ELIMINANDO TODAS MÉDIAS ABAIXO DE 5000

select D.Nm_Depto 'Departamento', max(F.Vl_Salario) 'Salário Máximo', sum(F.Vl_Salario) 'Salário total'
	from loc_funcionario F
    inner join loc_depto D on F.Cd_Depto = D.Cd_Depto
    where F.Vl_Salario >= 3000 -- where funciona pra linhas
    group by D.Nm_Depto
    having avg(F.Vl_Salario) > 5000 -- having serve para grupos 
    order by D.Nm_Depto;
    
-- Simulando a prova

-- Q1: Qual o cargo mais bem remunerado? Nome e valor

select C.Nm_Cargo 'Cargo', max(F.Vl_Salario) 'Salário'
	from loc_funcionario F
    inner join loc_cargo C on F.Cd_Cargo = C.Cd_Cargo;
    
-- Q2: Listar todos os cargos e suas médias saláriais 

select C.Nm_Cargo 'Cargo', avg(F.Vl_Salario) 'Média Salárial'
	from loc_funcionario F
    inner join loc_cargo C on F.Cd_Cargo = C.Cd_Cargo
    group by C.Nm_Cargo;
    
-- Q3: Qual a média de valores de locação por modelos de veículos 
select M.Nm_Modelo 'Modelo', F.Nm_Fabricante 'Fabricante', avg(V.Vl_Diaria) 'Média da Diária'
	from loc_veiculo V
    inner join loc_modelo M on V.cd_Modelo = M.cd_Modelo
    inner join loc_fabricante F on M.cd_Fabricante = F.cd_Fabricante
    group by M.Nm_Modelo;
    
-- Q4: Qual a média de valores de locação
select avg(Vl_Diaria) 'Média da Diária'
	from loc_veiculo;
    
-- Q5: Quais as maiores locações por fabricante
select F.Nm_Fabricante 'Fabricante', max(V.Vl_Diaria) 'Diária Máxima'
	from loc_veiculo V
    inner join loc_modelo M on V.cd_Modelo = M.cd_Modelo
    inner join loc_fabricante F on M.cd_Fabricante = F.cd_Fabricante
    group by F.Nm_Fabricante;

-- Q6: Qual a média das locações por fabricante, mas inclua os modelos
select F.Nm_Fabricante 'Fabricante', M.Nm_Modelo 'Modelo', avg(V.Vl_Diaria) 'Média da Diária'
	from loc_veiculo V
    inner join loc_modelo M on V.cd_Modelo = M.cd_Modelo
    inner join loc_fabricante F on M.cd_Fabricante = F.cd_Fabricante
    group by F.Nm_Fabricante, M.Nm_Modelo;
    
-- Q7: Qual a média das locações por fabricante, mas inclua os modelos, mais apenas médias maiores que 500
select F.Nm_Fabricante 'Fabricante', M.Nm_Modelo 'Modelo', avg(V.Vl_Diaria) 'Média da Diária'
	from loc_veiculo V
    inner join loc_modelo M on V.cd_Modelo = M.cd_Modelo
    inner join loc_fabricante F on M.cd_Fabricante = F.cd_Fabricante
    group by F.Nm_Fabricante, M.Nm_Modelo
    having avg(Vl_Diaria) >= 500;