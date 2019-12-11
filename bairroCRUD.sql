set term ^ ;
create or alter procedure CriaBairro
(	
	pNome_bairro varchar(200),
	pId_cidade int
)
RETURNS
(
	resultado varchar(200)
)
AS

BEGIN
	insert into bairro(nome_bairro, id_cidade)
		values (:pNome_bairro, :pId_cidade);

	resultado = 'Bairro ' || :pNome_bairro || ' inserido com sucesso!';
END^
-------------------------------------------------------------------------------------------------
create or alter procedure RemoveBairro
(	
	pId integer
)
RETURNS
(
	resultado varchar(200)
)
AS
	declare variable nome_bairro varchar(200); 
BEGIN
	select nome_bairro
	from bairro
	where id_bairro = :pId
	into nome_bairro;

	delete from bairro
	where id_bairro = :pId;

	resultado = 'O bairro ' || nome_bairro || ' foi removido!';
END^
------------------------------------------------------------------------------------------------- 
create or alter procedure AtualizaBairro
(	pId_bairro int,
	pNome_bairro varchar(200) = ' ',
	pId_cidade int = 0
)
RETURNS
(
	resultado varchar(200)
)
AS
 
BEGIN
	if(:pNome_bairro = ' ') then
		select nome_bairro from bairro where id_bairro = :pId_bairro into :pNome_bairro;

	if(:pId_cidade = 0) then
		select id_cidade from bairro where id_bairro = :pId_bairro into :pId_cidade;

	update bairro 
	set nome_bairro = :pNome_bairro, id_cidade = :pId_cidade
	where id_bairro = :pId_bairro;

	  resultado = 'Bairro ' || :pId_bairro || ' foi atualizado!';
END^
-------------------------------------------------------------------------------------------------
create or alter procedure DetalheBairro
(
	pId_bairro int
)
RETURNS
(
	resultado varchar(200),
	pNome_bairro varchar(200),
	pId_cidade int
)
AS
 
BEGIN
	select nome_bairro from bairro where id_bairro = :pId_bairro into :pNome_bairro;

	select id_cidade from bairro where id_bairro = :pId_bairro into :pId_cidade;

	resultado = 'Detalhes do bairro ' || :pId_bairro;

END^

set term ; ^

input C:\Users\polo\Desktop\bancoDados\cidadeCRUD.sql;