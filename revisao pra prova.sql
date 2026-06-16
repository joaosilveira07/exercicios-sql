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

create table curso(
id_curso int primary key auto_increment,
nome varchar(100),
mensalidade int
);

create table alunos(
id_aluno int primary key auto_increment,
nome_aluno varchar(80),
data_nasc date,
id_curso int,
foreign key (id_curso) references curso(id_curso)
);

create table autor(
id_autor int primary key auto_increment,
nome_autor varchar(80),
nacionalidade varchar(60)
);

create table livro(
id_livro int primary key auto_increment,
titulo varchar(120),
ano_publicacao date,
id_autor int,
foreign key (id_autor) references autor(id_autor)
);

create table emprestimo(
id_emprestimo int primary key auto_increment,
nome_aluno varchar(80),
data_emprestimo date,
data_devolucao date,
estado varchar(50),
id_livro int,
foreign key (id_livro) references livro(id_livro)
);

create table funcionarios(
id_funcionario int primary key auto_increment,
nome varchar(80),
cargo varchar(60)	
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

insert into curso (nome, mensalidade)
values ('Engenharia de Software', 2781);
insert into curso (nome, mensalidade)
values ('Engenharia da Computação', 2320);
insert into curso (nome, mensalidade)
values ('Ciência da Computação', 1900);


insert into alunos (nome_aluno, data_nasc, id_curso)
values ('João Pedro', '2007-11-06', 1);
insert into alunos (nome_aluno, data_nasc, id_curso)
values ('Luiz Gustavo', '2008-01-01', 1);
insert into alunos (nome_aluno, data_nasc, id_curso)
values ('Udson Júnior', '2003-12-28', 3);
insert into alunos (nome_aluno, data_nasc, id_curso)
values ('Paloma Corsato', '2007-08-22', 1);
insert into alunos (nome_aluno, data_nasc, id_curso)
values ('Estevao Ito', '2007-02-22', 2);
insert into alunos (nome_aluno, data_nasc, id_curso)
values ('Aquiles Ito', '2008-10-01', 2);

insert into autor (nome_autor, nacionalidade)
values ('Machado de Assis', 'Brasileiro');
insert into autor (nome_autor, nacionalidade)
values ('Stephen King', 'Americano');
insert into autor (nome_autor, nacionalidade)
values ('Franz Kafka', 'Alemão');

insert into livro (titulo, ano_publicacao, id_autor)
values ('Memórias Póstumas', '1801-01-01', 1);
insert into livro (titulo, ano_publicacao, id_autor)
values ('Dom Casmurro', '1802-02-02', 1);
insert into livro (titulo, ano_publicacao, id_autor)
values ('Pequeno Princípe', '1803-03-03', 2);
insert into livro (titulo, ano_publicacao, id_autor)
values ('Homem-Aranha', '1804-04-04', 2);
insert into livro (titulo, ano_publicacao, id_autor)
values ('A Rede Social', '1805-05-05', 3);

insert into emprestimo (nome_aluno, data_emprestimo, data_devolucao, estado, id_livro)
values ('João Pedro', '2026-01-01', '2026-12-12', 'Pendente', 4);
insert into emprestimo (nome_aluno, data_emprestimo, data_devolucao, estado, id_livro)
values ('João Pedro', '2026-01-01', '2026-02-02', 'Devolvido', 1);
insert into emprestimo (nome_aluno, data_emprestimo, data_devolucao, estado, id_livro)
values ('Paloma Corsato', '2026-02-02', '2026-03-03', 'Devolvido', 2);
insert into emprestimo (nome_aluno, data_emprestimo, data_devolucao, estado, id_livro)
values ('Paloma Corsato', '2026-05-05', '2026-12-15', 'Pendente', 4);
insert into emprestimo (nome_aluno, data_emprestimo, data_devolucao, estado, id_livro)
values ('Estevão Ito', '2026-01-01', '2026-01-25', 'Devolvido', 5);	

alter table funcionarios
add column salario decimal(10,2);

alter table funcionarios 
modify nome varchar(100);

alter table funcionarios
change cargo funcao varchar(60);

alter table funcionarios
drop column funcao;

alter table funcionarios
add column cidade varchar(70);

insert into funcionarios (nome, salario, cidade)
values ('João Pedro', 1800, 'Americana');
insert into funcionarios (nome, salario, cidade)
values ('Paloma', 2300, 'Sumaré');
insert into funcionarios (nome, salario, cidade)
values ('Estevão', 2000, 'Americana');
insert into funcionarios (nome, salario, cidade)
values ('João Victor', 1800, 'Nova Odessa');


update funcionarios
set salario = 4500
where id_funcionario = 3;

update funcionarios
set salario = 2300,
	cidade = 'Campinas'
where id_funcionario = 1;

update funcionarios
set salario = 5000
where cidade = 'Americana';

delete from funcionarios
where id_funcionario = 3;

delete from funcionarios 
where salario < 2000;

truncate table funcionarios;

select * from funcionarios;

create table veiculos(
id_veiculo int primary key auto_increment,
marca varchar(50),
modelo varchar(50)
);

rename table veiculos to carros;

alter table carros
add column ano int;

alter table carros
modify marca varchar(60);

drop table carros;

select * from carros;

