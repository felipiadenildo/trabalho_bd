INSERT INTO individuo (cpf, rg, nome, data_nasc, nacionalidade, telefone) VALUES
('123.456.789-01', 123456789, 'Carlos Silva', '1980-05-15', 'Brasileiro', 11987654321),
('234.567.890-12', 234567890, 'Ana Oliveira', '1990-08-22', 'Brasileiro', 11987654322),
('345.678.901-23', 345678901, 'João Souza', '1985-02-10', 'Brasileiro', 11987654323),
('456.789.012-34', 456789012, 'Maria Fernandes', '1975-12-30', 'Brasileiro', 11987654324),
('567.890.123-45', 567890123, 'Pedro Almeida', '1982-07-19', 'Brasileiro', 11987654325),
('678.901.234-56', 678901234, 'Luciana Costa', '1995-04-28', 'Brasileiro', 11987654326),
('789.012.345-67', 789012345, 'Marcos Pereira', '1988-03-14', 'Brasileiro', 11987654327),
('890.123.456-78', 890123456, 'Juliana Lima', '1992-11-11', 'Brasileiro', 11987654328),
('901.234.567-89', 901234567, 'Ricardo Ribeiro', '1978-06-25', 'Brasileiro', 11987654329),
('012.345.678-90', 123456780, 'Fernanda Nogueira', '1983-09-30', 'Brasileiro', 11987654330);

INSERT INTO processo_judicial (codigo, individuo, data_abertura, data_termino, procedencia) VALUES
(1, '123.456.789-01', '2022-01-10', '2022-03-15', 'inocente'),
(2, '234.567.890-12', '2021-05-05', '2021-12-01', 'culpado'),
(3, '345.678.901-23', '2020-08-15', '2020-10-20', 'inocente'),
(4, '456.789.012-34', '2019-03-22', '2019-09-30', 'culpado'),
(5, '567.890.123-45', '2018-07-10', '2018-11-05', 'inocente'),
(6, '678.901.234-56', '2017-12-01', '2018-03-15', 'culpado'),
(7, '789.012.345-67', '2021-09-17', '2022-02-28', 'inocente'),
(8, '890.123.456-78', '2016-04-20', '2016-08-25', 'culpado'),
(9, '901.234.567-89', '2015-11-11', '2016-01-20', 'inocente'),
(10, '012.345.678-90', '2014-05-30', '2014-10-15', 'culpado');

INSERT INTO participante_equipe_apoio (individuo) VALUES
('123.456.789-01'),
('345.678.901-23'),
('456.789.012-34'),
('567.890.123-45'),
('678.901.234-56'),
('789.012.345-67'),
('890.123.456-78'),
('901.234.567-89'),
('012.345.678-90'),
('234.567.890-12');

INSERT INTO doador (individuo) VALUES
('234.567.890-12'),
('345.678.901-23'),
('456.789.012-34'),
('567.890.123-45'),
('678.901.234-56'),
('789.012.345-67'),
('890.123.456-78'),
('901.234.567-89'),
('012.345.678-90'),
('123.456.789-01');

INSERT INTO programa_partido (codigo, programa) VALUES
(1, 'Programa de melhorias sociais'),
(2, 'Programa de desenvolvimento econômico'),
(3, 'Programa de educação'),
(4, 'Programa de saúde'),
(5, 'Programa de infraestrutura'),
(6, 'Programa de segurança pública'),
(7, 'Programa de tecnologia'),
(8, 'Programa de cultura'),
(9, 'Programa de esportes'),
(10, 'Programa de meio ambiente');

INSERT INTO partido (codigo, nome, sigla, programa) VALUES
(1, 'Partido Social', 'PS', 1),
(2, 'Partido Econômico', 'PE', 2),
(3, 'Partido da Educação', 'PDE', 3),
(4, 'Partido da Saúde', 'PDS', 4),
(5, 'Partido da Infraestrutura', 'PI', 5),
(6, 'Partido da Segurança', 'PSP', 6),
(7, 'Partido da Tecnologia', 'PT', 7),
(8, 'Partido da Cultura', 'PC', 8),
(9, 'Partido dos Esportes', 'PDE', 9),
(10, 'Partido do Meio Ambiente', 'PMA', 10);

INSERT INTO candidato (individuo, partido) VALUES
('123.456.789-01', 1),
('234.567.890-12', 2),
('345.678.901-23', 3),
('456.789.012-34', 4),
('567.890.123-45', 5),
('678.901.234-56', 6),
('789.012.345-67', 7),
('890.123.456-78', 8),
('901.234.567-89', 9),
('012.345.678-90', 10);

INSERT INTO empresa (cnpj, nome) VALUES
('12.345.678/0001-90', 'Empresa Alpha'),
('23.456.789/0001-01', 'Empresa Beta'),
('34.567.890/0001-12', 'Empresa Gamma'),
('45.678.901/0001-23', 'Empresa Delta'),
('56.789.012/0001-34', 'Empresa Epsilon'),
('67.890.123/0001-45', 'Empresa Zeta'),
('78.901.234/0001-56', 'Empresa Eta'),
('89.012.345/0001-67', 'Empresa Theta'),
('90.123.456/0001-78', 'Empresa Iota'),
('01.234.567/0001-89', 'Empresa Kappa');

INSERT INTO cargo (codigo, nome, qtd_eleitos, cidade, estado) VALUES
(1, 'Presidente', 1, 'Brasília', 'DF'),
(2, 'Governador', 1, 'São Paulo', 'SP'),
(3, 'Senador', 3, 'Brasília', 'DF'),
(4, 'Deputado Federal', 70, 'Brasília', 'DF'),
(5, 'Deputado Estadual', 94, 'São Paulo', 'SP'),
(6, 'Prefeito', 1, 'São Paulo', 'SP'),
(7, 'Vereador', 55, 'São Paulo', 'SP'),
(8, 'Ministro', 30, 'Brasília', 'DF'),
(9, 'Secretário', 50, 'São Paulo', 'SP'),
(10, 'Governador', 1, 'Rio de Janeiro', 'RJ');

INSERT INTO pleito (codigo, resultado_votos) VALUES
(1, 1000000),
(2, 2000000),
(3, 1500000),
(4, 1800000),
(5, 2200000),
(6, 1100000),
(7, 900000),
(8, 1300000),
(9, 1700000),
(10, 2100000);

INSERT INTO candidatura (codigo, candidato, cargo, ano, pleito, vice_candidato) VALUES
(1, '123.456.789-01', 1, 2022, 1, '234.567.890-12'),
(2, '234.567.890-12', 2, 2022, 2, '345.678.901-23'),
(3, '345.678.901-23', 3, 2022, 3, '456.789.012-34'),
(4, '456.789.012-34', 4, 2022, 4, '567.890.123-45'),
(5, '567.890.123-45', 5, 2022, 5, '678.901.234-56'),
(6, '678.901.234-56', 6, 2022, 6, '789.012.345-67'),
(7, '789.012.345-67', 7, 2022, 7, '890.123.456-78'),
(8, '890.123.456-78', 8, 2022, 8, '901.234.567-89'),
(9, '901.234.567-89', 9, 2022, 9, '012.345.678-90'),
(10, '012.345.678-90', 10, 2022, 10, '123.456.789-01');

INSERT INTO doacao (doador, candidatura) VALUES
('234.567.890-12', 1),
('345.678.901-23', 2),
('456.789.012-34', 3),
('567.890.123-45', 4),
('678.901.234-56', 5),
('789.012.345-67', 6),
('890.123.456-78', 7),
('901.234.567-89', 8),
('012.345.678-90', 9),
('123.456.789-01', 10);

INSERT INTO empresa_doa (empresa, candidatura) VALUES
('12.345.678/0001-90', 1),
('23.456.789/0001-01', 2),
('34.567.890/0001-12', 3),
('45.678.901/0001-23', 4),
('56.789.012/0001-34', 5),
('67.890.123/0001-45', 6),
('78.901.234/0001-56', 7),
('89.012.345/0001-67', 8),
('90.123.456/0001-78', 9),
('01.234.567/0001-89', 10);

INSERT INTO telefone_empresa (empresa, telefone) VALUES
('12.345.678/0001-90', 1134567890),
('23.456.789/0001-01', 1145678901),
('34.567.890/0001-12', 1156789012),
('45.678.901/0001-23', 1167890123),
('56.789.012/0001-34', 1178901234),
('67.890.123/0001-45', 1189012345),
('78.901.234/0001-56', 1190123456),
('89.012.345/0001-67', 1101234567),
('90.123.456/0001-78', 1112345678),
('01.234.567/0001-89', 1123456789);

INSERT INTO equipe_de_apoio (nome, candidatura) VALUES
('Equipe A', 1),
('Equipe B', 2),
('Equipe C', 3),
('Equipe D', 4),
('Equipe E', 5),
('Equipe F', 6),
('Equipe G', 7),
('Equipe H', 8),
('Equipe I', 9),
('Equipe J', 10);

INSERT INTO participa_da_equipe_de_apoio (candidatura, participante, equipe) VALUES
(1, '123.456.789-01', 'Equipe A'),
(2, '234.567.890-12', 'Equipe B'),
(3, '345.678.901-23', 'Equipe C'),
(4, '456.789.012-34', 'Equipe D'),
(5, '567.890.123-45', 'Equipe E'),
(6, '678.901.234-56', 'Equipe F'),
(7, '789.012.345-67', 'Equipe G'),
(8, '890.123.456-78', 'Equipe H'),
(9, '901.234.567-89', 'Equipe I'),
(10, '012.345.678-90', 'Equipe J');
