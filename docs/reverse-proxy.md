# Reverse Proxy

In these examples Traggo is running on port `3030` on `localhost`.

## nginx

### At domain root like `http://domain.tld`

Proxy `http://domain.tld` to Traggo.

```nginx
upstream traggo {
  # Set the port to the one you are using in traggo
  server localhost:3030;
}

server {
  listen 80;

# If you're on localhost:
# server_name localhost;
  server_name localhost;

  location / {
    proxy_pass         http://traggo;
  }
}
```

### At domain sub path like `http://domain.tld/traggo/`

Proxy `http://domain.tld/traggo` to Traggo.

```nginx
upstream traggo {
  # Set the port to the one you are using in traggo
  server localhost:3030;
}

server {
  listen 80;

# If you're on localhost:
# server_name localhost;
  server_name domain.tld;

  location /traggo/ {
    proxy_pass         http://traggo;
    rewrite ^/traggo(/.*) $1 break;
  }
}
```

## Apache

### At domain root like `http://domain.tld`

Proxy `http://domain.tld` to Traggo.

```apache
<VirtualHost *:80>
# If you're on localhost:
#   ServerName localhost
    ServerName domain.tld

    Keepalive On

    ProxyPass "/" http://localhost:3030/ retry=0 timeout=5
    ProxyPassReverse / http://localhost:3030/
</VirtualHost>
```

### At domain sub path like `http://domain.tld/traggo/`

Proxy `http://domain.tld/traggo` to Traggo.

```apache
<VirtualHost *:80>
# If you're on localhost:
#   ServerName localhost
    ServerName domain.tld

    Keepalive On

    ProxyPass "/traggo/" http://localhost:3030/ retry=0 timeout=5
    #                 ^- !!trailing slash is required!!
    ProxyPassReverse "/traggo/" http://localhost:3030/
</VirtualHost>
```
