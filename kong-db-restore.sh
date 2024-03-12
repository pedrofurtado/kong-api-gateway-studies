#!/bin/bash
cat backup-kong-db.sql | docker exec -i kong-api-gateway-studies_kong_database_pg_1 psql -U kongdbuser -d kongdb
docker container restart kong-api-gateway-studies_kong_database_pg_1
docker container restart kong-api-gateway-studies_kong_1
