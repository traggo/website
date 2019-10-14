# Configuration

## Precedence

traggo/server tries to obtain config from different locations in sequence. Properties will never be overridden so traggo/server 
will use the value of the first occurrence of a property.

**Order**

* Environment Variables
* `.env.local` (in same path as the binary)
* `.env` (in same path as the binary)
* `$HOME/.config/server.ini`
* `/etc/traggo/server.ini`

## Properties

The following properties can be set via environment variables / config file(s).

!!! note
    This example contains also the default values it is recommended to change the default username/password.

```ini
# the port the http server should use
# TRAGGO_PORT=3030

# default username and password
# TRAGGO_DEFAULT_USER_NAME=admin
# TRAGGO_DEFAULT_USER_PASS=admin

# bcrypt password strength (higher = more secure but also slower)
# TRAGGO_PASS_STRENGTH=10

# how verbose traggo/server should log (must be one of: debug, info, warn, error, fatal, panic)
# TRAGGO_LOG_LEVEL=info

# the database dialect (must be one of: sqlite3)
# TRAGGO_DATABASE_DIALECT=sqlite3

# the database connection string, differs depending on the dialect
# sqlite3:  path/to/database.db
# TRAGGO_DATABASE_CONNECTION=data/traggo.db
```