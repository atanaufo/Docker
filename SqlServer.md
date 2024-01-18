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

# Etapa 1 - Baixando a imagem:
docker pull mcr.microsoft.com/mssql/server:2022-latest

# Etapa 2 - Executando a imagem - Microsoft SQL Server - Ubuntu based images
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Laboratorio@2024" -e "MSSQL_PID=Developer" -p 1433:1433  --name laboratorio --hostname laboratorio -d mcr.microsoft.com/mssql/server:2022-latest

# Ao tentar conectar no cliente sql e ocorrer erro de certificado, executar os comandos a seguir no terminal:
dotnet dev-certs https --clean
dotnet dev-certs https --trust

# Etapa 3 - Restaurar backup de uma base de dados existente no Docker:
# Copiar os arquivos de BKP de uma origem no computador para dentro do Container:
docker cp D:\VM\Instaladores\Bases\AdventureWorks2012.bak e3630575e84b:/var/opt/mssql/data
docker cp D:\VM\Instaladores\Bases\AdventureWorks2019.bak e3630575e84b:/var/opt/mssql/data

# Copiar arquivo dentro do Container para gerar cópia de backup para um diretório no computador:
docker cp e3630575e84b:/var/opt/mssql/data/AdventureWorks2012.bak D:\VM\BKP\FULL
docker cp e3630575e84b:/var/opt/mssql/data/AdventureWorks2019.bak D:\VM\BKP\FULL


# Etapa Final - Stop e Start:
docker stop e3630575e84b
docker start e3630575e84b



# ##################################################
# Principais comando a ser executado no terminal:
# ##################################################

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



# Rodar um restore de banco de dados:
# https://www.youtube.com/watch?v=XHKLi1sA4TY

# Dicas:
# https://balta.io/blog/sql-server-docker
# https://www.youtube.com/watch?v=XHKLi1sA4TY&t=75s


# Rodar a image customizada pelo sqlserver \ Dockerfile:
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=W@Server2023' -p 1415:1433 --name sql-linuxcon15 -d -h linuxsql15 sql2017centos:1.0


