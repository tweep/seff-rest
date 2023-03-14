
# seff-rest
Quick-and-dirty Mini REST service to query a SLURM daemon via REST to retrieve data on a SLURM job. 
Rest service is executing the ```seff``` command. Works on ```seff Version 2.1```. 
Written in go.

## How to build 

```
   make test-local 
    or 
     docker run -it  -d -p8080:8080  seff-rest:v1-00 /bin/bash

   mojo generate lite_app
   ./app.pl daemon --listen http://*:8080
```

