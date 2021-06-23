# Nextcloud on Docker with Collabora

Here are the source files for the installation of Nextcloud on Docker with Collabora. 
All in one docker-compose file with nginx reverse proxy and Letsencrypt certificate deployment. 

## Installation

This installation process was tested on an Ubuntu 20.04 server.

Install `docker` and `docker-compose` via a packet manager or other methods.
For ease of instructions a package manager like `apt` will be used but if you want more update to date versions go to [docker website](https://docs.docker.com/compose/install/). Also all commands are executed as root.

```bash
apt install docker docker-compose git
```

Clone the repository with git and change into it.

```bash
git clone https://github.com/MartinJindra/docker_nextcloud 
cd docker_nextcloud
```

Pull the docker images.

```bash
docker-compose pull
```

Edit the [docker-compose.yml](docker-compose.yml) file. Replace any TODO with secure and strong passwords and replace any links or domains with your own. 

Initialize some configuration files for the nginx-reverse proxy with [init.sh](init.sh). This is important so that larger files can be uploaded.

```bash
bash init.sh
```

And finally start it with `docker-compose`. 

```bash
docker-compose up -d
```

Now is the hardest part. WAITING.
The setup and start process of the Docker containers can take a while because a lot of stuff is taken care of by Docker like Let's Encrypt certificates.

When you think that everything is done visit your Nextcloud instance and start the setup process for Nextcloud.

## Updating the containers

Normal updates with Docker are not to difficult but to make it even simpler execute [update_images.sh](update_images.sh).

```bash
bash update_images.sh
```

## Links that could be useful

+ [https://saxonydevops.com/2020/09/30/nextcloud-and-collabora-on-docker](https://saxonydevops.com/2020/09/30/nextcloud-and-collabora-on-docker/)
+ [redis und collabora](https://github.com/SnowMB/nextcloud)
