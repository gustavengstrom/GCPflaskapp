
# Cloud Build deployment

## Using a single VM instance 

The following contains examples fro deploying to a GCE instance using:
- Cloud build
- Docker
- Cloud init

We deploy a simple Nginx container:

1) Cloud-init is defined using the cloud-config-dc2.yml file. This is added as meta data to the GCE instance and run on server startup.
2) Cloud build is setup using the cloudbuild_v2.yml file. This files will build, push (to artifact) and pull the most recent image to the GCE instance and then run docker-compose.yml defined in the cloud-config-dc2.yml. This commands are run by executing the the pull_images.sh script on the GCE instance.
3) An alternative deployment is found in cloudbuild_v1.yml which accomplishes the same but without the pull_images.sh script.


### Important notes:

- To run a pull_images.sh script we need to use bash command: `bash pull_images.sh` else we get permission denied.
- The GCE instance must have the correct scopes and IAM service account permission
- The cloud build trigger is recommended to use a custom service account
- A changes to docker-compose.yml which is embedded in the cloud-config file needs to be updated before build using `gcloud compute instances add-metadata` command followed by a `gcloud compute instances reset` command.



## Using a VM instance group (MIG)


https://cloud.google.com/compute/docs/instance-groups/set-mig-aic

'$(cat /path/to/your/cloud-config.yml)'
