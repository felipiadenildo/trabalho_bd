-- Remover dados de todas as tabelas na ordem correta para evitar problemas com chaves estrangeiras
DELETE FROM participa_da_equipe_de_apoio;
DELETE FROM equipe_de_apoio;
DELETE FROM telefone_empresa;
DELETE FROM empresa_doa;
DELETE FROM doacao;
DELETE FROM candidatura;
DELETE FROM pleito;
DELETE FROM cargo;
DELETE FROM empresa;
DELETE FROM candidato;
DELETE FROM partido;
DELETE FROM programa_partido;
DELETE FROM doador;
DELETE FROM participante_equipe_apoio;
DELETE FROM processo_judicial;
DELETE FROM individuo;