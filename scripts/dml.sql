--inserções
INSERT INTO individuo (cpf, rg, nome, data_nasc, nacionalidade, telefone, tipo) VALUES
('123.456.789-00', 100001, 'João Silva', '1980-01-01', 'Brasileiro', 1111111111, 'candidato'),
('456.789.012-33', 100004, 'Ana Lima', '1985-04-04', 'Brasileiro', 4444444444, 'candidato'),
('789.012.345-66', 100007, 'José Almeida', '1970-07-07', 'Brasileiro', 7777777777, 'candidato'),
('012.345.678-99', 100010, 'Juliana Ferreira', '1998-10-10', 'Brasileiro', 1010101010, 'candidato'),
('000.000.000-01', 100011, 'Ana Campos', '1983-09-09', 'Peruano', 0000000001, 'candidato'), --estrangeira
('000.000.000-02', 100012, 'Julia Oliveira', '2000-10-01', 'Brasileiro', 0000000002, 'candidato'),
('000.000.000-03', 100013, 'Laura Penha', '1990-12-10', 'Brasileiro', 0000000003, 'candidato'),
('000.000.000-04', 100014, 'Marcos Noronha', '1971-05-21', 'Brasileiro', 0000000004, 'candidato'),
('000.000.000-05', 100015, 'Luiza Costa', '1965-01-09', 'Brasileiro', 0000000005, 'candidato'),
('000.000.000-06', 100016, 'Sofia Leite', '1983-10-09', 'Brasileiro', 0000000006, 'candidato'),
('000.000.000-07', 100017, 'Juliano Soares', '1993-12-25', 'Brasileiro', 0000000007, 'candidato'),
('000.000.000-08', 100018, 'Mariana Ferreira', '1967-03-12', 'Brasileiro', 0000000008, 'candidato'),
('000.000.000-09', 100019, 'Pedro Silva', '1980-04-19', 'Brasileiro', 0000000009, 'candidato'),
('000.000.000-11', 100020, 'Sofia Leite', '1983-07-07', 'Brasileiro', 0000000010, 'candidato'),
('000.000.000-12', 100021, 'Juliano Soares', '1961-08-08', 'Brasileiro', 0000000011, 'candidato'),
('000.000.000-13', 100022, 'Mariana Ferreira', '1975-11-12', 'Brasileiro', 0000000012, 'candidato'),

--vice-candidatos
('000.000.000-17', 100026, 'Luiz Carvalho', '1980-04-19', 'Brasileiro', 0000000016, 'candidato'),
('000.000.000-18', 100027, 'Mateus Dias', '1983-07-07', 'Brasileiro', 0000000017, 'candidato'),
('000.000.000-19', 100028, 'Luana Casagrande', '1961-08-08', 'Brasileiro', 0000000018, 'candidato'),
('000.000.000-20', 100029, 'Paula Martins', '1975-11-12', 'Brasileiro', 0000000019, 'candidato'),
('000.000.000-21', 100030, 'Marcos Aragão', '1980-04-19', 'Brasileiro', 0000000020, 'candidato'),
('000.000.000-22', 100031, 'Lucas Cesar', '1983-07-07', 'Brasileiro', 0000000021, 'candidato'),
('000.000.000-23', 100032, 'Julia Sayuri', '1961-08-08', 'Brasileiro', 0000000022, 'candidato'),
('000.000.000-24', 100033, 'Beatriz Maeda', '1975-11-12', 'Brasileiro', 0000000023, 'candidato'),

--
('000.000.000-25', 100035, 'Julia Costa', '1987-12-12', 'Colombia', 0000000024, 'candidato'), --para tentar candidatar um estrangerio à presidencia
('000.000.000-26', 100036, 'Maria Vera', '2007-07-12', 'Brasileiro', 0000000025, 'candidato'), --para tentar candidatar um menor de idade


('234.567.890-11', 100002, 'Maria Oliveira', '1975-02-02', 'Brasileiro', 2222222222, 'doador'),
('567.890.123-44', 100005, 'Pedro Santos', '1995-05-05', 'Brasileiro', 5555555555, 'doador'),
('890.123.456-77', 100008, 'Lucia Pereira', '1992-08-08', 'Brasileiro', 8888888888, 'doador'),
('000.000.000-10', 100034, 'Lucia Pereira', '2005-08-11', 'Brasileiro', 0000000010, 'doador'),

('345.678.901-22', 100003, 'Carlos Souza', '1990-03-03', 'Brasileiro', 3333333333, 'apoiador'),
('678.901.234-55', 100006, 'Paula Costa', '1988-06-06', 'Brasileiro', 6666666666, 'apoiador'),
('901.234.567-88', 100009, 'Roberto Fernandes', '1983-09-09', 'Brasileiro', 9999999999, 'apoiador'),
('000.000.000-14', 100023, 'Carlos Santos', '1987-12-03', 'Brasileiro', 0000000013, 'apoiador'),
('000.000.000-15', 100024, 'Fernanda Matos', '1978-10-12', 'Canadense', 0000000014, 'apoiador'),
('000.000.000-16', 100025, 'José Ferreita', '1959-10-30', 'Brasileiro', 0000000015, 'apoiador'),

--individuos culpados ou com processo judicial em tramitacao
('000.000.000-27', 100040, 'Paula Costa', '1988-06-06', 'Brasileiro', 0000000030, 'apoiador'),
('000.000.000-28', 100041, 'Roberto Fernandes', '1983-09-09', 'Brasileiro', 0000000031, 'apoiador'),
('000.000.000-29', 100042, 'Carlos Santos', '1987-12-03', 'Brasileiro', 0000000032, 'apoiador'),
('000.000.000-30', 100038, 'Fernanda Matos', '1978-10-12', 'Canadense', 0000000033, 'apoiador'),
('000.000.000-31', 100039, 'José Ferreita', '1959-10-30', 'Brasileiro', 0000000034, 'apoiador');


INSERT INTO processo_judicial (codigo, individuo, data_abertura, data_termino, procedencia) VALUES
--inocentes
(1, '234.567.890-11', '2019-02-02', '2021-03-03', 'inocente'),
(2, '678.901.234-55', '2017-08-08', '2019-09-09', 'inocente'),
(3, '012.345.678-99', '2013-02-02', '2013-03-03', 'inocente'),

--culpados
(4, '000.000.000-27', '2018-05-05', '2020-06-06', 'culpado'),
(5, '000.000.000-28', '2018-11-11', '2020-12-12', 'culpado'),

--em tramintação
(6, '000.000.000-29', '2019-10-10', NULL, NULL),
(7, '000.000.000-30', '2021-01-01', NULL, NULL),
(8, '000.000.000-31', '2020-07-07', NULL, NULL),

--culpado, mas há mais de 5 anos
(9, '000.000.000-21', '2013-02-02', '2013-03-03', 'culpado');



INSERT INTO programa_partido (codigo, programa) VALUES
(1, 'Programa do Partido A'),
(2, 'Programa do Partido B'),
(3, 'Programa do Partido C'),
(4, 'Programa do Partido D');

INSERT INTO partido (codigo, nome, sigla, programa) VALUES
(1, 'Partido A', 'PA', 1),
(2, 'Partido B', 'PB', 2),
(3, 'Partido C', 'PC', 3),
(4, 'Partido D', 'PD', 4);

INSERT INTO candidato (individuo, partido) VALUES
('123.456.789-00', 1), --presidentes
('456.789.012-33', 2),
('789.012.345-66', 3),
('012.345.678-99', 4), 
	
('000.000.000-01', 1), --prefeitos de sp
('000.000.000-02', 2), 
('000.000.000-03', 3), 
('000.000.000-04', 4),
	
('000.000.000-05', 1), --governadores
('000.000.000-06', 2),
('000.000.000-07', 3),
('000.000.000-08', 4),
	
('000.000.000-09', 1), --deputados
('000.000.000-11', 2),
('000.000.000-12', 3),
('000.000.000-13', 4),

--vices
('000.000.000-17', 1),
('000.000.000-18', 2),
('000.000.000-19', 3),
('000.000.000-20', 4),
('000.000.000-21', 1),
('000.000.000-22', 2),
('000.000.000-23', 3),
('000.000.000-24', 4),
	
--
('000.000.000-25', 1), --para tentar candidatar um estrangerio à presidencia
('000.000.000-26', 2); --para tentar candidatar um menor de idade


INSERT INTO cargo (codigo, nome, qtd_eleitos, cidade, estado) VALUES
(2, 'Prefeito', 1, 'São Paulo', 'SP'),
(3, 'Vereador', 10, 'São Paulo', 'SP'),
(7, 'Prefeito', 1, 'Rio de Janeiro', 'RJ'),
(8, 'Vereador', 20, 'Rio de Janeiro', 51),
(5, 'Governador', 1, NULL, 'RJ'),
(6, 'Governador', 1, NULL, 'SP'),
(1, 'Presidente', 1, NULL, 'DF'),
(4, 'Deputado Estadual', 10, NULL, 'SP'),
(9, 'Senador', 20, NULL, 'DF'),
(10, 'Deputado Federal', 70, NULL, 'SP');



INSERT INTO pleito (codigo, resultado_votos) VALUES
--candidatura 1
(1, 10000000),
(2, 50000000), --
(3, 30000000),
(4, 40000000),

--candidatura 2
(5, 4000000),
(6, 6000000),
(7, 8000000), --
(8, 2000000),

--candidatura 3
(9, 5000000),
(10, 10000000), --
(11, 5000000),
(12, 6000000),

--candidatura 4
(13, 900000),
(14, 1000000),
(15, 8000000),
(16, 9000000);--

INSERT INTO doador(individuo) VALUES
('234.567.890-11'),
('567.890.123-44'),
('890.123.456-77'),
('000.000.000-10');



INSERT INTO empresa (cnpj, nome) VALUES
('12.345.678/0001-00', 'Empresa A'),
('23.456.789/0001-11', 'Empresa B'),
('34.567.890/0001-22', 'Empresa C'),
('45.678.901/0001-33', 'Empresa D'),
('56.789.012/0001-44', 'Empresa E'),
('67.890.123/0001-55', 'Empresa F'),
('78.901.234/0001-66', 'Empresa G'),
('89.012.345/0001-77', 'Empresa H'),
('90.123.456/0001-88', 'Empresa I'),
('01.234.567/0001-99', 'Empresa J');


INSERT INTO candidatura (codigo, candidato, cargo, pleito, vice_candidato) VALUES
--candidaturas ao cargo de Presidência
(1, '123.456.789-00', 1, 1, '000.000.000-17'),
(2, '456.789.012-33', 1, 2, '000.000.000-18'),
(3, '789.012.345-66', 1, 3, '000.000.000-19'),
(4, '012.345.678-99', 1, 4, '000.000.000-20'),

--candidaturas ao cargo de Prefeito da capital São Paulo
(5, '000.000.000-01', 2, 5, '000.000.000-21'),
(6, '000.000.000-02', 2, 6, '000.000.000-22'),
(7, '000.000.000-03', 2, 7, '000.000.000-23'),
(8, '000.000.000-04', 2, 8, '000.000.000-24'),

--candidaturas ao cargo de Vereador da capital São Paulo
(9, '000.000.000-05', 3, 9, NULL),
(10, '000.000.000-06', 3, 10, NULL),
(11, '000.000.000-07', 3, 11, NULL),
(12, '000.000.000-08', 3, 12, NULL),

--candidaturas ao cargo de Deputado do estado de SP
(13, '000.000.000-09', 4, 13, NULL),
(14, '000.000.000-11', 4, 14, NULL),
(15, '000.000.000-12', 4, 15, NULL),
(16, '000.000.000-13', 4, 16, NULL);


INSERT INTO doacao (candidatura, doador, valor) VALUES
(1, '234.567.890-11', 1000.00),
(2, '567.890.123-44', 1500.00),
(3, '890.123.456-77', 2000.00),
(4, '000.000.000-10', 2500.00);


INSERT INTO empresa_doa (empresa, candidatura, valor) VALUES
('12.345.678/0001-00', 1, 10000.00),
('23.456.789/0001-11', 2, 15000.00),
('34.567.890/0001-22', 3, 20000.00),
('45.678.901/0001-33', 4, 25000.00),
('56.789.012/0001-44', 5, 30000.00),
('67.890.123/0001-55', 6, 35000.00),
('78.901.234/0001-66', 7, 40000.00),
('89.012.345/0001-77', 8, 45000.00),
('90.123.456/0001-88', 9, 50000.00),
('01.234.567/0001-99', 10, 55000.00);

INSERT INTO equipe_de_apoio (nome, candidatura) VALUES
('Equipe 1', 1),
('Equipe 2', 2),
('Equipe 3', 3),
('Equipe 4', 4),
('Equipe 5', 5),
('Equipe 6', 6),
('Equipe 7', 7),
('Equipe 8', 8),
('Equipe 9', 9),
('Equipe 10', 10);

INSERT INTO participante_equipe_apoio (individuo) VALUES
('345.678.901-22'),
('678.901.234-55'),
('901.234.567-88'),
('000.000.000-14'),
('000.000.000-15'),
('000.000.000-16');

INSERT INTO participa_da_equipe_de_apoio (candidatura, participante, equipe) VALUES
(1, '345.678.901-22', 'Equipe 1'),
(2, '678.901.234-55', 'Equipe 2'),
(3, '901.234.567-88', 'Equipe 3'),
(4, '000.000.000-14', 'Equipe 4'),
(5, '000.000.000-15', 'Equipe 5'),
(6, '000.000.000-16', 'Equipe 6');
