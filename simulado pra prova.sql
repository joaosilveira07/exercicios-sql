create database simuladopprova1706;
use simuladopprova1706;

# QUESTÃO 1
create table professor(
id_professor int primary key auto_increment,
nome_prof varchar(80),
instrumento varchar(100),
email varchar(120)
);

create table aluno(
id_aluno int primary key auto_increment,
nome_aluno varchar(80),
data_nasc date,
telefone varchar(14)
);

create table aula(
id_aula int primary key auto_increment,
data_aula date,
duracao_minutos int,
estado varchar(20),
id_professor int,
id_aluno int,
foreign key (id_professor) references professor(id_professor),
foreign key (id_aluno) references aluno(id_aluno)
);

# QUESTÃO 2
insert into professor (nome_prof, instrumento, email)
values ('Roberto',  'Flauta', 'robertoflauta@gmail.com');
insert into professor (nome_prof, instrumento, email)
values ('Alexandre',  'Piano', 'alexandrepiano@gmail.com');
insert into professor (nome_prof, instrumento, email)
values ('Monica',  'Violão', 'monicaviolao@gmail.com');

insert into aluno (nome_aluno, data_nasc, telefone)
values ('João Pedro', '2007-01-01', '12997777777');
insert into aluno (nome_aluno, data_nasc, telefone)
values ('Paloma Corsato', '2007-02-02', '13997777777');
insert into aluno (nome_aluno, data_nasc, telefone)
values ('Estevão Ito', '2007-03-03', '14997777777');
insert into aluno (nome_aluno, data_nasc, telefone)
values ('João Victor', '2007-04-04', '15997777777');

insert into aula (data_aula, duracao_minutos, estado, id_professor, id_aluno)
values ('2026-01-01', 20, 'concluida', 3, 1);
insert into aula (data_aula, duracao_minutos, estado, id_professor, id_aluno)
values ('2026-02-02', 30, 'cancelada', 1, 4);
insert into aula (data_aula, duracao_minutos, estado, id_professor, id_aluno)
values ('2026-03-03', 40, 'cancelada', 2, 2);
insert into aula (data_aula, duracao_minutos, estado, id_professor, id_aluno)
values ('2026-04-04', 50, 'pendente', 3, 2);
insert into aula (data_aula, duracao_minutos, estado, id_professor, id_aluno)
values ('2026-05-05', 60, 'concluida', 3, 3);
insert into aula (data_aula, duracao_minutos, estado, id_professor, id_aluno)
values ('2026-06-06', 70, 'pendente', 1, 1);

# QUESTÃO 3
select nome_prof, instrumento from professor order by nome_prof ASC;

# QUESTÃO 4
select nome_aluno, telefone from aluno
where nome_aluno like '%m%'
order by nome_aluno DESC;

# QUESTÃO 5
select * from aula
where data_aula > '2026-01-01'
order by data_aula ASC;

# QUESTÃO 6
select professor.nome_prof, aula.data_aula
from professor
inner join aula on professor.id_professor = aula.id_professor;

# QUESTÃO 7
select aluno.nome_aluno, professor.nome_prof, aula.data_aula, aula.estado
from aula
inner join aluno on aula.id_aluno = aluno.id_aluno
inner join professor on aula.id_professor = professor.id_professor;

# QUESTÃO 8
select professor.nome_prof, aula.data_aula
from professor
left join aula on professor.id_professor = aula.id_professor;

# QUESTÃO 9
select professor.nome_prof, aula.data_aula
from professor
left join aula on professor.id_professor = aula.id_professor
where aula.data_aula is null;

# QUESTÃO 10
select count(*) as total_aulas, min(duracao_minutos) as duracao_minima, max(duracao_minutos) as duracao_maxima, avg(duracao_minutos) as duracao_media
from aula;

# QUESTÃO 11
SELECT professor.nome_prof, COUNT(aula.id_aula) AS total_aulas
FROM professor
LEFT JOIN aula
ON professor.id_professor = aula.id_professor
GROUP BY professor.nome_prof
ORDER BY total_aulas DESC;

# QUESTÃO 12
SELECT estado, COUNT(*) as total
FROM aula
GROUP BY estado;
	