#FREE CONTAINER 
FROM ubuntu:latest
RUN apt update -y
RUN apt install nginx -y
EXPOSE 80
ENTRYPOINT [ "nginx" ]
CMD ["-g", "daemon off;"]