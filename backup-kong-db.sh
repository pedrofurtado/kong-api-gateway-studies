#!/bin/bash
docker exec -i kong-api-gateway-studies_kong_database_pg_1 pg_dump -U kongdbuser --if-exists --clean --column-inserts kongdb > backup-kong-db.sql
