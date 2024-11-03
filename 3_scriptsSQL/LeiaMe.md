Passos para execução dos scripts 

1 - Instalar o PostgreSQL (estou usando a versão 16)

    https://www.postgresql.org/download/

2 - Executar o comando PSQL no terminal do seu sistema operacional
   
    psql -U seu_usuario

    (no meu caso psql -U postgres)

    pode ser que o terminal solicite a senha do seu banco de dados
    no projeto utilizei o usuario padrão postgres e a senha 123123

3 - Executar o comando de criação da database

    CREATE DATABASE sistema_consultas_medicas;

4 - Conectar ao banco de dados criado

    \c sistema_consultas_medicas;

5 - Banco de dados criado

    A partir daqui voce pode comtinuar usando o console para executar
    as querys ou utilizar o pgAdmin4 (ferramenta de gerenciamento do PostgreSQL)

    >>> EU <<< recomento fortemente seguir com o pgAdmin4

    Geralment eo pgAdmin vem instalado junto do PostgreSQL, caso não, disponibilizarei o link para download aqui

        https://www.pgadmin.org/download/