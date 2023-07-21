FROM ubuntu
RUN pwd
RUN apt-get update -y           
RUN apt-get install git -y
RUN echo "Hello Team"
