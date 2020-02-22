FROM hasura/graphql-engine:v1.1.0 as hasura

# This custom image provides a Postgres database that persists the data
# when restarting a workspace
FROM marcopeg/gitpod-postgres

###
# Install Hasura Engine
COPY --from=hasura /bin/graphql-engine /bin/graphql-engine

# Creates the `hasura_start` command:
RUN mkdir -p ~/.hasura/bin \
  && printf "#!/bin/bash\n/bin/graphql-engine serve" > ~/.hasura/bin/hasura_start \
  && chmod +x ~/.hasura/bin/*

# Ensure the basic environment variables that are needed by Hasura to start
ENV PATH="$PATH:$HOME/.hasura/bin"
ENV HASURA_GRAPHQL_DATABASE_URL="postgres://localhost:5432/postgres"
ENV HASURA_GRAPHQL_ENABLE_CONSOLE="true"

