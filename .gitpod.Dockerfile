FROM hasura/graphql-engine:v1.1.0 as hasura
FROM gitpod/workspace-postgres

# copy hausra binary from base container
COPY --from=hasura /bin/graphql-engine /bin/graphql-engine

#COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
#CMD ["/entrypoint.sh"]
