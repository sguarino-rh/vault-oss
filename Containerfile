FROM        registry.access.redhat.com/ubi8/ubi-minimal:8.10
LABEL       maintainer="exd-sp-pv-sec@redhat.com" vendor="Red Hat EXD Software Production"
ENV         VERSION=1.7.1
ADD         https://releases.hashicorp.com/vault/${VERSION}/vault_${VERSION}_linux_amd64.zip /tmp/vault.zip
#ADD         https://certs.corp.redhat.com/certs/2015-IT-Root-CA.pem /etc/pki/ca-trust/source/anchors/2015-IT-Root-CA.pem
#ADD         https://certs.corp.redhat.com/certs/2022-IT-Root-CA.pem /etc/pki/ca-trust/source/anchors/2022-IT-Root-CA.pem
RUN         microdnf install -y unzip \
            && unzip /tmp/vault.zip -d /usr/local/bin \
            && rm -rf /tmp/vault.zip \
            && update-ca-trust \
            && microdnf clean -y all
#ENTRYPOINT  [ "vault", "server", "-dev", "-dev-root-token-id=${VAULT_TOKEN}", "-dev-listen-address=0.0.0.0:8200" ]
ENTRYPOINT [ "echo", "hello world" ]
