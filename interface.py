import tkinter as tk
from banco import cadastrar_cliente, buscar_clientes, buscar_cliente_por_id
from datetime import datetime

#ESTILIZAÇÃO VARIÁVEIS:
COR_FUNDO = "#fff8f0"
COR_PRIMARIA = "#d35400"
COR_BOTAO = "#27ae60"
COR_BOTAO_DELETE = "#e74c3c"
COR_BOTAO_ATUALIZAR = "#3498db"
COR_TEXTO = "#2d3436"

#VARIÁVEIS GLOBAIS
entrada_nome = None
entrada_telefone = None
entrada_pedido = None
resultado = None
mensagem = None
entrada_id = None
entrada_id_update = None
entrada_nome_update = None
entrada_tel_update = None
entrada_pedido_update = None
entrada_data_inicio = None
entrada_data_fim = None
entrada_busca = None

#LISTAR CLIENTES
def listar_clientes():
    data_inicio = entrada_data_inicio.get().strip()
    data_fim = entrada_data_fim.get().strip()
    nome_busca = entrada_busca.get().strip()
    
    clientes = []
    
    try:
        if nome_busca:
            #Se buscar pelo nome --- ignora a data
            clientes = buscar_clientes(nome_busca=nome_busca)
            
            entrada_busca.delete(0, tk.END)
            
        elif data_inicio and data_fim:
            data_inicio = datetime.strptime(data_inicio, "%d-%m-%Y")
            data_fim = datetime.strptime(data_fim, "%d-%m-%Y")
            data_fim = data_fim.replace(hour=23, minute=59, second=59)
            
            clientes = buscar_clientes(data_inicio, data_fim)
            
            #Senão --- só busca os clientes de hoje
        else:
            hoje_inicio = datetime.now().replace(hour=0, minute=0, second=0)
            hoje_fim = datetime.now().replace(hour=23, minute=59, second=59)  
            
            clientes = buscar_clientes(hoje_inicio, hoje_fim)
            
    except ValueError:
        mostrar_mensagem("Formato inválido! Use DD-MM-YYYY")
        return
    
    resultado.delete("1.0", tk.END)
    
    
    if not clientes:
        resultado.insert(tk.END, "Nenhum cliente encontrado\n")
        return
    
    for c in clientes:
        data_formatada = c[4].strftime("%d/%m/%Y %H:%M")
        texto = f"ID: {c[0]} | Nome: {c[1]} | Tel: {c[2]} | Pedido: {c[3]} | Data: {data_formatada}\n"
        resultado.insert(tk.END, texto)
             
#CADASTRAR 
def cadastrar():
    nome = entrada_nome.get()
    telefone = entrada_telefone.get()
    pedido = entrada_pedido.get()
    
    cadastrar_cliente(nome, telefone, pedido)
    
    if not nome or not pedido:
        mostrar_mensagem("Preencha os campos de" "Nome e Telefone")
        return
        
    mostrar_mensagem("Cliente cadastrado com sucesso!")
    
    
    entrada_nome.delete(0, tk.END)
    entrada_telefone.delete(0, tk.END)
    entrada_pedido.delete(0, tk.END)
    
#Função DELETAR:
def deletar():
    try:
        id_cliente = int(entrada_id.get())
        
        from banco import conectar
        conexao = conectar()
        cursor = conexao.cursor()
        
        cursor.execute(
            "call public.gerenciar_cliente(%s, %s, %s, %s, %s)",
            ("DELETE", id_cliente, None, None, None)
        )
        
        conexao.commit()
        cursor.close()
        conexao.close()
        
        mostrar_mensagem("Cliente deletado!")
        entrada_id.delete(0,tk.END)
        
        listar_clientes()
        
    except Exception as e:
        print("Erro:", e)
        
#Função ATUALIZAR:  
def atualizar():
    try:
        id_cliente = int(entrada_id_update.get())
        nome = entrada_nome_update.get()
        telefone = entrada_tel_update.get()
        pedido = entrada_pedido_update.get()
        
        from banco import conectar
        conexao = conectar()
        cursor = conexao.cursor()
        
        cursor.execute(
            "call public.gerenciar_cliente(%s, %s, %s, %s, %s)",
            ("UPDATE", id_cliente, nome, telefone, pedido)
        )
        
        conexao.commit()
        cursor.close()
        conexao.close()
        
        mostrar_mensagem("Cliente atualizado!")
        
        entrada_id_update.delete(0, tk.END)
        entrada_nome_update.delete(0, tk.END)
        entrada_tel_update.delete(0, tk.END)
        entrada_pedido_update.delete(0, tk.END)
        
        listar_clientes()
        
    except Exception as e:
        print("Erro:", e)
        
        
#Função busca_campo (autoencremento)
def carregar_cliente_auto(event=None):
    try:
        texto = entrada_id_update.get()
        
        #Se apagar o id, irá limpar tudo
        if texto == "":
            entrada_nome_update.delete(0, tk.END)
            entrada_tel_update.delete(0, tk.END)
            entrada_pedido_update.delete(0, tk.END)
            return
        
        entrada_nome_update.delete(0, tk.END)
        entrada_tel_update.delete(0, tk.END)
        entrada_pedido_update.delete(0, tk.END)
        
                
        id_cliente = int(texto)
        
        cliente = buscar_cliente_por_id(id_cliente)
        
        if cliente:
            entrada_nome_update.delete(0, tk.END)
            entrada_tel_update.delete(0, tk.END)
            entrada_pedido_update.delete(0, tk.END)
            
            entrada_nome_update.insert(0, cliente[0])
            entrada_tel_update.insert(0, cliente[1])
            entrada_pedido_update.insert(0, cliente[2])
            
    except:
        #Se digitar algum dado inválido, limpa
        entrada_nome_update.delete(0, tk.END)
        entrada_tel_update.delete(0, tk.END)
        entrada_pedido_update.delete(0, tk.END)
        
        
def mostrar_mensagem(texto, cor="green", tempo=3000):
    mensagem.config(text=texto, fg=cor)
    mensagem.after(tempo, lambda: mensagem.config(text=""))
        
    
#INTERFACE  
def iniciar_sistema():
    global entrada_nome, entrada_telefone, entrada_pedido
    global resultado, mensagem
    global entrada_id, entrada_id_update
    global entrada_nome_update, entrada_tel_update, entrada_pedido_update
    global entrada_data_inicio, entrada_data_fim
    global entrada_busca
    
 #Configuração da janela   
    janela = tk.Tk()
    janela.title("Sistema Lanchonete Shalon")
    janela.state("zoomed")
    janela.resizable(False, False) #Tamanho da janela
    janela.configure(bg=COR_FUNDO) #Configuração de cor
    

    frame_principal = tk.Frame(janela)
    frame_principal.pack(fill="both", expand=True)
    
    #TÍTULO PRINCIPAL
    titulo_principal = tk.Label(
        frame_principal,
        text="Lanchonete Shalon 🍔",
        font=("Segoe UI", 20, "bold"),
        bg=COR_FUNDO,
        fg=COR_PRIMARIA
    )
    titulo_principal.pack(pady=15)
    
    #Lado esquerdo 
    #Variável para alinhar 
    frame_esquerda = tk.Frame(frame_principal, bg=COR_FUNDO, width=500)
    frame_esquerda.pack(side="left", fill="both", padx=8, pady=8)
    
    frame_conteudo = tk.Frame(frame_esquerda, bg=COR_FUNDO)
    frame_conteudo.pack(fill="both", expand=True)
    
    frame_msg = tk.Frame(frame_esquerda, bg=COR_FUNDO, height=40)
    frame_msg.pack(fill="x", side="bottom")
    
    coluna1 = tk.Frame(frame_conteudo, bg=COR_FUNDO)
    coluna1.pack(side="left", fill="both", padx=5)
    
    coluna2 = tk.Frame(frame_conteudo, bg=COR_FUNDO)
    coluna2.pack(side="right", fill="both", padx=5)
    
    #BLOCO PARA ALINHAR O CADASTRO
    frame_form = tk.Frame(coluna1,bg=COR_FUNDO)
    frame_form.pack(fill="x", pady=5)
    
    
    #Lado direito
    frame_direita = tk.Frame(frame_principal, bg=COR_FUNDO)
    frame_direita.pack(side="right", fill="both", expand=True, padx=8, pady=8)
    
    
    #TOPO DO LADO DIREITO
    frame_topo = tk.Frame(frame_direita, bg=COR_FUNDO)
    frame_topo.pack(fill="x", pady=3)
    
    #TOPO CAMPO DATA
    frame_filtro_data = tk.Frame(frame_topo, bg=COR_FUNDO)
    frame_filtro_data.pack(side="left", padx=5)
    
    #TOPO CAMPO NOME_BUsca
    frame_busca = tk.Frame(frame_topo, bg=COR_FUNDO)
    frame_busca.pack(side="right", padx=15)
    
    #AGORA O CAMPO DATA --- LADO ESQUERDO ---
    tk.Label(frame_filtro_data, text="--- Filtrar por Data ---", 
         font=("Segoe UI", 10, "bold"),
         bg=COR_FUNDO, fg=COR_PRIMARIA).pack()
    
    #CAMPOS DE DATA
    linha_datas = tk.Frame(frame_filtro_data, bg=COR_FUNDO)
    linha_datas.pack()
    
    #Parte do "De:"
    bloco_de = tk.Frame(linha_datas, bg=COR_FUNDO)
    bloco_de.pack(side="left", padx=5)
    
    tk.Label(bloco_de, text="De:", bg=COR_FUNDO).pack()
    entrada_data_inicio = tk.Entry(bloco_de, width=12)
    entrada_data_inicio.insert(0, datetime.now().strftime("%d-%m-%Y"))
    entrada_data_inicio.pack()
    
    
    #Parte do "Até:"
    bloco_ate = tk.Frame(linha_datas, bg=COR_FUNDO)
    bloco_ate.pack(side="left", padx=5)
    
    tk.Label(bloco_ate, text="Até:", bg=COR_FUNDO).pack()
    entrada_data_fim = tk.Entry(bloco_ate, width=12)
    entrada_data_fim.insert(0, datetime.now().strftime("%d-%m-%Y"))
    entrada_data_fim.pack()
    
    
#BOTÃO PARA FILTRAR POR DATA
    tk.Button (
        frame_filtro_data,
        text="Filtrar",
        command=listar_clientes,
        bg=COR_PRIMARIA,
        fg="white",
        width=12,
    ).pack(pady=8)
    
    
#CAMPO BUSCAR POR NOME --- LADO DIREITO ---
    tk.Label(frame_busca, text="--- Buscar Cliente: ---", 
              font=("Segoe UI", 10, "bold"),
              bg=COR_FUNDO, fg=COR_PRIMARIA).pack()
    
    entrada_busca = tk.Entry(frame_busca, width=20)
    entrada_busca.pack(pady=5)
    
    #BOTÃO CAMPO BUSCAR POR NOME DO CLIENTE
    tk.Button(
        frame_busca,
        text="Buscar",
        command=listar_clientes,
        bg=COR_PRIMARIA,
        fg="white",
        width=12
    ).pack(pady=8)
    
#CADASTRO
    tk.Label(frame_form, text="--- Cadastrar Cliente ---", bg=COR_FUNDO, fg=COR_PRIMARIA, font=("Segoe UI", 10, "bold")).pack(anchor="w")

    tk.Label(frame_form, text="Nome:", bg=COR_FUNDO, fg=COR_TEXTO).pack(anchor="w", pady=(5, 0))
    entrada_nome = tk.Entry(frame_form, width=35)
    entrada_nome.pack(pady=(0, 8))
    
    tk.Label(frame_form, text="Telefone:", bg=COR_FUNDO, fg=COR_TEXTO).pack(anchor="w")
    entrada_telefone = tk.Entry(frame_form, width=35)
    entrada_telefone.pack(pady=5)
    
    tk.Label(frame_form, text="Pedido:", bg=COR_FUNDO, fg=COR_TEXTO).pack(anchor="w")
    entrada_pedido = tk.Entry(frame_form, width=35)
    entrada_pedido.pack(pady=5)
    
    
#Botão de CADASTRAR
    tk.Button(
        frame_form,
        text="Cadastrar",
        command=cadastrar,
        bg=COR_BOTAO,
        fg="white",
        width=30,
        height=1
).pack(pady=15)
    
#DELETAR
#BLOCO PARA ALINHAR O DELETE
    frame_delete = tk.Frame(coluna1, bg=COR_FUNDO)
    frame_delete.pack(fill="x", pady=8)
   
    
    tk.Label(frame_delete, text="--- Deletar Cliente ---", bg=COR_FUNDO, fg=COR_PRIMARIA, font=("Segoe UI", 10, "bold")).pack(anchor="w")
    
    tk.Label(frame_delete, text="ID:", bg=COR_FUNDO).pack(anchor="w")
    entrada_id = tk.Entry(frame_delete)
    entrada_id.pack(pady=5)
    
#BOTAO DE DELETAR CLIENTES
    tk.Button(
        frame_delete,
        text="Excluir",
        command=deletar,
        bg=COR_BOTAO_DELETE,
        fg="white",
        width=30,
        height=1
).pack(pady=15)
    
#BLOCO ATUALIZAR
#FRAME PARA ALINHAR O ATUALIZAR
    frame_update = tk.Frame(coluna2, bg=COR_FUNDO)
    frame_update.pack(fill="x", pady=5)
    
    tk.Label(frame_update, text="--- Atualizar Cliente ---", bg=COR_FUNDO, fg=COR_PRIMARIA, font=("Segoe UI", 10, "bold")).pack(anchor="w")

    tk.Label(frame_update, text="ID:", bg=COR_FUNDO).pack(anchor="w")
    entrada_id_update = tk.Entry(frame_update)
    entrada_id_update.pack(pady=5)
    
    #Chamando a função
    entrada_id_update.bind("<FocusOut>", carregar_cliente_auto)

    tk.Label(frame_update, text="Nome:", bg=COR_FUNDO).pack(anchor="w")
    entrada_nome_update = tk.Entry(frame_update)
    entrada_nome_update.pack(pady=5)

    tk.Label(frame_update, text="Telefone:", bg=COR_FUNDO).pack(anchor="w")
    entrada_tel_update = tk.Entry(frame_update)
    entrada_tel_update.pack(pady=5)

    tk.Label(frame_update, text="Pedido:", bg=COR_FUNDO).pack(anchor="w")
    entrada_pedido_update = tk.Entry(frame_update)
    entrada_pedido_update.pack(pady=5)

#BOTÃO DE ATUALIZAR CLIENTES
    tk.Button(
        frame_update,
        text="Atualizar",
        command=atualizar,
        bg=COR_BOTAO_ATUALIZAR,
        fg="white",
        width=30,
        height=1
).pack(pady=15)

#Mensagens de confirmação de ações
    mensagem = tk.Label(
        frame_msg,
        text="",
        bg=COR_FUNDO,
        fg="green",
        font=("Segoe UI", 10, "bold"),
        anchor="w"
    )

    mensagem.pack(side="left", padx=10)
    
#LISTA
    tk.Label(frame_direita, text="Clientes", font=("Arial", 14, "bold")).pack()

    
#Botão para listar clientes e Botão para filtrar por data
    tk.Button(
    frame_direita,
    text="Listar Clientes",
    command=listar_clientes,
    bg=COR_PRIMARIA,
    fg="white",
    width=22,
    height=2
).pack(pady=10)

#Scrool para melhor visualização 
    scroll = tk.Scrollbar(frame_direita)
    scroll.pack(side=tk.RIGHT, fill=tk.Y)

    resultado = tk.Text(
        frame_direita, 
        yscrollcommand=scroll.set,
        font=("Consolas", 10),
        bd=0
    )
    resultado.pack(fill="both", expand=True, padx=5, pady=3)
    
    scroll.config(command=resultado.yview)
    
    janela.mainloop()
    
iniciar_sistema()