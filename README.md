# Docker Nextcloud with Collabora and an HTML server

This repository contains files for a Nextcloud, Collabora and an HTML Server installation in Docker.
All in one docker-compose file with nginx reverse proxy and Letsencrypt certificate deployment.
The `docker-compose.yml` files come in two variants.

1. PostgreSQL
2. MariaDB

So choose wisely with database is needed.

## Table of contents

+ [Installation of Docker](#installation-of-docker)
+ [Configuration of Nextcloud](#configuration-of-nextcloud)
  + [HTML website](#html-website)

## Installation of Docker

This installation process was tested on an Ubuntu 20.04 and Debian 11.

Install `docker` and `docker-compose` either via a packet manager or other methods.
For ease of use a package manager like `apt` will be used. If you want a more update to date version of docker visit the instruction on the [docker website](https://docs.docker.com/compose/install/).

**Many commands need root privileges.**

Install `docker`, `docker-compose` and tools like `git`.

```
[user@server ~]$ sudo apt update && sudo apt install docker docker-compose git -y
```

Add your user to the `docker` group.

```
[user@server ~]$ sudo usermod $USER -aG docker
```

For this to take affect, you need to log out and log back in.

```
[user@server ~]$ exit
[user@local ~]$ ssh user@server
```

## Configuration of Nextcloud

Clone the repository with `git` and change into it.

```
[user@server ~]$ git clone https://github.com/MartinJindra/docker_nextcloud
[user@server ~]$ cd docker_nextcloud
```

Copy the `docker-compose.yml` you want in the root of the repository.

**MariaDB**

```
[user@server ~/docker_nextcloud]$ cp MariaDB/docker-compose.yml docker-compose.yml
```

**PostgreSQL**

```
[user@server ~/docker_nextcloud]$ cp PostgreSQL/docker-compose.yml docker-compose.yml
```
Edit the [.env](.env) file.

Replace any `TODO` with secure and strong passwords and any links or domains with your own.

## HTML website

If you want to serve a static HTML website from your server copy your .html (and .js) files into [html_server/html](html_server/html).

In [.env](.env) edit the `DOMAIN` variable with your domain for the website.

And finally start it with `docker-compose`.

```
[user@server ~/docker_nextcloud]$ docker-compose up -d
```

Now is the hardest part. WAITING.
The setup and start process of the Docker containers can take a while because a lot of stuff is taken care of by Docker like setting up the Let's Encrypt certificates.

When you think that everything is done visit your Nextcloud instance and start the setup process for Nextcloud.

## CREDIT

This repository is a fork from [bohlrich](https://github.com/bohlrich/docker_nextcloud).
Changes include
  1. support for two databases `MariaDB` and `PostgreSQL`
  2. more up to date image versions
