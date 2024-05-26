CREATE TABLE individuo (
    cpf VARCHAR(14),
    rg INTEGER,
    nome VARCHAR(100),
    data_nasc DATE,
    nacionalidade VARCHAR(100),
    telefone INTEGER,
	tipo VARCHAR(9),
    CONSTRAINT pk_individuo PRIMARY KEY (cpf),    
	CONSTRAINT ck_cpf_formato CHECK (cpf ~ '\d{3}\.\d{3}\.\d{3}-\d{2}'),
	CONSTRAINT ck_tipo CHECK (tipo IN ('apoiador', 'doador', 'candidato'))
);

CREATE TABLE processo_judicial (
    codigo INTEGER,
    individuo VARCHAR(14),
    data_abertura DATE,
    data_termino DATE,
    procedencia VARCHAR(8),
    CONSTRAINT pk_processo_judicial PRIMARY KEY (codigo),
    CONSTRAINT fk_individuo_processo_judicial FOREIGN KEY (individuo) REFERENCES individuo(cpf) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ck_procedencia CHECK (procedencia IN ('inocente', 'culpado'))
);

CREATE TABLE participante_equipe_apoio (
    individuo VARCHAR(14),
    CONSTRAINT pk_participante_equipe_apoio PRIMARY KEY (individuo),
    CONSTRAINT fk_individuo_participante_equipe_apoio FOREIGN KEY (individuo) REFERENCES individuo(cpf) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE doador (
    individuo VARCHAR(14),
    CONSTRAINT pk_doador PRIMARY KEY (individuo),
    CONSTRAINT fk_individuo_doador FOREIGN KEY (individuo) REFERENCES individuo(cpf) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE programa_partido (
    codigo INTEGER,
    programa TEXT,
    CONSTRAINT pk_programa_partido PRIMARY KEY (codigo)
);

CREATE TABLE partido (
    codigo INTEGER,
    nome VARCHAR(100),
    sigla VARCHAR(10),
    programa INTEGER,
    CONSTRAINT pk_partido PRIMARY KEY (codigo),
    CONSTRAINT fk_programa_partido FOREIGN KEY (programa) REFERENCES programa_partido(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE candidato (
    individuo VARCHAR(14),
    partido INTEGER NOT NULL,
    CONSTRAINT pk_candidato PRIMARY KEY (individuo),
    CONSTRAINT fk_individuo_candidato FOREIGN KEY (individuo) REFERENCES individuo(cpf) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_partido_candidato FOREIGN KEY (partido) REFERENCES partido(codigo) ,
    CONSTRAINT uk_partido_candidato UNIQUE (partido)
);

CREATE TABLE empresa (
    cnpj VARCHAR(18),
    nome VARCHAR(100),
    CONSTRAINT pk_empresa PRIMARY KEY (cnpj),
    CONSTRAINT ck_cnpj_formato CHECK (cnpj ~ '\d{2}\.\d{3}\.\d{3}/0001-\d{2}')
);

CREATE TABLE cargo (
    codigo INTEGER,
    nome VARCHAR(100),
    qtd_eleitos INTEGER,
    cidade VARCHAR(100),
    estado VARCHAR(100),
    CONSTRAINT pk_cargo PRIMARY KEY (codigo)
);

CREATE TABLE pleito (
    codigo INTEGER,
    resultado_votos INTEGER,
    CONSTRAINT pk_pleito PRIMARY KEY (codigo)
);

CREATE TABLE candidatura (
    codigo INTEGER,
    candidato VARCHAR(14),
    cargo INTEGER,
    ano INTEGER,
    pleito INTEGER NOT NULL,
    vice_candidato VARCHAR(14),
    CONSTRAINT pk_candidatura PRIMARY KEY (codigo),
    CONSTRAINT fk_pleito_candidatura FOREIGN KEY (pleito) REFERENCES pleito(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_candidato_candidatura FOREIGN KEY (candidato) REFERENCES candidato(individuo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_cargo_candidatura FOREIGN KEY (cargo) REFERENCES cargo(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_vice_candidato_candidatura FOREIGN KEY (vice_candidato) REFERENCES candidato(individuo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uk_candidatura UNIQUE (candidato, cargo, ano),
    CONSTRAINT uk_pleito_candidatura UNIQUE (pleito)
);

CREATE TABLE doacao (
    doador VARCHAR(14),
    candidatura INTEGER,
    CONSTRAINT pk_doacao PRIMARY KEY (doador, candidatura),
    CONSTRAINT fk_doador_doacao FOREIGN KEY (doador) REFERENCES doador(individuo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_candidatura_doacao FOREIGN KEY (candidatura) REFERENCES candidatura(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE empresa_doa (
    empresa VARCHAR(18),
    candidatura INTEGER,
    CONSTRAINT pk_empresa_doa PRIMARY KEY (empresa, candidatura),
    CONSTRAINT fk_empresa_empresa_doa FOREIGN KEY (empresa) REFERENCES empresa(cnpj) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_candidatura_empresa_doa FOREIGN KEY (candidatura) REFERENCES candidatura(codigo) ON DELETE CASCADE ON UPDATE CASCADE
	
);

CREATE TABLE telefone_empresa (
    empresa VARCHAR(18),
    telefone INTEGER,
    CONSTRAINT pk_telefone_empresa PRIMARY KEY (empresa, telefone),
    CONSTRAINT fk_empresa_telefone_empresa FOREIGN KEY (empresa) REFERENCES empresa(cnpj) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE equipe_de_apoio (
	nome VARCHAR(100),
    candidatura INTEGER,
    CONSTRAINT pk_equipe_de_apoio PRIMARY KEY (nome),
    CONSTRAINT fk_candidatura_equipe_de_apoio FOREIGN KEY (candidatura) REFERENCES candidatura(codigo) ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE participa_da_equipe_de_apoio (
    candidatura INTEGER,
    participante VARCHAR(14),
    equipe VARCHAR(100),
    CONSTRAINT pk_participa_da_equipe_de_apoio PRIMARY KEY (candidatura, participante, equipe),
    CONSTRAINT fk_candidatura_participa_da_equipe_de_apoio FOREIGN KEY (candidatura) REFERENCES candidatura(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_participante_participa_da_equipe_de_apoio FOREIGN KEY (participante) REFERENCES participante_equipe_apoio(individuo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_equipe_participa_da_equipe_de_apoio FOREIGN KEY (equipe) REFERENCES equipe_de_apoio(nome) ON DELETE CASCADE ON UPDATE CASCADE
);


/*DROP TABLE participa_da_equipe_de_apoio;
DROP TABLE equipe_de_apoio;
DROP TABLE telefone_empresa;
DROP TABLE empresa_doa;
DROP TABLE doacao;
DROP TABLE candidatura;
DROP TABLE pleito;
DROP TABLE cargo;
DROP TABLE empresa;
DROP TABLE candidato;
DROP TABLE partido;
DROP TABLE programa_partido;
DROP TABLE doador;
DROP TABLE participante_equipe_apoio;
DROP TABLE processo_judicial;
DROP TABLE individuo;*/