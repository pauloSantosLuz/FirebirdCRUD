set term ^ ;
create or alter procedure CriaUsuario
(	
	pNome varchar(200),
	pEmail varchar(200),
	pSenha varchar(8),
	pId_endereco int
)
RETURNS
(
	resultado varchar(200)
)
AS

BEGIN
	insert into usuario(nome, email, senha, id_endereco) 
		values (:pNome, :pEmail,:pSenha,:pId_endereco);

	resultado = 'Usuário ' || :pNome || ' inserido com sucesso!';
END^
-------------------------------------------------------------------------------------------------
create or alter procedure RemoveUsuario
(	
	pId integer
)
RETURNS
(
	resultado varchar(200)
)
AS
	declare variable nome varchar(200); 
BEGIN
	select nome
	from usuario
	where id_usuario = :pId
	into nome;

	delete from usuario
	where id_usuario = :pId;

	resultado = 'Usuário ' || nome || ' foi removido!';
END^
------------------------------------------------------------------------------------------------- 
create or alter procedure AtualizaUsuario
(	pId_usuario int,
	pNome varchar(200) = ' ',
	pEmail varchar(200) = ' ',
	pSenha varchar(8) = ' ',
	pId_endereco int = 0
)
RETURNS
(
	resultado varchar(200)
)
AS
 
BEGIN
	if(:pNome = ' ') then
		select nome from usuario where id_usuario = :pId_usuario into :pNome;

	if(:pEmail = ' ') then
		select email from usuario where id_usuario = :pId_usuario into :pEmail;

	if(:pSenha = ' ') then
		select senha from usuario where id_usuario = :pId_usuario into :pSenha;

	if(:pId_endereco = 0) then
		select id_endereco from usuario where id_usuario = :pId_usuario into :pId_endereco;

	if(:pId_usuario is null) then
		resultado = 'O id do usuario não pode ser null';

	update usuario 
	set nome = :pNome, email = :pEmail, senha = :pSenha, id_endereco = :pId_endereco
	where id_usuario = :pId_usuario;

	  resultado = 'Usuário ' || :pId_usuario || ' foi atualizado!';
END^
-------------------------------------------------------------------------------------------------
create or alter procedure DetalheUsuario
(
	pId_usuario int
)
RETURNS
(
	resultado varchar(200),	
	pNome varchar(200),
	pEmail varchar(200),
	pSenha varchar(8),
	pId_endereco int
)
AS
 
BEGIN
	select nome from usuario where id_usuario = :pId_usuario into :pNome;

	select email from usuario where id_usuario = :pId_usuario into :pEmail;

	select senha from usuario where id_usuario = :pId_usuario into :pSenha;

	select id_endereco from usuario where id_usuario = :pId_usuario into :pId_endereco;

	resultado = 'Detalhes do usuário ' || :pId_usuario;

END^

set term ^ ;

input C:\Users\polo\Desktop\bancoDados\enderecoCRUD.sql;