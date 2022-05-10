# README

Ruby Version = 2.6.6
Node Version = 14.10.0
npm version = 6.14.8

1 - Descargar postgreSQL (https://www.postgresql.org/download/)

MongoDB (https://www.mongodb.com/try/download/community?tck=docs_server),

MongoDBCompass (Durante la instalacion de MongoDB viene la opcion para instalarlo), 

Mongosh (https://www.mongodb.com/try/download/shell?jmp=docs)

Si hay error mirar (https://kb.objectrocket.com/mongo-db/how-to-install-and-setup-mongodb-on-windows-241#:~:text=To%20simplify%20the%20MongoDB%20setup,ll%20refer%20to%20them%20later.)

2 - git clone https://github.com/DiegoGaxi/fuenteBuenaTest.git

3 - Eliminar Gemfile.lock

4 - bundle install (correr bash en Administrador)

5 - npm install (correr bash en Administrador)

6 - Editar 'pg_hba' en carpeta postgreSQL, al final escribir: host    all             all             0.0.0.0/0            trust

7 - rails db:setup (para crear tablas y correr el .seed)

8 - rails s

![Prestamos](https://user-images.githubusercontent.com/33499073/167515981-5bf1ff53-fbee-4580-9c1c-c59a49abf039.PNG)

![Amortizacion](https://user-images.githubusercontent.com/33499073/167515982-b87f978f-e78a-4a1d-87f0-c3a6d0c67ad3.PNG)

![PrestamoGuardado](https://user-images.githubusercontent.com/33499073/167515983-f03f4dfa-5f8d-4a96-8662-e25a39f63924.PNG)


