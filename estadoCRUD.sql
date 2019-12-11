set term ^ ;
create or alter procedure CriaEstado
(	
	pNome_estado varchar(200),
	pUf_estado varchar(200)
)
RETURNS
(
	resultado varchar(200)
)
AS

BEGIN
	insert into estado(nome_estado, uf_estado)
		values (:pNome_estado, :pUf_estado);

	resultado = 'Estado ' || :pNome_estado || ' inserido com sucesso!';
END^

-------------------------------------------------------------------------------------------------
create or alter procedure RemoveEstado
(	
	pId integer
)
RETURNS
(
	resultado varchar(200)
)
AS
	declare variable nome_estado varchar(200); 
BEGIN
	select nome_estado
	from estado
	where id_estado = :pId
	into nome_estado;

	delete from estado
	where id_estado = :pId;

	resultado = 'O estado ' || nome_estado || ' foi removido!';
END^
------------------------------------------------------------------------------------------------- 
create or alter procedure AtualizaEstado
(	pId_estado int,
	pNome_estado varchar(200) = ' ',
	pUf_estado varchar(200) = ' '
)
RETURNS
(
	resultado varchar(200)
)
AS
 
BEGIN
	if(:pNome_estado = ' ') then
		select nome_estado from estado where id_estado = :pId_estado into :pNome_estado;

	if(:pUf_estado = ' ') then
		select uf_estado from estado where id_estado = :pId_estado into :pUf_estado;

	update estado 
	set nome_estado = :pNome_estado, uf_estado = :pUf_estado
	where id_estado = :pId_estado;

	  resultado = 'Estado ' || :pId_estado || ' foi atualizado!';
END^
-------------------------------------------------------------------------------------------------
create or alter procedure DetalheEstado
(
	pId_estado int
)
RETURNS
(
	resultado varchar(200),
	pNome_estado varchar(200),
	pUf_estado varchar(200)
)
AS
 
BEGIN
	select nome_estado from estado where id_estado = :pId_estado into :pNome_estado;

	select uf_estado from estado where id_estado = :pId_estado into :pUf_estado;

	resultado = 'Detalhes do estado ' || :pId_estado;

END^

set term ; ^