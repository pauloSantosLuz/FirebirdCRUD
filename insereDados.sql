insert into estado(nome_estado, uf_estado) values ('Parana', 'PR');
insert into estado(nome_estado, uf_estado) values ('Sao Paulo', 'SP');
insert into estado(nome_estado, uf_estado) values ('Minas Gerais', 'MG');
insert into estado(nome_estado, uf_estado) values ('Santa Catarina', 'SC');
insert into estado(nome_estado, uf_estado) values ('Rio de Janeiro', 'RJ');

insert into cidade(nome_cidade, id_estado) values ('Medianeira', 1);
insert into cidade(nome_cidade, id_estado) values ('Campinas', 2);
insert into cidade(nome_cidade, id_estado) values ('Juiz de Fora', 3);
insert into cidade(nome_cidade, id_estado) values ('Paraty', 5);
insert into cidade(nome_cidade, id_estado) values ('Tubarão', 4);

insert into bairro(nome_bairro, id_cidade) values ('Centro', 1);
insert into bairro(nome_bairro, id_cidade) values ('Cidade Alta', 1);
insert into bairro(nome_bairro, id_cidade) values ('Parque Independencia', 1);
insert into bairro(nome_bairro, id_cidade) values ('Belo Horizonte', 1);
insert into bairro(nome_bairro, id_cidade) values ('Dom Pedro', 1);

insert into endereco(descricao, numero, cep, id_bairro) values ('avenida independencias', 1631, '85884000',3);
insert into endereco(descricao, numero, cep, id_bairro) values ('avenida brasil', 1699, '85884000',1);
insert into endereco(descricao, numero, cep, id_bairro) values ('avenida bahia', 9631, '85884000',2);
insert into endereco(descricao, numero, cep, id_bairro) values ('rua das atibaias', 5234, '85884000',5);
insert into endereco(descricao, numero, cep, id_bairro) values ('rua dos cachorros caramelos', 3632, '85884000',4);

insert into usuario(nome, email, senha, id_endereco) values ('gelilim', 'gelimim450@mail-now.top','cripto1',1);
insert into usuario(nome, email, senha, id_endereco) values ('Abris', 'abris@mail-now.top','cripto3',2);
insert into usuario(nome, email, senha, id_endereco) values ('Robij', 'robij450@mail-now.top','cripto4',3);
insert into usuario(nome, email, senha, id_endereco) values ('Kakav', 'kakav450@mail-now.top','cripto5',4);
insert into usuario(nome, email, senha, id_endereco) values ('jark', 'jarks450@mail-now.top','cripto6',5);

input C:\Users\polo\Desktop\bancoDados\usuarioCRUD.sql;