
# Cloud Build deployment

The following contains examples fro deploying to a GCE instance using:
- Cloud build
- Docker
- Cloud init

We deploy a simple Nginx container:

1) Cloud-init is defined using the cloud-config-dc2.yml file. This is added as meta data to the GCE instance and run on server startup.
2) Cloud build is setup using the cloudbuild.yml file. This files will build, push (to artifact) and pull the most recent image to the GCE instance and then run docker-compose.yml defined in the cloud-config-dc2.yml. This commands are run by executing the the pull_images.sh script on the GCE instance.
3) An alternative deployment is found in cloudbuild_v1.yml which accomplishes the same but without the pull_images.sh script.
