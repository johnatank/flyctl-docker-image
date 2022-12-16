## Why this is needed?
Default flyctl image (docker.io/flyio/flyctl) doen't have /bin/sh. It is using `scratch` as a base image. As a result - it is highly problematic to use it with CD pipeline. CD pipelines usually invokes all command as `/bin/sh -c 'command1 && command2`. 
Using apline as base image, /bin/sh can be called. 