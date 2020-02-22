#!/bin/bash
set -e

###
# Reconfigure Postgres
# mkdir -p /workspace/.pg_ctl

# # Copy postgres data from the home folder if not exists
# [[ ! -d /workspace/.pg_ctl/data ]] && cp -R ~/.pg_ctl/data /workspace/.pg_ctl

# if [[ $(pg_ctl status) == *"no server"* ]]; then
#     pg_ctl -D /workspace/.pg_ctl/data/ -l /workspace/.pg_ctl/log -o "-k /home/gitpod/.pg_ctl/sockets" start
# fi

###
# Start Hasura
# export HASURA_GRAPHQL_DATABASE_URL=postgres://localhost:5432/postgres
# export HASURA_GRAPHQL_ENABLE_CONSOLE=true
# export HASURA_GRAPHQL_ADMIN_SECRET=${HASURA_GRAPHQL_ADMIN_SECRET:-qwerty}
# /bin/graphql-engine serve > /dev/null
