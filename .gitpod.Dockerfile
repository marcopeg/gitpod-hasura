FROM hasura/graphql-engine:v1.1.0 as hasura
FROM gitpod/workspace-full:latest

###
# Install PostgreSQL
RUN sudo apt-get update \
 && sudo apt-get install -y postgresql postgresql-contrib \
 && sudo apt-get clean \
 && sudo rm -rf /var/cache/apt/* /var/lib/apt/lists/* /tmp/*

# Setup PostgreSQL server for user gitpod
ENV PATH="$PATH:/usr/lib/postgresql/11/bin"
ENV PGDATA="/workspace/.pg_ctl/data"
RUN mkdir -p ~/.pg_ctl/bin ~/.pg_ctl/data ~/.pg_ctl/sockets \
 && initdb -D ~/.pg_ctl/data/ \
 && printf "#!/bin/bash\n[[ ! -d /workspace/.pg_ctl ]] && cp -R ~/.pg_ctl /workspace\npg_ctl -D /workspace/.pg_ctl/data/ -l /workspace/.pg_ctl/log -o \"-k /workspace/.pg_ctl/sockets\" start\n" > ~/.pg_ctl/bin/pg_start \
 && printf "#!/bin/bash\npg_ctl -D /workspace/.pg_ctl/data/ -l /workspace/.pg_ctl/log -o \"-k /workspace/.pg_ctl/sockets\" stop\n" > ~/.pg_ctl/bin/pg_stop \
 && chmod +x ~/.pg_ctl/bin/*
ENV PATH="$PATH:$HOME/.pg_ctl/bin"
ENV DATABASE_URL="postgresql://gitpod@localhost"
ENV PGHOSTADDR="127.0.0.1"
ENV PGDATABASE="postgres"

# This is a bit of a hack. At the moment we have no means of starting background
# tasks from a Dockerfile. This workaround checks, on each bashrc eval, if the
# PostgreSQL server is running, and if not starts it.
RUN printf "\n# Auto-start PostgreSQL server.\n[[ \$(pg_ctl status | grep PID) ]] || pg_start > /dev/null\n" >> ~/.bashrc



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

CMD ["/bin/graphql-engine", "serve"]
