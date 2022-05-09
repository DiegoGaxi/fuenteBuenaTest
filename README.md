# README

1 - Descargar postgreSQL,MongoDB, MongoDBCompass, Mongosh
2 - git clone https://github.com/DiegoGaxi/fuenteBuenaTest.git
3 - bundle install (si da error correr bash en Administrador)
4 - npm install
5 - Editar 'pg_hba' en carpeta postgreSQL, al final escribir: host    all             all             0.0.0.0/0            trust
6 - rails g mongoid:config
7 - rails db:setup (para crear tablas y correr el .seed)
8 - rails db:migrate
9 - rails s

![Prestamos](https://user-images.githubusercontent.com/33499073/167515981-5bf1ff53-fbee-4580-9c1c-c59a49abf039.PNG)
![Amortizacion](https://user-images.githubusercontent.com/33499073/167515982-b87f978f-e78a-4a1d-87f0-c3a6d0c67ad3.PNG)
![PrestamoGuardado](https://user-images.githubusercontent.com/33499073/167515983-f03f4dfa-5f8d-4a96-8662-e25a39f63924.PNG)
