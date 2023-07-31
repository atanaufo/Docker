
Implantando o GLPI em 2 minutos com o Docker:

Referências:
https://www.aprendendolinux.com/implantando-o-glpi-em-2-minutos-com-o-docker/
https://hub.docker.com/r/diouxx/glpi


1 - Preparando o ambiente para usar a imagem no windows:

Criar diretórios para receber as imagens.
    	d:\docker-images\mariadb
        d:\docker-images\glpi

2 - Subindo o container do banco de dados para o GLPI funcionar.
Executar comandos abaixo via terminal:


>> Implantar GLPI com banco de dados de persistência:

Para uso em ambiente de produção ou uso diário, é recomendado o uso de container com volumes para dados persistentes.
No ambiente windows, executar a aplicação Docker Desktop.

1 - Crie o contêiner MariaDB com volume:

docker run --name mariadb -e MARIADB_ROOT_PASSWORD=diouxx -e MARIADB_DATABASE=glpidb -e MARIADB_USER=glpi_user -e MARIADB_PASSWORD=glpi --volume /var/lib/mysql:/var/lib/mysql -d mariadb:10.7

2 - Crie o contêiner GLPI com volume e vincule o contêiner MariaDB:

docker run --name glpi --link mariadb:mariadb --volume /var/www/html/glpi:/var/www/html/glpi -p 80:80 -d diouxx/glpi

3 - Executar no navegador o endereço localhost ou o ip do servidor definido.

4 - Seguir com as configurações que serão solicitadas e a última etapa que irá subir as configurações do banco de dados
possa demorar um pouco.

glpi/glpi - para a conta do usuário administrador
tech/tech - para a conta do usuário técnico
normal/normal - para a conta do usuário normal
post-only/postonly - para a conta do usuário postonly

5 - Salvar a imagem localmente:

>> GLPI:
docker commit 326f4c4b40e0 glpi-metropax
docker save da26ec75a56d > D:\docker-images\glpi\glpi-metropax.tar
obs: Analisar pois está salvando praticamente dobro do tamanho.

>> MARIADB:
docker commit 90b2cac0a719 glpi-mariadb
docker save 1127c8a5ec40 > D:\docker-images\mariadb\glpi-mariadb.tar
obs: Analisar pois está salvando praticamente dobro do tamanho.

6 - Executar repositório:
obs: Não estou conseguindo executar pela imagens que foram salvas. Averiguar.

