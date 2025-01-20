
```
pg_dumpall -h 127.0.0.1 -Upostgres > all.sql
pg_dumpall -h 127.0.0.1 -Upostgres -Wpassword> all.sql

psql -h 127.0.0.1 -Upostgres -f all.sql
```

```
pg_dump -Fc -h 127.0.0.1 -U postgres -d sso > sso.dump

pg_restore -h 127.0.0.1 -p 5432 -U postgres -d sso -v sso.dump
```


```
kubectl cp ./all.sql infra/postgres-0:/all.sql 

kubectl cp infra/postgres-0:/all.sql ./all.sql

<!-- modify password -->
kubectl exec -it postgres-0 -c postgres -- psql -U postgres -d postgres -c "ALTER USER postgres WITH PASSWORD 'password';"

```
