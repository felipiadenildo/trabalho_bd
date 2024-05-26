from tkinter import Tk, Label, Button, Entry, Text

from elections_system import ElectionSystem


class Interface:
    def __init__(self, election_system):
        self.election_system = election_system

    def start(self):
        # Criar a janela principal
        self.root = Tk()
        self.root.title("Sistema de Eleição")

        # Adicionar um rótulo à janela
        self.label = Label(self.root, text="Bem-vindo ao Sistema de Eleição!")
        self.label.pack()

        # Adicionar botões para as opções
        self.list_candidates_button = Button(self.root, text="Listar Candidatos", command=self.list_candidates)
        self.list_candidates_button.pack()

        self.generate_report_button = Button(self.root, text="Gerar Relatório de Candidatos", command=self.generate_candidate_report)
        self.generate_report_button.pack()

        self.list_ficha_limpa_button = Button(self.root, text="Listar Ficha Limpa", command=self.list_ficha_limpa)
        self.list_ficha_limpa_button.pack()

        self.exit_button = Button(self.root, text="Sair", command=self.exit_program)
        self.exit_button.pack()

        # Adicionar campos de entrada para entrada de dados
        self.year_entry = Entry(self.root)
        self.year_entry.pack()
        self.year_entry.insert(0, "Ano (opcional)")

        self.candidate_name_entry = Entry(self.root)
        self.candidate_name_entry.pack()
        self.candidate_name_entry.insert(0, "Nome do Candidato (opcional)")

        self.position_entry = Entry(self.root)
        self.position_entry.pack()
        self.position_entry.insert(0, "Posição (opcional)")

        # Adicionar área de texto para exibir os resultados
        self.result_text = Text(self.root, height=10, width=50)
        self.result_text.pack()

        # Iniciar o loop principal da interface
        self.root.mainloop()

    def list_candidates(self):
        year = self.year_entry.get()
        candidate_name = self.candidate_name_entry.get()
        position = self.position_entry.get()
        candidates = self.election_system.list_candidates(year, candidate_name, position)
        self.display_results("Candidatos:", candidates)

    def generate_candidate_report(self):
        report = self.election_system.generate_candidate_report()
        self.display_results("Relatório de Candidatos:", report)

    def list_ficha_limpa(self):
        ficha_limpa = self.election_system.list_ficha_limpa()
        self.display_results("Ficha Limpa:", ficha_limpa)

    def display_results(self, title, results):
        self.result_text.delete("1.0", "end")
        self.result_text.insert("1.0", f"{title}\n")
        for result in results:
            self.result_text.insert("end", f"{result}\n")

    def exit_program(self):
        print("Saindo do programa. Adeus!")
        self.root.quit()

def main():
    # Supondo que o parâmetro necessário seja um banco de dados chamado 'db'
    db = "database.db"
    
    # Criar uma instância do sistema de eleição com o parâmetro
    election_system = ElectionSystem(db)

    # Iniciar a interface gráfica
    interface = Interface(election_system)
    interface.start()

if __name__ == "__main__":
    main()
