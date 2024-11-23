show databases; 

create database db_faculdade;

use db_faculdade;

show tables;

create table tbl_curso (
id int not null primary key auto_increment,
nome varchar (100) not null,
duracao varchar (45),
unique index (id)
);

create table tbl_professor (
id int not null primary key auto_increment,
area_atuacao varchar (45) not null,
nome varchar (100) not null,
disciplinas varchar (45) not null,
unique index (id)
);

create table tbl_aluno (
id int not null primary key auto_increment,
nome varchar (100) not null,
cpf varchar (15) not null,
data_nascimento date not null,
matricula varchar (45) not null,
id_curso int not null,
constraint fk_curso
foreign key (id_curso)
references tbl_curso (id),
unique index (id)
);

create table tbl_telefone (
id int not null primary key auto_increment,
numero varchar (15) not null,
id_aluno int not null,
constraint fk_aluno
foreign key (id_aluno)
references tbl_aluno (id),
unique index (id)
);

create table tbl_email (
id int not null primary key auto_increment,
email varchar (255) not null,
id_aluno int not null,
foreign key (id_aluno)
references tbl_aluno (id),
unique index (id)
);

create table tbl_endereco (
id int not null primary key auto_increment,
logradouro varchar (50) not null, 
bairro varchar (50) not null,
cep varchar (20) not null,
cidade varchar (50) not null,
estado varchar (20) not null,
id_aluno int not null,
foreign key (id_aluno)
references tbl_aluno (id),
unique index (id)
);

create table tbl_materia (
id int not null primary key auto_increment,
curso_associado varchar (45) not null,
nome varchar (100) not null,
professor_responsavel varchar (45) not null,
id_curso int not null,
id_professor int not null,

constraint fk_curso
foreign key (id_curso)
references tbl_curso (id),

constraint fk_professor
foreign key (id_professor)
references tbl_professor (id),
unique index (id)
);

create table tbl_nota (
id int not null primary key auto_increment,
avaliacao varchar (45) not null,
data varchar (45) not null,
nota decimal not null,
id_aluno int,
id_materia int,

foreign key (id_aluno)
references tbl_aluno (id),

constraint fk_materia
foreign key (id_materia)
references tbl_materia (id),
unique index (id)
);











