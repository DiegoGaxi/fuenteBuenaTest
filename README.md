# README

Ruby Version = 2.6.6.1 ( https://objects.githubusercontent.com/github-production-release-asset-2e65be/78153411/7be2c180-75da-11ea-821c-47e1392f71d6?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220510%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220510T020231Z&X-Amz-Expires=300&X-Amz-Signature=9e552f27744be97abaca2a5f28ef7efa657a1e14d1a83a9be56d7b5a71ca5509&X-Amz-SignedHeaders=host&actor_id=33499073&key_id=0&repo_id=78153411&response-content-disposition=attachment%3B%20filename%3Drubyinstaller-devkit-2.6.6-1-x64.exe&response-content-type=application%2Foctet-stream )

bundler Version = 2.2.23
Node Version = 14.10.0
npm version = 6.14.8

1 - Descargar postgreSQL 14 (https://www.postgresql.org/download/)

2- MongoDB (https://www.mongodb.com/try/download/community?tck=docs_server),

3 - MongoDBCompass (Durante la instalacion de MongoDB viene la opcion para instalarlo), 

4 - Mongosh (https://www.mongodb.com/try/download/shell?jmp=docs)

Si hay error mirar (https://kb.objectrocket.com/mongo-db/how-to-install-and-setup-mongodb-on-windows-241#:~:text=To%20simplify%20the%20MongoDB%20setup,ll%20refer%20to%20them%20later.)

5 - git clone https://github.com/DiegoGaxi/fuenteBuenaTest.git

6 - bundle install (correr bash en Administrador)

7 - npm install (correr bash en Administrador)

8 - Editar 'pg_hba' en carpeta postgreSQL, al final escribir: host    all             all             0.0.0.0/0            trust (hacerlo solo si postgre bloquea la ip)

9 - rails db:create

10 - rails db:migrate

11 - rails db:seed

12 - rails s

![Prestamos](https://user-images.githubusercontent.com/33499073/167515981-5bf1ff53-fbee-4580-9c1c-c59a49abf039.PNG)

![Amortizacion](https://user-images.githubusercontent.com/33499073/167515982-b87f978f-e78a-4a1d-87f0-c3a6d0c67ad3.PNG)

![PrestamoGuardado](https://user-images.githubusercontent.com/33499073/167515983-f03f4dfa-5f8d-4a96-8662-e25a39f63924.PNG)


