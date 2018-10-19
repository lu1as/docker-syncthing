# docker-syncthing

A syncthing docker image, designed for nextcloud integration. 
Syncthing runs as user with uid 33.

Docker hub: [hub.docker.com/r/lu1as/aptly](https://hub.docker.com/r/lu1as/aptly)

# How to start

Start syncthing container:

```shell
docker run -v data:/var/syncthing -p 8384:8384 lu1as/syncthing
```

Visit the webinterface and setup place synchronized folders at subfolders of `/var/syncthing`.
Mount the `data` volume with your nextcloud container and use the [external storage feature](https://docs.nextcloud.com/server/12/admin_manual/configuration_files/external_storage_configuration_gui.html) to integrate your syncthing folders into nextcloud.
