class ElectionSystem:
    def __init__(self, database):
        self.db = database

    def list_candidates(self, year=None, candidate_name=None, position=None):
        query = "SELECT * FROM candidatura WHERE 1 = 1"
        if year:
            query += f" AND ano = {year}"
        if candidate_name:
            query += f" AND candidato IN (SELECT cpf FROM individuo WHERE nome ILIKE '%{candidate_name}%')"
        if position:
            query += f" AND cargo IN (SELECT codigo FROM cargo WHERE nome ILIKE '%{position}%')"
        rows = self.db.fetch_data(query)
        return rows

    def generate_candidate_report(self):
        query = """
            SELECT c.codigo, i.nome AS candidato, cargo.nome AS cargo, p.resultado_votos
            FROM candidatura c
            INNER JOIN individuo i ON c.candidato = i.cpf
            INNER JOIN cargo ON c.cargo = cargo.codigo
            INNER JOIN pleito p ON c.pleito = p.codigo
            WHERE c.codigo IN (
                SELECT codigo FROM candidatura WHERE candidato IN (
                    SELECT cpf FROM individuo WHERE codigo IN (
                        SELECT DISTINCT vice_candidato FROM candidatura WHERE vice_candidato IS NOT NULL
                    )
                )
            )
        """
        rows = self.db.fetch_data(query)
        return rows

    def list_ficha_limpa(self):
        query = """
            SELECT * FROM individuo WHERE cpf NOT IN (
                SELECT individuo FROM processo_judicial
                WHERE data_termino IS NOT NULL AND data_termino > CURRENT_DATE - INTERVAL '5 years'
            )
        """
        rows = self.db.fetch_data(query)
        return rows
