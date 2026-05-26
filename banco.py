import psycopg2


#Conectando ao banco
def conectar():
    return psycopg2.connect(
        host="localhost",
        database="exercicio01",
        user="postgres",
        password="Sjc251128"
    )
    
    
#Função para cadastrar clientes via interface e chamar nossa procedure do banco
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
    
    
#Função para buscar clientes
def buscar_clientes(data_inicio=None, data_fim=None, nome_busca=None):
    conexao = conectar()
    cursor = conexao.cursor()
 
 
    query = """
        SELECT id, nome, telefone, pedido, criado_em
        FROM clientes
        where 1=1
    """
    
    parametros = []
    
    #filtro por data
    if data_inicio and data_fim:
        query += " AND criado_em BETWEEN %s AND %s"
        parametros.extend([data_inicio, data_fim])
    
    #Filtro por nome
    if nome_busca:
        query += " AND nome ILIKE %s"
        parametros.append(f"%{nome_busca}%")
        
    query += " ORDER BY id DESC"

    cursor.execute(query, parametros)
    clientes = cursor.fetchall()
    
    cursor.close()
    conexao.close()

    return clientes 

#Chamndo a função autoencremento
def buscar_cliente_por_id(id_cliente):
    conexao = conectar()
    cursor = conexao.cursor()
    
    cursor.execute("""
        SELECT nome, telefone, pedido
        FROM clientes
        WHERE id = %s
     """, (id_cliente,))
    
    
    cliente = cursor.fetchone()
    
    cursor.close()
    conexao.close()
    
    return cliente
    