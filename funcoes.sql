set term ^ ;
create or alter function VerificaCredenciais
(
	pEmail varchar(200),
	pSenha varchar(8)
)
returns boolean
AS
	declare variable usuario varchar(200) = ' ';
BEGIN
	select nome
	from usuario
	where email = : pEmail and senha = :pSenha
	into usuario;

	if(usuario = ' ') then
		return false;
	else
		return true;
END^

set term ; ^