FROM hasura/graphql-engine:v1.1.0 as hasura
FROM gitpod/workspace-postgres
COPY --from=hasura / /
