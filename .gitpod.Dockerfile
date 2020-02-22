FROM hasura/graphql-engine:v1.1.0 as hasura
FROM marcopeg/gitpod-postgres

###
# Install Hasura Engine
COPY --from=hasura /bin/graphql-engine /bin/graphql-engine
RUN mkdir -p ~/.hasura/bin \
  && printf "#!/bin/bash\n/bin/graphql-engine serve" > ~/.hasura/bin/hasura_start \
  && chmod +x ~/.hasura/bin/*

ENV PATH="$PATH:$HOME/.hasura/bin"
ENV HASURA_GRAPHQL_DATABASE_URL="postgres://localhost:5432/postgres"
ENV HASURA_GRAPHQL_ENABLE_CONSOLE="true"
#ENV HASURA_GRAPHQL_ADMIN_SECRET="hasura"

RUN printf "\n# Auto-start Hasura server.\n[[ ! \$(lsof -i -P -n | grep 8080) == *\"8080\"* ]] && hasura_start > /dev/null\n" >> ~/.bashrc
