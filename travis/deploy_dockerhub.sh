#!/bin/sh

docker login -u $DOCKER_USER -p $DOCKER_PASS

if [ "$TRAVIS_BRANCH" = "master" ]; then

    TAG="latest"

else

    TAG="$TRAVIS_BRANCH"

fi

docker build -t $DOCKER_REPONAME\$DOCKER_APPNAME:$TAG .
echo $DOCKER_REPONAME\$DOCKER_APPNAME
docker push $DOCKER_REPONAME\$DOCKER_APPNAME