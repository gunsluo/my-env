
```
pg_dumpall -h 127.0.0.1 -Upostgres > all.sql
pg_dumpall -h 127.0.0.1 -Upostgres -Wpassword> all.sql

psql -h 127.0.0.1 -Upostgres -f all.sql
```

```
kubectl cp ./all.sql infra/postgres-0:/all.sql 

kubectl cp infra/postgres-0:/all.sql ./all.sql

<!-- modify password -->
kubectl exec -it postgres-0 -c postgres -- psql -U postgres -d postgres -c "ALTER USER postgres WITH PASSWORD 'password';"

```
