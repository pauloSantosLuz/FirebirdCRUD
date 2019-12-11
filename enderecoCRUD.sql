set term ^ ;
create or alter procedure CriaEndereco
(	
	pDescricao varchar(500),
	pNumero int,
	pCep varchar(8),
	pId_bairro int,
	pComplemento varchar(200) = ' '
)
RETURNS
(
	resultado varchar(200)
)
AS

BEGIN
	insert into endereco(descricao, numero, cep, complemento, id_bairro)
		values (:pDescricao, :pNumero, :pCep,:pComplemento,:pId_bairro);

	resultado = 'Endereco ' || :pDescricao || ' inserido com sucesso!';
END^
-------------------------------------------------------------------------------------------------
create or alter procedure RemoveEndereco
(	
	pId integer
)
RETURNS
(
	resultado varchar(200)
)
AS
	declare variable descricao_endereco varchar(200); 
BEGIN
	select descricao
	from endereco
	where id_endereco = :pId
	into descricao_endereco;

	delete from endereco
	where id_endereco = :pId;

	resultado = 'O endereco ' || descricao_endereco || ' foi removido!';
END^
------------------------------------------------------------------------------------------------- 
create or alter procedure AtualizaEndereco
(	pId_endereco int,
	pDescricao varchar(500) = ' ',
	pNumero int = 0,
	pCep varchar(8) = ' ',
	pId_bairro int = 0,
	pComplemento varchar(200) = ' '
)
RETURNS
(
	resultado varchar(200)
)
AS
 
BEGIN
	if(:pDescricao = ' ') then
		select descricao from endereco where id_endereco = :pId_endereco into :pDescricao;

	if(:pNumero = 0) then
		select numero from endereco where id_endereco = :pId_endereco into :pNumero;

	if(:pCep = ' ') then
		select cep from endereco where id_endereco = :pId_endereco into :pCep;

	if(:pId_bairro = 0) then
		select id_bairro from endereco where id_endereco = :pId_endereco into :pId_bairro;

	if(:pComplemento = ' ') then
		select complemento from endereco where id_endereco = :pId_endereco into :pComplemento;

	if(:pId_endereco is null) then
		resultado = 'O id do endereco não pode ser null';

	update endereco 
	set descricao = :pDescricao, numero = :pNumero, cep = :pCep, id_bairro = :pId_bairro, complemento = :pComplemento
	where id_endereco = :pId_endereco;

	  resultado = 'Endereco ' || :pId_endereco || ' foi atualizado!';
END^
-------------------------------------------------------------------------------------------------
create or alter procedure DetalheEndereco
(
	pId_endereco int
)
RETURNS
(
	resultado varchar(200),	
	pDescricao varchar(500),
	pNumero int,
	pCep varchar(8),
	pId_bairro int,
	pComplemento varchar(200)
)
AS
 
BEGIN
	select descricao from endereco where id_endereco = :pId_endereco into :pDescricao;

	select numero from endereco where id_endereco = :pId_endereco into :pNumero;

	select cep from endereco where id_endereco = :pId_endereco into :pCep;

	select complemento from endereco where id_endereco = :pId_endereco into :pComplemento;

	select id_bairro from endereco where id_endereco = :pId_endereco into :pId_bairro;

	resultado = 'Detalhes do endereco ' || :pId_endereco;

END^

set term ; ^

input C:\Users\polo\Desktop\bancoDados\bairroCRUD.sql;