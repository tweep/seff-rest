
# seff-rest
Mini REST to get some job data from Slurm / seff 

## How to build 

   make test-local 
    or 
     docker run -it  -d -p8080:8080  seff-rest:v1-00 /bin/bash

   mojo generate lite_app
   ./app.pl daemon --listen http://*:8080


