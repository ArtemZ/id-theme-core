FROM jboss/keycloak

ENV KEYCLOAK_USER admin
ENV KEYCLOAK_PASSWORD admin

RUN cd /opt/jboss
RUN git clone https://github.com/C-ore/id-theme-core.git
RUN cp -r id-theme-core/resources/theme/core keycloak/themes/

RUN cd /opt/jboss/keycloak/bin
RUN ./kcadm.sh config credentials --server http://localhost:8080/auth --realm master --user admin --password eep4Ooze
RUN ./kcadm.sh update realms/master -s sslRequired=NONE
RUN ./kcadm.sh update realms/master -s "loginTheme=core"
RUN ./kcadm.sh update realms/master -s "adminTheme=core"
RUN ./kcadm.sh update realms/master -s "accountTheme=core"
RUN ./kcadm.sh update realms/master -s "emailTheme=core"
