#!/bin/sh
image_name=cucumber
registry_server=10.13.1.15:5000

docker tag $image_name $registry_server/$image_name:latest
docker push $registry_server/$image_name