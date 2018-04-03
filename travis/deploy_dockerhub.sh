#!/bin/sh

docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS

if [ "$TRAVIS_BRANCH" = "master" ]; then

    TAG="latest"

else

    TAG="$TRAVIS_BRANCH"

fi

docker build -f Dockerfile -t $DOCKER_REPONAME\$DOCKER_APPNAME:$TAG .

docker push $DOCKER_REPONAME\$DOCKER_APPNAME