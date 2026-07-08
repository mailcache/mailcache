Configuring MailCache
===================

You can configure MailCache using command line options or environment variables:

| Environment         | Command line    | Default         | Description
| ------------------- | --------------- | --------------- | -----------
| MC_CORS_ORIGIN      | -cors-origin    |                 | If set, an Access-Control-Allow-Origin header is returned for API endpoints
| MC_HOSTNAME         | -hostname       | mailcache.example | Hostname to use for EHLO/HELO and message IDs
| MC_API_BIND_ADDR    | -api-bind-addr  | 0.0.0.0:8025    | Interface and port for HTTP API server to bind to
| MC_UI_BIND_ADDR     | -ui-bind-addr   | 0.0.0.0:8025    | Interface and port for HTTP UI server to bind to
| MC_MAILDIR_PATH     | -maildir-path   |                 | Maildir path (for maildir storage backend)
| MC_MONGO_COLLECTION | -mongo-coll     | messages        | MongoDB collection name for message storage
| MC_MONGO_DB         | -mongo-db       | mailcache         | MongoDB database name for message storage
| MC_MONGO_URI        | -mongo-uri      | 127.0.0.1:27017 | MongoDB host and port
| MC_SMTP_BIND_ADDR   | -smtp-bind-addr | 0.0.0.0:1025    | Interface and port for SMTP server to bind to
| MC_STORAGE          | -storage        | memory          | Set message storage: memory / mongodb / maildir
| MC_OUTGOING_SMTP    | -outgoing-smtp  |                 | JSON file defining outgoing SMTP servers
| MC_UI_WEB_PATH      | -ui-web-path    |                 | WebPath under which the UI is served (without leading or trailing slashes), e.g. 'mailcache'
| MC_AUTH_FILE        | -auth-file      |                 | A username:bcryptpw mapping file

#### Note on HTTP bind addresses

If `api-bind-addr` and `ui-bind-addr` are identical, a single listener will
be used allowing both to co-exist on one port.

The values must match in a string comparison. Resolving to the same host and
port combination isn't enough.

### Outgoing SMTP configuration

Outgoing SMTP servers can be set in web UI when releasing a message, and can
be temporarily persisted for later use in the same session.

To make outgoing SMTP servers permanently available, create a JSON file with
the following structure, and set `MC_OUTGOING_SMTP` or `-outgoing-smtp`.

```json
{
    "server name": {
        "name": "server name",
        "host": "...",
        "port": "587",
        "email": "...",
        "username": "...",
        "password": "...",
        "mechanism": "PLAIN"
    }
}
```

Only `name`, `host` and `port` are required.

`mechanism` can be `PLAIN` or `CRAM-MD5`.

### Firewalls and proxies

If you have MailCache behind a firewall, you'll need ports `8025` and `1025` by default.

You can override this using `-api-bind-addr`, `-ui-bind-addr` and `-smtp-bind-addr` configuration options.

If you're using MailCache behind a reverse proxy, e.g. nginx, make sure WebSocket connections
are also supported and configured - see [this issue](https://github.com/sureshinde/mailcache/issues/117) for information.
