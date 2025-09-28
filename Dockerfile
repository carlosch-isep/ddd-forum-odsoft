FROM jenkins/jenkins:lts

USER root

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    software-properties-common \
    sudo \
    xz-utils \
    git

# Install Node.js 12.22.12 (binário ARM64)
ENV NODE_VERSION=12.22.12
ENV ARCH=arm64
ENV NODE_DIST=node-v$NODE_VERSION-linux-$ARCH

RUN curl -fsSL https://nodejs.org/dist/v$NODE_VERSION/$NODE_DIST.tar.xz -o node.tar.xz && \
    mkdir -p /usr/local/lib/nodejs && \
    tar -xJf node.tar.xz -C /usr/local/lib/nodejs && \
    rm node.tar.xz && \
    ln -s /usr/local/lib/nodejs/$NODE_DIST/bin/node /usr/bin/node && \
    ln -s /usr/local/lib/nodejs/$NODE_DIST/bin/npm /usr/bin/npm && \
    ln -s /usr/local/lib/nodejs/$NODE_DIST/bin/npx /usr/bin/npx && \
    node -v && npm -v

# Install Gradle
ENV GRADLE_VERSION=8.4
RUN curl -sL https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle.zip && \
    unzip gradle.zip -d /opt/ && \
    ln -s /opt/gradle-${GRADLE_VERSION}/bin/gradle /usr/bin/gradle && \
    rm gradle.zip

RUN gradle --version

USER jenkins