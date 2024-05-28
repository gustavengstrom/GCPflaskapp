
# Create, Delete and edit a GCE

gcloud compute instances delete test-dc1 --zone=europe-north1-a

gcloud compute instances create test-dc2 --scopes=https://www.googleapis.com/auth/cloud-platform  --machine-type=e2-small --zone=europe-north1-a --image cos-101-17162-463-26 --image-project cos-cloud --tags=http-server,https-server --metadata-from-file user-data=cloud-config-dc.yml


gcloud compute instances add-metadata test-dc2 --zone=europe-north1-a --metadata-from-file user-data=cloud-config-dc2.yml 

# Notes

https://medium.com/google-cloud/stopping-a-docker-contain-on-cos-9a1f615dc85

https://cloud.google.com/container-optimized-os/docs/how-to/run-container-instance


https://gist.github.com/exocode/7d7052681b817c62d01b122f0a87d5b5  # cloud-init-rancher-server-ssl-nginx.yml


https://blog.baens.net/posts/setting-up-cos-on-gcp/

https://medium.com/@sachin.d.shinde/docker-compose-in-container-optimized-os-159b12e3d117


# Log in to GCE 

gcloud compute ssh test-dc2 --project reportall --zone europe-north1-a

gcloud compute instances reset test-dc2 --zone europe-north1-a

# View output from startup script

systemctl status composer.service

sudo journalctl -u cloudservice.service

# Docker

docker-credential-gcr configure-docker --registries europe-west1-docker.pkg.dev



# SCRAPS:


echo -n "test_secret1" | gcloud secrets create TEST_SECRET --replication-policy="automatic" --data-file=-

