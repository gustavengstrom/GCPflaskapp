



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



# Cloud run 

Secrets in cloud run
https://www.youtube.com/watch?v=JIE89dneaGo


# Cloud build

https://www.youtube.com/watch?v=RBpDLP9ZoCk
