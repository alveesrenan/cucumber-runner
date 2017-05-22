# Cucumber #

# Requirements
- Docker-compose [1.13.0+](https://github.com/docker/compose/releases)
- Connected to Atech's VPN

# Configure registry access

## Allow host docker to use insecure registry

```sh
sudo echo '{ "insecure-registries": ["10.13.1.15:5000"] }' | sudo tee --append /etc/docker/daemon.json
sudo service docker restart
```

## Login in registry

**username:** *atech*

**password:** *atech#123*

```sh
docker login http://10.13.1.15:5000/
```