#!/bin/sh
image_name=cucumber-runner
registry_server=registry.atech.com.br

docker tag $image_name $registry_server/$image_name:latest
docker push $registry_server/$image_name