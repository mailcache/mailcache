MailCache [ ![Download](https://img.shields.io/github/release/mailcache/mailcache.svg) ](https://github.com/sureshinde/mailcache/releases/tag/v1.0.0) [![GoDoc](https://godoc.org/github.com/sureshinde/mailcache?status.svg)](https://godoc.org/github.com/sureshinde/mailcache) [![Build Status](https://travis-ci.org/sureshinde/mailcache.svg?branch=master)](https://travis-ci.org/sureshinde/mailcache)
=========

Inspired by [MailCatcher](https://mailcatcher.me/), easier to install.

* Download and run MailCache
* Configure your outgoing SMTP server
* View your outgoing email in a web UI
* Release it to a real mail server

Built with Go - MailCache runs without installation on multiple platforms.

### Overview

MailCache is an email testing tool for developers:

* Configure your application to use MailCache for SMTP delivery
* View messages in the web UI, or retrieve them with the JSON API
* Optionally release messages to real SMTP servers for delivery

### Installation

#### Manual installation
[Download the latest release for your platform](/docs/RELEASES.md). Then
[read the deployment guide](/docs/DEPLOY.md) for deployment options.

#### MacOS
```bash
brew update && brew install mailcache
```

Then, start MailCache by running `mailcache` in the command line.

#### Debian / Ubuntu Go < v1.18
```bash
sudo apt-get -y install golang-go
go get github.com/mailcache/mailcache
```

#### Go >= v1.17 (Debian Bookworm) 
```bash
sudo apt-get -y install golang-go
go install github.com/mailcache/mailcache@latest
```

Then, start MailCache by running `/path/to/MailCache` in the command line.

E.g. the path to Go's bin files on Ubuntu is `~/go/bin/`, so to start the MailCache run:

```bash
~/go/bin/MailCache
```

#### FreeBSD
```bash
pkg install mailcache
sysrc mailcache_enable="YES"
service mailcache start
```

#### Docker
[Run it from Docker Hub](https://registry.hub.docker.com/r/mailcache/mailcache/) or using the provided [Dockerfile](Dockerfile)

### Configuration

Check out how to [configure MailCache](/docs/CONFIG.md), or use the default settings:
  * the SMTP server starts on port 1025
  * the HTTP server starts on port 8025
  * in-memory message storage

### Features

See [MailCache libraries](docs/LIBRARIES.md) for a list of MailCache client libraries.

* ESMTP server implementing RFC5321
* Support for SMTP AUTH (RFC4954) and PIPELINING (RFC2920)
* Web interface to view messages (plain text, HTML or source)
  * Supports RFC2047 encoded headers
* Real-time updates using EventSource
* Release messages to real SMTP servers
* Chaos Monkey for failure testing
  * See [Introduction to Jim](/docs/JIM.md) for more information
* HTTP API to list, retrieve and delete messages
  * See [APIv1](/docs/APIv1.md) and [APIv2](/docs/APIv2.md) documentation for more information
* [HTTP basic authentication](docs/Auth.md) for MailCache UI and API
* Multipart MIME support
* Download individual MIME parts
* In-memory message storage
* MongoDB and file based storage for message persistence
* Lightweight and portable
* No installation required

#### sendmail

[mhsendmail](https://github.com/mailcache/mhsendmail) is a sendmail replacement for MailCache.

It redirects mail to MailCache using SMTP.

You can also use `MailCache sendmail ...` instead of the separate mhsendmail binary.

Alternatively, you can use your native `sendmail` command by providing `-S`, for example:

```bash
/usr/sbin/sendmail -S mail:1025
```

For example, in PHP you could add either of these lines to `php.ini`:

```
sendmail_path = /usr/local/bin/mhsendmail
sendmail_path = /usr/sbin/sendmail -S mail:1025
```

#### Web UI

![Screenshot of MailCache web interface](/docs/MailCache.png "MailCache web interface")

### Contributing

MailCache is a rewritten version of [MailCache](https://github.com/ian-kent/MailCache), which was born out of [M3MTA](https://github.com/ian-kent/M3MTA).

Clone this repository to ```$GOPATH/src/github.com/mailcache/mailcache``` and type ```make deps```.

See the [Building MailCache](/docs/BUILD.md) guide.

Requires Go 1.4+ to build.

Run tests using ```make test``` or ```goconvey```.

If you make any changes, run ```go fmt ./...``` before submitting a pull request.

### Licence

Copyright © 2025 - 2026, Suresh Shinde

Released under MIT license, see [LICENSE](LICENSE.md) for details.
