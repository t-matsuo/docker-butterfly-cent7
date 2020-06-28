# docker-butterfly-centos

Dockerfile for using butterfly web terminal on CentOS.

butterfly : https://github.com/paradoxxxzero/butterfly

## Usage

Example:

    # docker run -d -p 8080:80 -e PASSWORD=password -e PORT=80 tmatsuo/butterfly-centos:latest

* If you don't specify PASSWORD env, it generates random password for root user. See container log.
* Default port is 80. You can change it using PORT env.
* Default path is /term/. Please access http://xx.xx.xx.xx/term/

