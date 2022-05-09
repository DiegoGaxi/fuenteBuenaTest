# README

1 - Descargar postgreSQL,MongoDB, MongoDBCompass, Mongosh
2 - git clone https://github.com/DiegoGaxi/fuenteBuenaTest.git
3 - bundle install
4 - npm install
5 - Editar 'pg_hba' en carpeta postgreSQL, al final escribir: host    all             all             0.0.0.0/0            trust
6 - rails g mongoid:config
7 - rails db:setup
8 - rails db:migrate
9 - rails s
