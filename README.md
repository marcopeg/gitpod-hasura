# hasura-gitpod
Run Hasura in GitPod

### BUILD:
- https://www.gitpod.io/blog/docker-in-gitpod/

### POSTGRES:
- https://medium.com/gitpod/bring-your-own-docker-image-to-gitpod-52db1aa861de
- https://github.com/teirureddo/envinits-gitpod-php/blob/master/.gitpod.dockerfile

### PGADMIN:
- https://github.com/postgres/pgadmin4


FROM hasura/graphql-engine:v1.1.0 as hasura

FROM gitpod/workspace-full
# do customization
COPY --from=hasura / /