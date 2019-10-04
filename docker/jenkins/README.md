jenkins-bootstrap
-----------------
A Vagrant/ansible project that stands up an Ubuntu 18.04 host, installs docker, and stands up Jenkins in a docker container using Jenkins' configuration as code plugin.

Using the repository
====================
- Fork the repository
- Modify `docker/jenkins/jobs/jenkins.groovy` to point to your fork.
- Optionally, modify `provision.yml` and set the domain you would like to use for the certificate chain and Jenkins hostnames (default is `cert_domain: "devbootstrap.dyindude"`
- Optionally, modify any settings for Jenkins in `docker/jenkins/casc/jenkins.yaml`
- Make sure to commit the above changes to your fork.
- Modify your hosts file to point `jenkins.{{ cert_domain }}` and `jenkinstest.{{ cert_domain }}` to your host machine's IP address.
    - examples:
    - `192.168.0.66 jenkins.devbootstrap.dyindude`
    - `192.168.0.66 jenkinstest.devbootstrap.dyindude`
- Run `vagrant up`
- At the end of the second provisioning script, the Jenkins public ssh key is printed. Add this as a deploy key to your fork's repository (read only is fine)
- Access Jenkins from https://jenkins.devbootstrap.dyindude:4443
- Run the pipeline, make changes to the repo, run the pipeline again - the example provided pipeline `docker/jenkins/Jenkinsfile` will deploy `jenkinstest` to a separate docker network, separate project space, etc, then redeploy "prod" if these simple tests are successful.
- Add new pipeline files in `docker/jenkins/jobs/`, run the `jenkins` pipeline to add new jobs and build other projects (will provide other examples in future updates)
