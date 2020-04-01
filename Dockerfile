FROM jboss/keycloak:6.0.1

RUN rm -rf /opt/jboss/keycloak/themes/keycloak/{login,account,email}
COPY core-theme-login /opt/jboss/keycloak/themes/keycloak/login
COPY core-theme-account /opt/jboss/keycloak/themes/keycloak/account
COPY core-theme-email /opt/jboss/keycloak/themes/keycloak/email

#COPY resources /opt/jboss/keycloak/themes/core/
#COPY resources-community /opt/jboss/keycloak/themes/core/
#COPY resources-product /opt/jboss/keycloak/themes/core/
#COPY package.json /opt/jboss/keycloak/themes/core/

