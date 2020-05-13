FROM python:3.7-slim 
MAINTAINER heroperseus

RUN apt-get update \
    && apt-get install -y wget tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && wget https://github.com/huashengdun/webssh/archive/v1.5.2.tar.gz \
    && tar -zxvf v1.5.2.tar.gz \
    && cd webssh-1.5.2 \
    && python setup.py install \
    && cd .. \
    && rm -rf v1.5.2.tar.gz webssh-1.5.2 \
    && apt-get autoclean clean
    
EXPOSE 8888

CMD ["wssh", "--address=0.0.0.0"]