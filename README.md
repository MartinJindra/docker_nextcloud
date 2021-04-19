# Nextcloud on Docker with Collabora
Here are the source files for the installation of Nextcloud on Docker with Collabora. 

All in one docker-compose file with nginx reverse proxy and Letsencrypt certificate deployment. 

One important hint: If you are on CentOS 7, you must change the firewall zone public and add a additional rule to it.

```xml
  <rule family="ipv4">
     <source address="172.19.0.0/16"/>
     <accept/>
  </rule>
```

Otherwise you can't connect to the Collabora container. Set the subnet with your docker container network subnet. 

You will find the public.xml source file in the repository.

# Extra configuration

+ [https://saxonydevops.com/2020/09/30/nextcloud-and-collabora-on-docker](https://saxonydevops.com/2020/09/30/nextcloud-and-collabora-on-docker/)
