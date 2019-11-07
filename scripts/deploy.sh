#!/bin/sh

set -ex

if [ -z "${TRAVIS_COMMIT}" ];then TRAVIS_COMMIT="unknown";fi

PLAN=tf.plan

TF_OPTS="-no-color"

docker run \
  --rm \
  -v "${HOME}:${HOME}:ro" \
  -v /tmp:/tmp \
  --volume "$(pwd):/terraform" \
  --workdir "/terraform" \
  --log-driver none \
  -e DIGITALOCEAN_TOKEN \
  -e SSH_AUTH_SOCK \
  "hashicorp/terraform:light" init -reconfigure -get=true $TF_OPTS

docker run \
  -it \
  --rm \
  -v "${HOME}:${HOME}:ro" \
  -v /tmp:/tmp \
  --volume "$(pwd):/terraform" \
  --workdir "/terraform" \
  --log-driver none \
  -e DIGITALOCEAN_TOKEN \
  -e SSH_AUTH_SOCK \
  "hashicorp/terraform:light" plan -out $PLAN -var "enabled=true" -var "this_version=$TRAVIS_COMMIT" $TF_OPTS

docker run \
  --rm \
  -v "${HOME}:${HOME}:ro" \
  -v /tmp:/tmp \
  --volume "$(pwd):/terraform" \
  --workdir "/terraform" \
  -e DIGITALOCEAN_TOKEN \
  -e SSH_AUTH_SOCK \
  "hashicorp/terraform:light" apply -auto-approve $PLAN $TF_OPTS
