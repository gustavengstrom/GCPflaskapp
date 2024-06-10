

# Create, Delete and edit a GCE

## Delete instance
gcloud compute instances delete test-dc1 --zone=europe-west1-b 

## Create instance
gcloud compute instances create test-dc3 --scopes=https://www.googleapis.com/auth/cloud-platform  --machine-type=e2-small --zone=europe-west1-b --image cos-101-17162-463-26 --image-project cos-cloud --tags=http-server,https-server --metadata-from-file user-data=cloud-config-dc2.yml

## Add meta data
gcloud compute instances add-metadata test-dc3 --zone=europe-west1-b --metadata-from-file user-data=cloud-config-dc2.yml 

## Log in to GCE 

gcloud compute ssh test-dc3 --project reportall --zone europe-west1-b

## Reset instance
gcloud compute instances reset test-dc3 --zone europe-west1-b

# Notes

We cannot use ‘docker-credential-gcr’ as mentioned in: 

https://medium.com/@sachin.d.shinde/docker-compose-in-container-optimized-os-159b12e3d117

Hence the working version is `cloud-config-dc2.yml`

https://medium.com/google-cloud/stopping-a-docker-contain-on-cos-9a1f615dc85

https://cloud.google.com/container-optimized-os/docs/how-to/run-container-instance


https://gist.github.com/exocode/7d7052681b817c62d01b122f0a87d5b5  # cloud-init-rancher-server-ssl-nginx.yml


https://blog.baens.net/posts/setting-up-cos-on-gcp/

https://medium.com/@sachin.d.shinde/docker-compose-in-container-optimized-os-159b12e3d117




# View output from startup script

systemctl status composer.service
sudo journalctl -u composer.service

# Docker
sudo journalctl --vacuum-time=5days
docker-credential-gcr configure-docker --registries europe-west1-docker.pkg.dev

# Cloud build notes

In the Cloud Build Console we first need to create a build trigger 

Notes:
https://medium.com/google-cloud/connect-to-compute-engine-using-ssh-keys-and-cloud-build-319fa517456

# Build

docker build -t flask-app . 
docker run --name test -p 8081:8081 -v ./credentials.json:/secrets/credentials.json flask-app

# Artifacts

First we need to activate service account for pushing to artifact. Configure authentication to Artifact Registry for Docker 

https://cloud.google.com/artifact-registry/docs/docker/authentication#gcloud-helper


https://cloud.google.com/artifact-registry/docs/docker/pushing-and-pulling


### docker tag SOURCE-IMAGE LOCATION-docker.pkg.dev/PROJECT-ID/REPOSITORY/IMAGE:TAG
docker tag flask-app europe-north1-docker.pkg.dev/reportall/testapp/flask-app-art:staging

###  docker push europe-north1-docker.pkg.dev/reportall/REPOSITORY/IMAGE:TAG
docker push europe-north1-docker.pkg.dev/reportall/testapp/flask-app-art:staging


# SCRAPS:


echo -n "test_secret1" | gcloud secrets create TEST_SECRET --replication-policy="automatic" --data-file=-

