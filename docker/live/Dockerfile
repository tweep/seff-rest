#
# GNE-internal Dockerfile to run eHive SENTIEON FEB via container in AWS 
# 
#
# BUILD container:
# Build it from the *root directory* of repo -  so you copy the 'live' code into the container later.
#
#     cd $HOME/ehive-sentieon-feb
#     docker build -f docker/live/Dockerfile -t ehive-sentieon-feb . 
#
# RUN container: 
#
#     docker run   -it ehive-sentieon-feb 
#
#
## Check that the test-suite works (guest_language.t is expected to fail
# docker run -e EHIVE_TEST_PIPELINE_URLS=sqlite:/// ensembl-hive prove -r /repo/ensembl-hive/t
#
## Open a session in a new container (will run bash)
#    docker run -it ensembl-sentieon-feb
#
## Initialize and run a pipeline
# setenv URL mysql://gneadmin:gene@resio01.gene.com:9306/vogelj4_example_pipeline_db
# docker run -it ehive-md5sum init_pipeline.pl Bio::EnsEMBL::Hive::PipeConfig::Md5sumAccu_conf -url $URL
# docker run -it ehive-md5sum seed_pipeline.pl -logic_name Find_And_Bundle_Files  -input_id "{ 'json_file' => './t/ehive_input.json' }" 
# docker run -it ehive-md5sum beekeeper.pl -url $URL -loop -sleep 0.2
# docker run -it ehive-md5sum runWorker.pl -url $URL

FROM tweep/ehive-base-ubuntu-18:v2.5.11  as base 

MAINTAINER vogelj4@gene.com

#RUN apt-get --allow-releaseinfo-change update && apt-get update 

# Perl dependencies and modules 

RUN cpanm  -l/repo Mojolicious 
ENV PERL5LIB "/repo/lib/perl5"

ENV PATH "/repo/bin":${PATH} 

COPY $PWD /home/ubuntu/code/
ENV PERL5LIB "/home/ubuntu/code/lib:/repo/code/:${PERL5LIB}" 

ENV TMPDIR   "/tmp/"   

WORKDIR /home/ubuntu
#USER ubuntu:ubuntu    

#ENTRYPOINT [ "/repo/ensembl-hive/scripts/dev/simple_init.py" ]  
CMD ["/bin/bash"] 

