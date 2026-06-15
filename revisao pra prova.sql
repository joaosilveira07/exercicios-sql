create database loja_roupas;
use loja_roupas;

create table produtos(
id_produto int primary key,
nome_produto varchar(80),
tamanho varchar(4),
preco decimal(8, 2)
);

create table clientes(
id_cliente int primary key auto_increment,
nome_cliente varchar(80),
email varchar(180),
data_cadastro date
);

create table medico(
id_medico int primary key auto_increment,
nome_medico varchar(80),
especialidade varchar(70)
);

create table consulta(
id_consulta int primary key auto_increment,
data_consulta date,
id_medico int,
foreign key (id_medico) references medico(id_medico)
);


insert into produtos values (1, 'camiseta', 'GG', 99.90);
insert into produtos values (2, 'bermuda', 'G', 80);
insert into produtos values (3, 'PC GAMER', 'G', 5400.99);

insert into clientes (nome_cliente, email, data_cadastro)
values ('João Pedro', 'joaozinho@gmail.com', '2026-06-15');
insert into clientes (nome_cliente, email, data_cadastro)
values ('Paloma', 'palominha@gmail.com', '2026-05-15');
insert into clientes (nome_cliente, email, data_cadastro)
values ('Valeria', 'valerinha@gmail.com', '2026-04-15');
insert into clientes (nome_cliente, email, data_cadastro)
values ('Estevao', 'estevinho@gmail.com', '2026-03-15');

insert into medico (nome_medico, especialidade)
values('Trudpert', 'Ortopedista');
insert into medico (nome_medico, especialidade)
values('Isabelo', 'Enfermeire');

insert into consulta (data_consulta, id_medico)
values('2026-03-01', 1);
insert into consulta (data_consulta, id_medico)
values('2026-04-01', 2);
insert into consulta (data_consulta, id_medico)
values('2026-05-01', 1);


