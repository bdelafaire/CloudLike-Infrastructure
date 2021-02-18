# Nginx
Nginx est utilisé en tant que load balancer pour les applications front ainsi que les API.

```
upstream backends {
  server VM1_BACK_HOST:VM1_BACK_PORT;
  server VM2_BACK_HOST:VM2_BACK_PORT;
}

upstream frontends {
  server VM1_FRONT_HOST:VM1_FRONT_PORT;
  server VM2_FRONT_HOST:VM2_FRONT_PORT;
}
```

Ces variables (ex: "VM1_BACK_HOST") sont remplacées par un scrript utilisé par Vagrant

```
location / {
  proxy_set_header   X-Real-IP $remote_addr;
  proxy_set_header   Host      $http_host;
  proxy_pass         http://frontends;
}

location /api/ {
  proxy_set_header   X-Real-IP $remote_addr;
  proxy_set_header   Host      $http_host;
  proxy_pass         http://backends;
}
```

Toutes les requêtes (sauf celles commencant par /api) sont redirigés vers une des deux application front. Sinon ces dernières sont redirigés vers une des application back.
