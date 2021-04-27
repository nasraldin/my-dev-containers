# My-dev-containers

Is a pre-configured container that I used every day. so, I created this docker-compose with pre-configured to use quickly.

# Container management
- portainer http://localhost:9000

# Centralized log
- seq http://localhost:5341

# Databases
- sqlserver
- mysql
- mariadb
- postgres
- couchdb
- couchbase
- redis

# GUI
- phpmyadmin http://localhost:8002
- pgadmin4 http://localhost:8004
- adminer http://localhost:8005
- fauxton for couchdb http://localhost:5984/_utils
- couchbase http://localhost:8091
- redis-commander http://localhost:8003

# Workflow
- Camunda BPM http://localhost:8080/camunda
- camunda workbench http://localhost:8088

# Message queue
- rabbitmq http://localhost:15672

## How to use
Start in the root directory of this project, then

```bash
$ docker-compose up --build -d
```

* Username: `nasr` for pgadmin4 use nasr2ldin@gmail.com
* Password: `nasr`

### Cleanup

each container data is persisted inside a volume by default.

In order to entirely shutdown the stack and remove all persisted data, use the following Docker Compose command:

```console
$ docker-compose down -v
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request.