ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add python3 py3-pip git
RUN pip3 install --upgrade pip

RUN git clone https://github.com/kk7ds/pynx584
RUN pip3 install pynx584/

# Verify python installation
RUN which python3

# Verify package installation location
RUN /usr/bin/nx584_server --help

WORKDIR /usr/app/src
# config.ini to be created in run.sh
# COPY config.ini .
COPY config.ini_template

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
