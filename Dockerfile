# OS
FROM ubuntu:latest
# Set version label
LABEL maintainer="github.com/Dofamin"
LABEL image="AdGuardHome"
LABEL OS="Ubuntu/latest"
# ARG & ENV
WORKDIR /srv/
ENV TZ=Europe/Moscow
# Update system packages:
RUN apt -y update > /dev/null 2>&1;\
# Fix for select tzdata region
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone > /dev/null 2>&1;\
    dpkg-reconfigure --frontend noninteractive tzdata > /dev/null 2>&1;\
# Install dependencies, you would need common set of tools.
    apt -y install curl wget ntp > /dev/null 2>&1;\
# Download release
    URL="https://github.com/AdguardTeam/AdGuardHome/releases" > /dev/null 2>&1;\
    FILE="AdGuardHome_linux_amd64.tar.gz" > /dev/null 2>&1;\
    LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' $URL/latest) > /dev/null 2>&1;\
    LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/') > /dev/null 2>&1;\
    ARTIFACT_URL="$URL/download/$LATEST_VERSION/$FILE" > /dev/null 2>&1;\
    wget $ARTIFACT_URL | bash - > /dev/null 2>&1;\
# Unpack release
    tar -xvzf $FILE > /dev/null 2>&1;\
    mkdir /srv/AdGuardHome/work > /dev/null 2>&1;\
# Cleanup
    rm -f $FILE > /dev/null 2>&1;\
    apt-get clean > /dev/null 2>&1;
# HEALTHCHECK
HEALTHCHECK --interval=60s --timeout=30s --start-period=5s CMD curl -f http://localhost:3002 || exit 1
# Expose Ports:
EXPOSE 3002
EXPOSE 53
# CMD
CMD ["/bin/bash" , "-c" , "service ntp start && /srv/AdGuardHome/AdGuardHome --port 3002 --work-dir AdGuardHome/work"]
