## Building Custom Rasa Pro Image

### Docker Based Image

Build docker image from command line

```sh
KEYFILE="/Users/greg/Downloads/key-file.json"
VERS=3.5.4
IMAGE_TAG=base-${VERS}
REGISTRY=ghcr.io/rgstephens
IMAGE=rasa-pro
DOCKER_PLATFORMS=linux/amd64
# DOCKER_PLATFORMS=linux/amd64,linux/arm64
gcloud auth configure-docker europe-west3-docker.pkg.dev
docker buildx build --platform ${DOCKER_PLATFORMS} --tag ${REGISTRY}/${IMAGE}:${VERS} --build-arg VERS=${VERS} . --progress=plain
```

### Build from GitHub Actions (TBD)

- Set repo secret `GCR_JSON_KEY` with key-file.json value



### Python Based Image

```sh
gcloud auth configure-docker europe-west3-docker.pkg.dev
docker buildx build --secret id=key-file.json --platform linux/amd64 --tag stephens/rasa-pro:3.5.3 . --progress=plain
```
