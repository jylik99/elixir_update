#!/bin/bash

cd elixir

docker ps -a | grep elixirprotocol | awk '{print $1}' | xargs docker stop

docker ps -a | grep elixirprotocol | awk '{print $1}' | xargs docker rm

docker pull elixirprotocol/validator:v3 --platform linux/amd64

docker run --name elixir --env-file validator.env --platform linux/amd64 -p 17690:17690 --restart unless-stopped elixirprotocol/validator:v3