#!/bin/bash

echo "Criando imagens..."

docker build -t konstructa/backend-php:1.0 backend/.

docker build -t konstructa/database-php:1.0 database/.

echo "Realizando push das imagens..."

docker push konstructa/backend-php:1.0

docker push konstructa/database-php:1.0

echo "Criando serviços no cluster kubernetes..."

kubctl apply -f ./services.yml

echo "Criando os deployments..."

kubctl apply -f ./deployment.yml
