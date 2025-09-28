hello:
	echo "hello"
build:
	docker build -t jenkins-node-gradle .

run:
	docker run -v /Users/carloskorrodi/Documents/Mestrado/Projects/jenkins:/tmp/test --hostname=bdc41bd36be6 --user=jenkins --env=PATH=/opt/java/openjdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin --env=LANG=C.UTF-8 --env=JENKINS_HOME=/var/jenkins_home --env=JENKINS_SLAVE_AGENT_PORT=50000 --env=REF=/usr/share/jenkins/ref --env=JENKINS_VERSION=2.516.3 --env=JENKINS_UC=https://updates.jenkins.io --env=JENKINS_UC_EXPERIMENTAL=https://updates.jenkins.io/experimental --env=JENKINS_INCREMENTALS_REPO_MIRROR=https://repo.jenkins-ci.org/incrementals --env=COPY_REFERENCE_FILE_LOG=/var/jenkins_home/copy_reference_file.log --env=JAVA_HOME=/opt/java/openjdk --env=NODE_VERSION=12.22.12 --env=ARCH=arm64 --env=NODE_DIST=node-v12.22.12-linux-arm64 --env=GRADLE_VERSION=8.4 --volume=/var/jenkins_home --network=bridge -p 50000:50000 -p 8080:8080 --restart=no --label='org.opencontainers.image.description=The Jenkins Continuous Integration and Delivery server' --label='org.opencontainers.image.licenses=MIT' --label='org.opencontainers.image.revision=69c12c7c0453c55bccfacea26e2ead9af91be714' --label='org.opencontainers.image.source=https://github.com/jenkinsci/docker' --label='org.opencontainers.image.title=Official Jenkins Docker image' --label='org.opencontainers.image.url=https://www.jenkins.io/' --label='org.opencontainers.image.vendor=Jenkins project' --label='org.opencontainers.image.version=2.516.3' --runtime=runc -d jenkins-node-gradle

