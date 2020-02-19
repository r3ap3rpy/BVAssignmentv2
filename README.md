### BVAssignmentv2
[![Build Status](https://travis-ci.com/r3ap3rpy/BVAssignmentv2.svg?branch=master)](https://travis-ci.com/r3ap3rpy/BVAssignmentv2)

This is an improved version of my previous assignment, and it uses a pipeline with [TravisCI](https://travis-ci.com) and [DockerHUB](https://hub.docker.com/) with some [CIS](https://dev-sec.io/baselines/docker/) checks using the `inspec` tool.

There lives a small `Spring Boot` java app under `src`, which has one context route and runs on port 8080.

The artifact produced can be used with the following command.

``` bash 
docker run -d -it -p 8080:8080 r3ap3rpy/bvassignment:latest
```

It should respond with `Welcome to the v2 of my assignmenet from BetVictor!` to the following command `curl http://0.0.0.0:8080`.

Could be furhter improved by adding checks from different baselines like.

``` bash
inspec exec https://github.com/dev-sec/linux-baseline -t docker://`docker ps -f ancestor=$DOCKER_USERNAME/bvassignment:latest --form at "{{.ID}}"` ; export CHECKRESULT=$?
```

The tests are defined in the `test.rb` file which, furhter information as to what can be defined [here](https://www.inspec.io/docs/).

The moment a new commit is pushed to the repository a new build is triggered, at the end either on success or failure a notification is sent out.
In case of success the newly build docker image is pushed to the following [location](https://hub.docker.com/r/r3ap3rpy/bvassignment).