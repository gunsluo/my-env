
```
pg_dumpall -h 127.0.0.1 -Upostgres > all.sql
pg_dumpall -h 127.0.0.1 -Upostgres -Wpassword> all.sql

psql -h 127.0.0.1 -Upostgres -f all.sql
```

```
kubectl cp infra/postgres-0:/all.sql ./all.sql


kubectl cp ./all.sql infra/postgres-0:/all.sql 
```
