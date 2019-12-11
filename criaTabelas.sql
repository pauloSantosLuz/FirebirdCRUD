create database 'C:\Users\polo\Desktop\bancoDados\HelloWolrd.fdb' user 'sysdba' password 'system';

create table estado(
	id_estado int not null primary key,
	nome_estado varchar(200) not null,
	uf_estado varchar(2) not null
);

create table cidade(
	id_cidade int not null primary key,
	nome_cidade varchar(200) not null,
	id_estado int not null references estado
);

create table bairro(
	id_bairro int not null primary key,
	nome_bairro varchar(200) not null,
	id_cidade int not null references cidade
);

create table endereco(
	id_endereco int not null primary key,
	descricao varchar(500) not null,
	numero int not null,
	cep varchar(8) not null,
	complemento varchar(200),
	id_bairro int not null references bairro
);

create table usuario(
	id_usuario int not null primary key,
	nome varchar(200) not null,
	email varchar(200) not null,
	senha varchar(8) not null,
	id_endereco int not null references endereco
);

input C:\Users\polo\Desktop\bancoDados\autoIncrementaTabelas.sql;