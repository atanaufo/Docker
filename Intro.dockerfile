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

# Lista todos os containers ativos no pc:
docker ps

# Lista todos os containers ativos e inativos:
docker ps -a 


# Como parar um container em execução: Pegar o CONTAINER ID para ser definido.
docker stop <CONTAINER ID>

# Iniciar um container existente. Necessitará do <CONTAINER ID> para iniciar:
docker start <CONTAINER ID>


# Definir e expor uma porta para conseguir acessar através do navegador: 
# PORTA EXPOSTA : PORTA UTILIZADA
docker run -d -p 80:80 nginx 


# Analisar para criação de image:
# https://woliveiras.com.br/posts/Criando-uma-imagem-Docker-personalizada/
# https://blog.matheuscastiglioni.com.br/criando-minha-primeira-imagem-com-docker/

# Para criar uma imagem personalizada:
# Criar um arquivo chamado Dockerfile.
# No terminal, executar o comando:
docker build -t <nome author>/<AMBIENTE> .

# Exportar a image alterada / criada:


# Importar a imagem alterada / criada:

