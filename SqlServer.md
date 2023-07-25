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

# Lista todos os containers ativos e inativos:
docker ps -a 

# Como parar um container em execução: Pegar o CONTAINER ID para ser definido.
docker stop <CONTAINER ID>

# Iniciar um container existente. Necessitará do <CONTAINER ID> para iniciar:
docker start <CONTAINER ID>



# Microsoft SQL Server - Ubuntu based images
# Para baixar container com o Sql Server: https://hub.docker.com/_/microsoft-mssql-server
# https://balta.io/blog/sql-server-docker

docker run --name SqlServerTeste -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=W@Server2023" -p 1433:1433 -d mcr.microsoft.com/mssql/server

# Rodar um restore de banco de dados:
# https://www.youtube.com/watch?v=XHKLi1sA4TY




# Nas novas versões da imagem do SQL Server, no Windows, tem ocorrido um problema de SSL. 
# Para resolver este problema, primeiro execute os seguintes comandos:
    # dotnet dev-certs https --clean
    # dotnet dev-certs https --trust

# Feito isto, os certificados HTTPS do .NET estarão atualizados e funcionais.
# Desta forma, adicione os parâmetros Trusted_Connection e TrustServerCertificate
# na sua Connection String como mostrado abaixo:
    # Server=localhost,1433;Database=balta;User ID=sa;Password=1q2w3e4r@#$;Trusted_Connection=False; TrustServerCertificate=True;

# Para remoção de Container:
docker rm <CONTAINER ID>

# Listar todas as images existentes:
docker images -a

# Com acesso a IMAGE ID, para remover:
docker rmi <IMAGE ID>



# Exportar image criada / alterada - Porém primeiro deverá parar a imagem:
docker commit <IMAGE ID> IMAGE:TAG

docker commit 817acb823a66 mcr.microsoft.com/mssql/server:SqlServerTeste



# Migrando Container Docker para outra Máquina:

## Na máquina fonte:

docker commit <nome-ou-id-container> <nome-nova-imagem>
docker save 6c736ce5ac31 > c:\img\SqlServerTesteNova.tar


## Na máquina destino:

docker load < c:\img\SqlServerTesteNova.tar
docker run <argumentos-para-container>