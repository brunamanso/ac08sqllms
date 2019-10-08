CREATE TABLE Usuario(
	id INT NOT NULL,
	registro VARCHAR NOT NULL,
	nome VARCHAR (120) NOT NULL,
	email  VARCHAR (50) NOT NULL,
	celular INT NOT NULL,
	login VARCHAR (30) NOT NULL,
	senha VARCHAR (50) NOT NULL,
	data_expiracao DATE NOT NULL CONSTRAINT ('01/01/1900')
	CONSTRAINT pkUsuario PRIMARY KEY (id),
	CONSTRAINT UQ_registro UNIQUE(registro),
	CONSTRAINT UQ_email UNIQUE(email),
	CONSTRAINT UQ_login UNIQUE(login)
	);

CREATE TABLE Professor(
	id INT NOT NULL,
	id_usuario INT NOT NULL,
	apelido VARCHAR(50) NOT NULL,
	CONSTRAINT fk_Professor_Usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
	CONSTRAINT pkProfessor PRIMARY KEY (id)
	);

CREATE TABLE Coordenador(
	id INT NOT NULL,
	id_usuario INT NOT NULL,
	CONSTRAINT fk_Professor_Usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
	CONSTRAINT pkCoordenador PRIMARY KEY (id)
);

CREATE TABLE Curso(
	id INT NOT NULL,
	nome VARCHAR(120) NOT NULL,
	sigla VARCHAR(5) UNIQUE NOT NULL,
	tipo VARCHAR (30) NOT NULL,
	duracao TINYINT NOT NULL,
	sobre VARCHAR (150) NOT NULL,
	id_coordenador INT NOT NULL,
	CONSTRAINT UQ_nome UNIQUE(nome),
	CONSTRAINT fk_curso_coordenador FOREIGN KEY (id_coordenador) REFERENCES Coordenador(id),
	CONSTRAINT pkCurso PRIMARY KEY (id)
);
	
CREATE TABLE Turma(
	id INT NOT NULL,
	id_curso INT NOT NULL,
	semestre TINYINT NOT NULL,
	letra UNIQUE VARCHAR (2) NOT NULL,
	periodo VARCHAR (15) NOT NULL,
	CONSTRAINT UQ_Curso UNIQUE(Curso),
	CONSTRAINT UQ_semestre UNIQUE(semestre),
	CONSTRAINT fk_turma_curso FOREIGN KEY (id_curso) REFERENCES Curso(id),
	CONSTRAINT pkTurma PRIMARY KEY (id)
	
);
