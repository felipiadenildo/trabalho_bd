CREATE OR REPLACE FUNCTION check_ficha_limpa()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM processo_judicial 
        WHERE individuo = NEW.candidato 
          AND data_termino IS NULL
    ) THEN
        RAISE EXCEPTION 'Indivíduo não pode se candidatar, pois possui um processo em tramitação';
    END IF;

    IF EXISTS (
        SELECT 1 
        FROM processo_judicial 
        WHERE individuo = NEW.candidato 
          AND data_termino IS NOT NULL 
          AND data_termino > CURRENT_DATE - INTERVAL '5 years'
          AND procedencia = 'culpado'
    ) THEN
        RAISE EXCEPTION 'Indivíduo não pode se candidatar, pois não é ficha-limpa';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_ficha_limpa
BEFORE INSERT OR UPDATE ON candidatura
FOR EACH ROW
EXECUTE FUNCTION check_ficha_limpa();

CREATE OR REPLACE FUNCTION check_candidato()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM individuo 
        WHERE cpf = NEW.candidato 
          AND (nacionalidade = 'Brasileiro')
    ) THEN
        RAISE EXCEPTION 'O candidato deve ser brasileiro';
    END IF;
    
    IF NOT EXISTS (
        SELECT 1 
        FROM individuo 
        WHERE cpf = NEW.candidato 
          AND data_nasc <= CURRENT_DATE - INTERVAL '18 years'
    ) THEN
        RAISE EXCEPTION 'O candidato deve ter mais de 18 anos';
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_candidato
BEFORE INSERT OR UPDATE ON candidatura
FOR EACH ROW
EXECUTE FUNCTION check_candidato();

CREATE OR REPLACE FUNCTION verificar_individuo()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT COUNT(*) FROM candidato WHERE individuo = NEW.individuo) > 0 THEN
        RAISE EXCEPTION 'O indivíduo % é um candidato, portanto não pode ser doador nem participar da equipe de apoio', NEW.individuo;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_verificar_individuo_doador
BEFORE INSERT ON doador
FOR EACH ROW
EXECUTE FUNCTION verificar_individuo();

CREATE TRIGGER trg_verificar_individuo_equipe
BEFORE INSERT ON participante_equipe_apoio
FOR EACH ROW
EXECUTE FUNCTION verificar_individuo();


