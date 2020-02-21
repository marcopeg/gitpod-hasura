#!/bin/bash
set -e

HASURA_GRAPHQL_DATABASE_URL=postgres://localhost:5432/postgres
HASURA_GRAPHQL_ENABLE_CONSOLE=true
HASURA_GRAPHQL_ADMIN_SECRET=${HASURA_GRAPHQL_ADMIN_SECRET-qwerty}

/bin/graphql-engine serve
