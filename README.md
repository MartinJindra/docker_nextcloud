# Nextcloud on Docker with Collabora

Here are the source files for a Nextcloud and Collabora installation with Docker.
The `docker-compose.yml` files come in two variants.

1. PostgreSQL
2. MariaDB

So choose wisely with Database you want.
All in one docker-compose file with nginx reverse proxy and Letsencrypt certificate deployment.

## Installation

This installation process was tested on an Ubuntu 20.04 server.

Install `docker` and `docker-compose` via a packet manager or other methods.
For ease of instructions a package manager like `apt` will be used but if you want more update to date versions go to [docker website](https://docs.docker.com/compose/install/).

**Many commands need root privileges.**

```
[user@server ~]$ sudo apt install docker docker-compose git
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

## Configuration

Clone the repository with git and change into it.

```
[user@server ~]$ git clone https://github.com/MartinJindra/docker_nextcloud
[user@server ~]$ cd docker_nextcloud
```

Copy the `docker-compose.yml` you want in the root of the repository.

```
[user@server ~/docker_nextcloud]$ cp MariaDB/docker-compose.yml docker-compose.yml
```

```
[user@server ~/docker_nextcloud]$ cp PostgreSQL/docker-compose.yml docker-compose.yml
```

Edit the [.env](.env) file.

1. Replace any `TODO` with secure and strong passwords and any links or domains with your own.
2. And edit some other options if you need to. For example you should change the variables ending with "MEM_LIMIT". These variables set a memory limit for each container and some machines have more or less RAM so change these accordingly.

And finally start it with `docker-compose`.

```
[user@server ~/docker_nextcloud]$ docker-compose up -d
```

Now is the hardest part. WAITING.
The setup and start process of the Docker containers can take a while because a lot of stuff is taken care of by Docker like Let's Encrypt certificates.

When you think that everything is done visit your Nextcloud instance and start the setup process for Nextcloud.

## Links that could be useful

+ [https://saxonydevops.com/2020/09/30/nextcloud-and-collabora-on-docker](https://saxonydevops.com/2020/09/30/nextcloud-and-collabora-on-docker/)
+ [redis und collabora](https://github.com/SnowMB/nextcloud)
