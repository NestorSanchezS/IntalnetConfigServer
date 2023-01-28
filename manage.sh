#!/bin/sh

action=$1


hash() {
    echo $(tr -dc A-Za-z0-9 </dev/urandom | head -c $1 ; echo '')
}


if [ $action = "start" ]; then
    [ ! -f acme.json ] && touch acme.json && chmod 600 acme.json && echo "\ncreate acme.json for tls certificates"
    [ ! -f traefik.log ] && touch traefik.log && echo "\ncreate traefik.log for error logs"

    docker compose up -d database
    sleep 4

    docker compose up -d

elif [ $action = "reload-api" ]; then

    docker compose pull api

    docker compose --force-recreate -d api

    docker image prune -f

elif [ $action = "reload-front" ]; then

    docker compose pull frontend

    docker compose --force-recreate -d frontend

    docker image prune -f

elif [ $action = "generate-env" ]; then

    cp .env.example .env
    cp .api.env.example .api.env

    dbpass=$(hash 20)
    api_root_pass=$(hash 20)
    api_secret=$(hash 30)

    sed -i "s~__DB_PASS__~$dbpass~g" .env
    sed -i "s~__API_ROOT_PASSWORD__~$api_root_pass~g" .api.env
    sed -i "s~__API_SECRET__~$api_secret~g" .api.env

fi