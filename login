# projeto_interface
import tkinter as tk
from tkinter import messagebox
from PIL import Image, ImageTk

#dicionário para login

usuarios = {
    "chuudoloona": "senha1",
    "haerindonewjeans": "senha2"
}

def fazer_login(): #login por usuário e senha
    usuario = entry_usuario.get()
    senha = entry_senha.get()
    if usuario in usuarios and usuarios[usuario] == senha:
        print("Usuário autenticado:", usuario)
        abrir_proxima_tela() # - próxima tela a definir
    else:
        messagebox.showerror("Erro de Login", "Usuário ou senha incorretos") # teste de verificação


def abrir_proxima_tela(): # prox tela
    janela.withdraw()
    próxima_tela = tk.Toplevel(janela)
    próxima_tela.title("Segunda Tela")

    label = tk.Label(próxima_tela, text="Bem-vindo ao fretinho!", font=("Arial", 30))
    label.pack(expand=True, fill='both')
    label.pack()


# configuração da janela principal (utilizando tkinter, como a professora indicou)
janela = tk.Tk()
janela.title("Tela de Login")
janela.geometry("600x400")  # tamanho da janela minimizada, ao iniciar.

# imagem local no meu pc para ser o background - mudar para imagem web
caminho_para_imagem = "C:/Users/bryan/Downloads/fretinhoproject.jpeg"
imagem_fundo = Image.open(caminho_para_imagem)
imagem_fundo = ImageTk.PhotoImage(imagem_fundo)

# rótulo para a imagem de fundo
fundo_label = tk.Label(janela, image=imagem_fundo)
fundo_label.place(x=0, y=0, relwidth=1, relheight=1)  # preenche toda a janela

# frame para o container de login
container_login = tk.Frame(janela, bg="white", width=300, height=200)  # Aumente o tamanho do contêiner
container_login.place(relx=0.5, rely=0.5, anchor="center")

# rótulo e entrada para o nome de usuário
label_usuario = tk.Label(container_login, text="Usuário:", font=("Arial", 16))  # tamanho da fonte usuário
label_usuario.pack(pady=10)

entry_usuario = tk.Entry(container_login, font=("Arial", 16))  # tamanho da fonte
entry_usuario.pack(pady=10)

# rótulo e entrada para a senha
label_senha = tk.Label(container_login, text="Senha:", font=("Arial", 16))  # Aumente o tamanho da fonte
label_senha.pack(pady=10)

entry_senha = tk.Entry(container_login, show="*", font=("Arial", 16))  # Aumente o tamanho da fonte
entry_senha.pack(pady=10)

# botão de login
botao_login = tk.Button(container_login, text="Login", command=fazer_login, font=("Arial", 16))  # Aumente o tamanho da fonte
botao_login.pack(pady=10)

#botao de novo usuário - INCOMPLETO, n vai rodar
botao_novo_usuario = tk.Button(container_login, text="Novo Usuário", command=abrir_tela_novo_usuario, font=("Arial", 16))
botao_novo_usuario.pack(pady=10)

def abrir_tela_novo_usuario():
    janela_novo_usuario = tk.Toplevel(janela)
    janela_novo_usuario.title("Cadastro de Novo Usuário")

    label_novo_usuario = tk.Label(janela_novo_usuario, text="Novo Usuário:", font=("Arial", 16))
    label_novo_usuario.pack(pady=10)

    entry_novo_usuario = tk.Entry(janela_novo_usuario, font=("Arial", 16))
    entry_novo_usuario.pack(pady=10)

    label_nova_senha = tk.Label(janela_novo_usuario, text="Nova Senha:", font=("Arial", 16))
    label_nova_senha.pack(pady=10)

    entry_nova_senha = tk.Entry(janela_novo_usuario, show="*", font=("Arial", 16))
    entry_nova_senha.pack(pady=10)

    botao_criar_usuario = tk.Button(janela_novo_usuario, text="Criar Usuário", command=criar_novo_usuario, font=("Arial", 16))
    botao_criar_usuario.pack(pady=10)

def criar_novo_usuario():
novo_usuario = entry_novo_usuario.get()
nova_senha = entry_nova_senha.get()
if novo_usuario and nova_senha:
    if novo_usuario not in usuarios:
        usuarios[novo_usuario] = nova_senha
        messagebox.showinfo("Sucesso", "Novo usuário cadastrado com sucesso.")
    else:
        messagebox.showerror("Erro", "Usuário já existe.")
else:
    messagebox.showerror("Erro", "Preencha todos os campos.")


janela.mainloop()
