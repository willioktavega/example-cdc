#!/bin/bash

docker exec -ti postgres bash -c "psql -U postgres -d postgres -h localhost -p 5432 -a -f /deps/world.sql"
docker exec -ti postgres bash -c "apt-get update && apt-get install postgresql-9.6-wal2json"
docker exec -ti postgres bash -c "cp /deps/pg_hba.conf /var/lib/postgresql/data/pg_hba.conf && cp /deps/postgresql.conf /var/lib/postgresql/data/postgresql.conf"

# export EDITOR=vim
# crontab <<EOF
# SHELL=/bin/bash
# * * * * * echo foo
# EOF