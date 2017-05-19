FROM mariadb:10

COPY ./healthcheck.sh /usr/local/bin/healthcheck.sh
HEALTHCHECK --interval=5s CMD /bin/bash healthcheck.sh # This doesn't actually work for some reason...