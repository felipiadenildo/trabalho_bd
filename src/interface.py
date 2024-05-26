from tkinter import Tk, Label, Entry, Button, Text

class Interface:
    def __init__(self, election_system):
        self.election_system = election_system

    def list_candidates(self):
        # Obter o texto inserido nos campos de entrada
        year = self.year_entry.get()
        candidate_name = self.candidate_name_entry.get()
        position = self.position_entry.get()

        # Chamar a função correspondente no sistema de eleição
        candidates = self.election_system.list_candidates(year, candidate_name, position)

        # Exibir os candidatos na caixa de texto de saída
        self.output.delete('1.0', 'end')  # Limpar o conteúdo anterior
        self.output.insert('end', "Candidates:\n")
        for candidate in candidates:
            self.output.insert('end', candidate + '\n')


    def generate_candidate_report(self):
        report = self.election_system.generate_candidate_report()
        output.delete(1.0, "end")
        output.insert("end", "Candidate Report:\n")
        for row in report:
            output.insert("end", row + "\n")

    def list_ficha_limpa(self):
        ficha_limpa = self.election_system.list_ficha_limpa()
        output.delete(1.0, "end")
        output.insert("end", "Ficha Limpa:\n")
        for person in ficha_limpa:
            output.insert("end", person + "\n")

def main():
    # Criar a janela principal
    root = Tk()
    root.title("Sistema de Eleição")

    # Adicionar um rótulo à janela
    label = Label(root, text="Bem-vindo ao Sistema de Eleição!")
    label.pack()

    # Adicionar campos de entrada para escolher a opção
    choice_label = Label(root, text="Escolha uma opção (1-3):")
    choice_label.pack()
    input_choice = Entry(root)
    input_choice.pack()

    input_year = Entry(root, width=10)
    input_year.pack()
    input_year_label = Label(root, text="Enter year (optional):")
    input_year_label.pack()

    input_name = Entry(root, width=30)
    input_name.pack()
    input_name_label = Label(root, text="Enter candidate name (optional):")
    input_name_label.pack()

    input_position = Entry(root, width=30)
    input_position.pack()
    input_position_label = Label(root, text="Enter position (optional):")
    input_position_label.pack()

    # Adicionar um campo de saída
    output = Text(root, width=50, height=10)
    output.pack()

    # Função para lidar com a escolha do usuário
    def handle_choice():
        choice = input_choice.get()
        if choice == '1':
            interface.list_candidates()
        elif choice == '2':
            interface.generate_candidate_report()
        elif choice == '3':
            interface.list_ficha_limpa()
        else:
            output.delete(1.0, "end")
            output.insert("end", "Invalid choice. Please enter a valid option.")

    # Adicionar um botão para confirmar a escolha
    choice_button = Button(root, text="Confirmar", command=handle_choice)
    choice_button.pack()

    # Criar uma instância da interface
    interface = Interface(None)

    # Iniciar o loop principal da interface
    root.mainloop()

if __name__ == "__main__":
    main()
