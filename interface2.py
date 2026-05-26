import tkinter as tk
import json

def carregar_clientes():
    try:
        with open("dados.json", "r") as arquivo:
            dados = json.load(arquivo)
            return dados["clientes"]
    except:
        return []

def atualizar_lista():
    lista_clientes.delete(0, tk.END)
    for c in clientes:
        lista_clientes.insert(tk.END, f"{c['nome']} - {c['telefone']}")

# carregar dados
clientes = carregar_clientes()

# janela
janela = tk.Tk()
janela.title("Sistema da Lanchonete")

# título
titulo = tk.Label(janela, text="Clientes", font=("Arial", 16))
titulo.pack(pady=10)

# lista
lista_clientes = tk.Listbox(janela)
lista_clientes.pack(pady=10)

# botão atualizar
botao = tk.Button(janela, text="Atualizar", command=atualizar_lista)
botao.pack(pady=10)

# inicializa lista
atualizar_lista()

janela.mainloop()