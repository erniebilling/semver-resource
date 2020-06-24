.PHONY: ubuntu

IMAGENAME=concourse-semver-resource-arm64
ubuntu: dockerfiles/ubuntu-arm64/Dockerfile
	docker build . -f $< -t ebilling/$(IMAGENAME):ubuntu

alpine: dockerfiles/alpine/Dockerfile
	docker build . -f $< -t ebilling/$(IMAGENAME):alpine

.PHONY: push

push: ubuntu alpine
	docker push ebilling/$(IMAGENAME):ubuntu
	docker push ebilling/$(IMAGENAME):alpine

