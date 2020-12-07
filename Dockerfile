FROM alpine:3.12
MAINTAINER Ilya Stepanov <dev@ilyastepanov.com>

RUN apk add --update --no-cache py-pip

RUN pip install s3cmd

ADD s3cfg /root/.s3cfg

ADD start.sh /start.sh
RUN chmod +x /start.sh

ADD sync.sh /sync.sh
RUN chmod +x /sync.sh

ADD get.sh /get.sh
RUN chmod +x /get.sh

ENTRYPOINT ["/start.sh"]
CMD [""]
