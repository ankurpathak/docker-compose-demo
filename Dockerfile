ARG JENKINS_IMAGE
FROM ${JENKINS_IMAGE}

USER root
SHELL ["/bin/bash", "-c"]

RUN apt-get update \
&& apt-get -y install --no-install-recommends unzip zip \
&& rm -rf /var/lib/apt/lists/*

RUN export SDKMAN_DIR="/usr/local/sdkman" \
&& curl -s "https://get.sdkman.io" | bash \
&& source "$SDKMAN_DIR/bin/sdkman-init.sh" \
&& sdk install maven \
&& sdk flush archives \
&& sdk flush temp \
&& ln -s $SDKMAN_DIR/candidates/maven/current/bin/mvn /usr/bin/mvn

USER jenkins
