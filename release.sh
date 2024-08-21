#!/bin/sh

VERSION="1.0.1"
REPOSITORY="codeium-enterprise"

docker build . -t "exafunction/$REPOSITORY/gotrue:$VERSION"

# AWS
../Exafunction/exa/deploy_images/ecr_login.sh

docker tag "exafunction/$REPOSITORY/gotrue:$VERSION" "433863713167.dkr.ecr.us-east-2.amazonaws.com/exafunction/$REPOSITORY/gotrue:$VERSION"
docker push "433863713167.dkr.ecr.us-east-2.amazonaws.com/exafunction/$REPOSITORY/gotrue:$VERSION"

# GCP

../Exafunction/exa/deploy_images/gcr_login.sh

docker tag "exafunction/$REPOSITORY/gotrue:$VERSION" "us-docker.pkg.dev/exafunction/$REPOSITORY/gotrue:$VERSION"
docker push "us-docker.pkg.dev/exafunction/$REPOSITORY/gotrue:$VERSION"

# Azure

../Exafunction/exa/deploy_images/acr_login.sh

docker tag "exafunction/$REPOSITORY/gotrue:$VERSION" "exafunction.azurecr.io/exafunction/$REPOSITORY/gotrue:$VERSION"
docker push "exafunction.azurecr.io/exafunction/$REPOSITORY/gotrue:$VERSION"
