#!/bin/bash
set -e

###
# Reconfigure Postgres
mkdir -p /workspace/.pg_ctl

# if [ -d ~/.pg_ctl/data ]; then
#    mv ~/.pg_ctl/data /workspace/.pg_ctl
# fi

# if [ -d ~/.pg_ctl/data ]; then
#    mv ~/.pg_ctl/data /workspace/.pg_ctl
# fi

# if [[ $(pg_ctl status) == *"no server"* ]]; then
#     echo "not running"
#     pg_ctl -D /workspace/.pg_ctl/data/ -l /workspace/.pg_ctl/log -o "-k /home/gitpod/.pg_ctl/sockets" start
# fi

###
# Start Hasura
# export HASURA_GRAPHQL_DATABASE_URL=postgres://localhost:5432/postgres
# export HASURA_GRAPHQL_ENABLE_CONSOLE=true
# export HASURA_GRAPHQL_ADMIN_SECRET=${HASURA_GRAPHQL_ADMIN_SECRET:-qwerty}
# /bin/graphql-engine serve > /dev/null
