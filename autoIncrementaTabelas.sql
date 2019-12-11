CREATE GENERATOR seq_estado;
SET GENERATOR seq_estado TO 0;

CREATE GENERATOR seq_cidade;
SET GENERATOR seq_cidade TO 0;

CREATE GENERATOR seq_bairro;
SET GENERATOR seq_bairro TO 0;

CREATE GENERATOR seq_endereco;
SET GENERATOR seq_endereco TO 0;

CREATE GENERATOR seq_usuario;
SET GENERATOR seq_usuario TO 0;

set term ^;

create trigger incrementa_estado
active before insert on estado
as
begin
	if(new.id_estado is null)
		then new.id_estado = next value for seq_estado;
end^

create trigger incrementa_cidade
active before insert on cidade
as
begin
	if(new.id_cidade is null)
		then new.id_cidade = next value for seq_cidade;
end^

create trigger incrementa_bairro
active before insert on bairro
as
begin
	if(new.id_bairro is null)
		then new.id_bairro = next value for seq_bairro;
end^

create trigger incrementa_endereco
	active before insert on endereco
	as
	begin
		if(new.id_endereco is null)
			then new.id_endereco = next value for seq_endereco;
	end^

create trigger incrementa_usuario
active before insert on usuario
as
begin
	if(new.id_usuario is null)
		then new.id_usuario = next value for seq_usuario;
end^

set term ; ^

input C:\Users\polo\Desktop\bancoDados\insereDados.sql;