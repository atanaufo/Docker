#
# Instalando Docker:
#   1º - Instalar o aplicativo Docker Desktop através: https://www.docker.com/
#   2º - Rodar no terminal do windows para instalar o Kernel Linux: wsl --install -d Ubuntu
#   3º - Identificar e baixar a imagem do SQL Server 2022: https://hub.docker.com/_/microsoft-mssql-server
#   4º - Executar o comando conforme indicado no site acima: docker pull mcr.microsoft.com/mssql/server
#		OBS: Sendo primeira vez, poderá demorar devido baixar os pacotes.
#

# Utilizando o Visual Code:
#   1º - Instalar Extensão no Visual Code.
#

# Principais comando a ser executado no terminal:

# Para identificar qual versão instalada:
docker version

# Lista todos os containers ativos no pc:
docker ps

# Listar todos os containers - ativos e inativos:
docker ps -a

# Como parar um container em execução: Pegar o CONTAINER ID para ser definido.
docker stop <CONTAINER ID>

# Iniciar um container existente. Necessitará do <CONTAINER ID> para iniciar:
docker start <CONTAINER ID>

# Remover Container:
docker rm <CONTAINER ID>

# Listar todas as images existentes:
docker images -a

# Remover Imagem:
docker rmi <IMAGE ID>


# Para rodar um container / imagem: Normalmente quando é executado pela 1º vez deverá realizar download da imagem:
docker run -it ubuntu

# Rodar uptade no container no caso do ambiente linux:
apt-get update

# Rodar instalação de alguma aplicação:
apt-get install vim

# Rodar container com Node (Para Javascript):
docker run -it node

# Rodar container em background:
docker run -d nginx



# Definir e expor uma porta para conseguir acessar através do navegador: 
# PORTA EXPOSTA : PORTA UTILIZADA
docker run -d -p 80:80 nginx 


# Analisar para criação de image:

# https://woliveiras.com.br/posts/Criando-uma-imagem-Docker-personalizada/
# https://blog.matheuscastiglioni.com.br/criando-minha-primeira-imagem-com-docker/
# https://www.ic.unicamp.br/~william/howto/docker.html

# Parecer ser o melhor conteúdo:
# https://stack.desenvolvedor.expert/appendix/docker/criandoimagem.html
# https://blog.rocketseat.com.br/dockerfile-principais-comandos-para-criar-a-receita-da-imagem/


# Criação de uma imagem personalizada:
# Criar um arquivo chamado Dockerfile. Somente um arquivo para cada diretório.
# Acessar o diretório via terminal, executar o comando:
docker build .

# Porém o comando acima irá apenas criar um build mas sem o nome e a tag.

# Para isso devemos acrescentar o nome do repositório e a sua tag:
docker build -t atanaufo/apache:1.0 .

# Rodando o meu container criado:
docker run -it atanaufo/apache:1.0



# Migrando Container Docker para outra Máquina:

## Na máquina fonte:

docker commit <nome-ou-id-container> <nome-nova-imagem>

docker commit 817acb823a66 mcr.microsoft.com/mssql/server:SqlServerTeste

docker save 6c736ce5ac31 > c:\img\SqlServerTesteNova.tar


## Na máquina destino:

docker load --input c:\img\SqlServerTesteNova.tar
docker run <argumentos-para-container>

docker run --name SqlServerTeste





# Rodar um restore de banco de dados:
# https://www.youtube.com/watch?v=XHKLi1sA4TY

# Dicas:
# https://balta.io/blog/sql-server-docker

# https://www.mssqltips.com/sqlservertip/5945/create-sql-server-on-linux-docker-container-using-dockerfile-part-5/

