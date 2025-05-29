use db_faculdade_portifolio

create table tbl_aluno(
 id int not null primary key auto_increment,
 nome varchar(500) not null,
 cpf varchar(14) not null,
 rg varchar(15) not null
);

create table tbl_email(
 id int not null primary key auto_increment,
 id_aluno int not null,
 email varchar(255) not null,
 
 constraint FK_email_aluno
 foreign key (id_aluno)
 references tbl_aluno (id)
);

create table tbl_telefone(
 id int not null primary key auto_increment,
 id_aluno int not null,
 telefone varchar(20) not null,
 
 constraint FK_telefone_aluno
 foreign key (id_aluno)
 references tbl_aluno (id)
);

create table tbl_endereco(
 id int not null primary key auto_increment,
 id_aluno int not null,
 pais varchar(100),
 estado varchar(100),
 cidade varchar(100),
 logradouro varchar(100),
 cep varchar(100),
 numero_casa varchar(100),
 
 constraint FK_endereco_aluno
 foreign key (id_aluno)
 references tbl_aluno (id)
);

create table tbl_professor(
 id int not null primary key auto_increment,
 nome varchar(300)
);

create table tbl_prof_telefone(
 id int not null primary key auto_increment,
 id_professor int not null,
 prof_telefone varchar(20) not null,
 
 constraint FK_prof_telefone
 foreign key (id_professor)
 references tbl_professor (id)
);

create table tbl_prof_email(
 id int not null primary key auto_increment,
 id_professor int not null,
 prof_email varchar(255) not null,
 
 constraint FK_prof_email
 foreign key (id_professor)
 references tbl_professor (id)
);

create table tbl_curso(
 id int not null primary key auto_increment,
 nome_curso varchar(300) not null,
 coordenador varchar(100),
 carga_horaria int not null 
);

create table tbl_turma(
 id int not null primary key auto_increment,
 id_professor int not null,
 nome_turma varchar(45) not null,
 quantidade_alunos int not null,
 ano_letivo int not null,
 periodo varchar(50),
 
 constraint FK_turma_prof
 foreign key (id_professor)
 references tbl_professor (id)
);

create table tbl_materia(
 id int not null primary key auto_increment,
 id_curso int not null,
 id_professor int not null,
 id_turma int not null,
 notas int not null,
 faltas int not null,

 constraint FK_curso_materia
 foreign key (id_curso)
 references tbl_curso (id),
 
 constraint FK_professor_materia
 foreign key (id_professor)
 references tbl_professor (id),
 
 constraint FK_turma_materia
 foreign key (id_turma)
 references tbl_turma (id)
);

create table tbl_matricula(
 id int not null primary key auto_increment,
 id_aluno int not null,
 id_curso int not null,
 id_turma int not null,
 status_matricula varchar(50) not null,
 data_matricula date not null,
 preco float not null,
 RA varchar(50),
 
 constraint FK_aluno_matricula
 foreign key (id_aluno)
 references tbl_aluno (id),
 
 constraint FK_curso_matricula
 foreign key (id_curso)
 references tbl_curso (id),
 
 constraint FK_turma_matricula
 foreign key (id_turma)
 references tbl_turma (id)
);

