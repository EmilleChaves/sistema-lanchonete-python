
import psycopg2

def conectar():
    return psycopg2.connect(
        host="localhost",
        database="exercicio01",
        user="postgres",
        password="Sjc251128"
    )
    #Cadastrar clientes
    
def cadastrar_cliente(nome, telefone, pedido):
    conexao = conectar()
    cursor = conexao.cursor()
    
    cursor.execute(
         "call public.gerenciar_cliente(%s, %s, %s, %s, %s)",
        ("INSERT", 0, nome, telefone, pedido)
    )
       
    conexao.commit()
    cursor.close()
    conexao.close()
    
    print("Cliente cadastrado!")
    
    #Listar clientes 
    
def listar_clientes():
    conexao = conectar()
    cursor = conexao.cursor()
    
    
    cursor.execute("Select * from clientes")
    clientes = cursor.fetchall()
    
    print("\nClientes cadastrados:")
    
    for c in clientes:
        print(c)
    
    cursor.close()
    conexao.close()
    
    #Deletar dados
    
def deletar_cliente(id_cliente):
    conexao = conectar()
    cursor = conexao.cursor()
    
    cursor.execute(
        "call public.gerenciar_cliente(%s, %s, %s, %s, %s)",
        ("DELETE", id_cliente, None, None, None)
    )
    
    conexao.commit()
    cursor.close()
    conexao.close()
    
    print("Cliente deletado!")
    
    
    #Atualizando dados do cliente
    
def atualizar_cliente(id_cliente, nome, telefone, pedido):
    conexao = conectar()
    cursor = conexao.cursor()
    
    cursor.execute(
        "call public.gerenciar_cliente(%s, %s, %s, %s, %s)",
        ("UPDATE", id_cliente, nome, telefone, pedido)
    )
    
    conexao.commit()
    cursor.close()
    conexao.close()
    
    
    print("Cliente atualizado!")
    
    #MENU
    
while True:
     print("\n1 - Cadastrar cliente")
     print("2 - Listar clientes")
     print("3 - Sair")
     print("4 - Deletar cliente")
     print("5 - Atualizar dados do cliente")
    
     opcao = input("Escolha:")
    
     if opcao == "1":
        nome = input("Nome: ")
        telefone = input("Telefone: ")
        pedido = input("Pedido: ")
            
        cadastrar_cliente(nome, telefone, pedido)
        
     elif opcao == "2":
        listar_clientes()
        
     elif opcao == "4":
        listar_clientes()
        
        id_cliente = int(input("Digite o ID do cliente que deseja  deletar: "))
        
        deletar_cliente(id_cliente)
        
        
     elif opcao == "5":
         listar_clientes()
         
         id_cliente = int(input("Digite o ID do cliente que deseja atualizar: "))
         
         nome = input("Novo nome: ")
         telefone = input("Novo telefone: ")
         pedido = input("Novo pedido: ")
         
         atualizar_cliente(id_cliente, nome, telefone, pedido)
    
     elif opcao == "3":
        break
 
     else:
        print("Opção inválida!")

    