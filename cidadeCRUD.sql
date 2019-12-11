set term ^ ;
create or alter procedure CriaCidade
(	
	pNome_cidade varchar(200),
	pId_estado int
)
RETURNS
(
	resultado varchar(200)
)
AS

BEGIN
	insert into cidade(nome_cidade, id_estado)
		values (:pNome_cidade, :pId_estado);

	resultado = 'Cidade ' || :pNome_cidade || ' inserido com sucesso!';
END^
-------------------------------------------------------------------------------------------------
create or alter procedure RemoveCidade
(	
	pId integer
)
RETURNS
(
	resultado varchar(200)
)
AS
	declare variable nome_cidade varchar(200); 
BEGIN
	select nome_cidade
	from cidade
	where id_cidade = :pId
	into nome_cidade;

	delete from cidade
	where id_cidade = :pId;

	resultado = 'A cidade ' || nome_cidade || ' foi removido!';
END^
------------------------------------------------------------------------------------------------- 
create or alter procedure AtualizaCidade
(	pId_cidade int,
	pNome_cidade varchar(200) = ' ',
	pId_estado int = 0
)
RETURNS
(
	resultado varchar(200)
)
AS
 
BEGIN
	if(:pNome_cidade = ' ') then
		select nome_cidade from cidade where id_cidade = :pId_cidade into :pNome_cidade;

	if(:pId_estado = 0) then
		select id_estado from cidade where id_cidade = :pId_cidade into :pId_estado;

	update cidade 
	set nome_cidade = :pNome_cidade, id_estado = :pId_estado
	where id_cidade = :pId_cidade;

	  resultado = 'Cidade ' || :pId_cidade || ' foi atualizado!';
END^
-------------------------------------------------------------------------------------------------
create or alter procedure DetalheCidade
(
	pId_cidade int
)
RETURNS
(
	resultado varchar(200),
	pNome_cidade varchar(200),
	pId_estado int
)
AS
 
BEGIN
	select nome_cidade from cidade where id_cidade = :pId_cidade into :pNome_cidade;

	select id_estado from cidade where id_cidade = :pId_cidade into :pId_estado;

	resultado = 'Detalhes do cidade ' || :pId_cidade;

END^

set term ; ^
input C:\Users\polo\Desktop\bancoDados\estadoCRUD.sql;