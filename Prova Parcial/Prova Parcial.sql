-- Exercício 2

select P.Nm_Proprietario 'Proprietário', M.Nm_Modelo 'Modelo', F.Nm_Fabricante 'Fabricante' ,V.Nr_Placa 'Placa' 
	from loc_veiculo V
    inner join loc_proprietario P on V.Cd_Proprietario = P.cd_proprietario
    inner join loc_modelo M on V.cd_Modelo = M.cd_Modelo
    inner join loc_fabricante F on M.cd_Fabricante = F.cd_Fabricante
    order by P.Nm_Proprietario;

-- Exercício 3

select P.cd_proprietario 'Código', P.Nm_Proprietario 'Nome'
	from loc_proprietario P
    where P.Nm_Proprietario like '%t';

-- Exercício 4



-- Exercício 5



-- Exercício 6



-- Exercício 7



-- Exercício 8



-- Exercício 9



-- Exercício 10

