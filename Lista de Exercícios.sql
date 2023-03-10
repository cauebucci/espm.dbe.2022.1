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

select C.Cd_Cidade 'Código', C.Nm_Cidade 'Cidade', C.Cd_Estado 'Código Estado'
	from loc_cidade C
    order by C.Cd_Estado;
    
-- Exercício 11

select *
	from loc_cidade C
    where Nm_Cidade like '% %'
    order by C.Cd_Estado;
    
-- Exercício 12

select F.Nm_Func 'Funcionário', F.Cd_Depto 'Código Departamento', F.Nr_CPF 'CPF'
	from loc_funcionario F
    where F.Nr_CPF is not null;
    
-- Exercício 13

select F.Cd_Func 'Código', F.Nm_Func 'Funcionário', F.Vl_Salario 'Salário', F.Vl_Perc_Comissao 'Comissão'
	from loc_funcionario F;

-- Exercício 14

select V.Nr_Placa 'Placa', V.Nr_Chassis 'Chassi'
	from loc_veiculo V;
    
-- Exercício 15

select * 
	from loc_cidade C
    where C.Nm_Cidade like '%z%' 
    or C.Nm_Cidade like '%b%' 
    and C.Cd_Estado = 3;
    
-- Exercício 16

select F.Nm_Func 'Funcionário', F.Cd_Depto 'Código Departamento', F.Vl_Salario 'Salário', F.Vl_Perc_Comissao 'Comissão', F.Dt_Inicio 'Início'
	from loc_funcionario F
    where F.Cd_Func % 2 = 0
    order by F.Cd_Func desc;
    
-- Exercício 17

select F.Nm_Func 'Funcionário', F.Cd_Depto 'Código Departamento', F.Vl_Salario 'Salário', F.Vl_Perc_Comissao 'Comissão', F.Dt_Inicio 'Início'
	from loc_funcionario F
    where not F.Cd_Func % 2 = 0
    order by F.Cd_Func desc;
    
-- Exercício 18

select F.Nm_Func 'Funcionário', F.Vl_Salario 'Salário'
	from loc_funcionario F
    order by F.Nm_Func;
    
-- Exercício 19 ?

select Pl.Nr_Pedido 'Pedido', Pl.Dt_Retirada 'Retirada', Pl.Dt_Entrega 'Entrega'
	from loc_pedido_locacao Pl
    where Pl.Dt_Retirada > Pl.Dt_Entrega;

-- Exercício 20 ?

select Pl.Nr_Pedido 'Pedido', Pl.Dt_Locacao 'Locação', Pl.Dt_Entrega 'Entrega', Pl.Dt_Retirada 'Retirada', Pl.Vl_Total 'Valor'
	from loc_pedido_locacao Pl
    where Pl.Dt_Locacao > Pl.Dt_Entrega
    or Pl.Dt_Locacao > Pl.Dt_Retirada
    or Pl.Vl_Total = 0;
    
-- Exercício 21

select L.cd_Operadora 'Código', L.Nm_Operadora 'Operadora'
	from loc_operadora L
    where length(L.Nm_Operadora) > 5;
    
-- Exercício 22

select C.Cd_cliente 'Código', C.Nm_Cliente 'Cliente'
	from loc_cliente C
    where length(C.Nm_Cliente) > 15 
    and C.Nm_Cliente like '%i%';

-- Exercício 23

select C.Nm_Cliente 'Cliente', Tc.Nm_Tp_Cliente 'Tipo do Cliente'
	from loc_cliente C
    inner join loc_tp_cliente Tc on C.Cd_Tp_Cliente = Tc.cd_Tp_Cliente;
    
-- Exercício 24

select D.Nm_Depto 'Departamento', D.Vl_Orc_Depto 'Orçamento'
	from loc_depto D
    where D.Vl_Orc_Depto > 20000;
    
-- Exercício 25 ???

select Il.Nr_Pedido 'Pedido', Il.Nr_Placa 'Placa', round(Il.Vl_Diaria, 0) 'Diária sem decimal', round(Il.Vl_Diaria, 1) 'Diária 1 decimal', round(Il.Vl_Diaria, 2) 'Diária 2 decimal'
 	from loc_item_locacao Il
    where Il.Nr_Pedido = 10
    order by Il.Vl_Diaria;
    
-- Exercício 26

select C.Cd_cliente 'Código', C.Nm_Cliente 'Cliente', Tc.Nm_Tp_Cliente 'Tipo do Cliente', C.Nr_Estrelas 'Estrelas', C.Nr_Habilitacao 'Habilitação'
	from loc_cliente C
    inner join loc_tp_cliente Tc on C.Cd_Tp_Cliente = Tc.cd_Tp_Cliente
    order by C.Cd_cliente;
    
-- Exercício 27

select C.Cd_cliente 'Código', C.Nm_Cliente 'Cliente', C.Nr_Estrelas 'Estrelas'
	from loc_cliente C
    where not C.Nr_Estrelas % 2 = 0
    and not C.Cd_cliente % 2 = 0;
    
-- Exercício 28



    
    


