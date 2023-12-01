# Python_App_CICD
This repository has an end-to-end setup for CICD pipeline

## Tools Installation
Commands to install Java and Jenkins

```
sudo apt update
sudo apt install openjdk-11-jre
```
```
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
```

Commands to Install Docker

```
sudo apt update
sudo apt install docker.io
```

Commands to grant permission to docker daemon for Jenkins user and Ubuntu user

```
sudo su - 
usermod -aG docker jenkins
usermod -aG docker ubuntu
systemctl restart docker
```
Restart the VM after the above step

Install minikube, kubectl and ArgoCD operator by follow the steps provided in the below reference

- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)
- [ArgoCD](https://operatorhub.io/operator/argocd-operator)
- [ArgoCD CLI](https://argo-cd.readthedocs.io/en/stable/cli_installation/)

## Jenkins Setup
Allow port 8080 in the inbound traffic rules to access Jenkins.

Login to Jenkins using ```http://<PUBLIC IP OF EC2 INSTANCE>:8080```

Once you login into Jenkins, run the following command to get the Jenkins admin password ```sudo cat /var/lib/jenkins/secrets/initialAdminPassword```

Install suggested plugins and create the admin user.

Go to ```Dashboard -> Manage Jenkins -> Plugin``` and install the following plugin from ```Available plugins``` section.

- Docker Pipeline
- Parameterized Trigger Plugin

Store GitHub and Dockerhub credentials in Jenkins.

Go to ```Dashboard -> Manage Jenkins -> Manage Credentials -> System -> Global Credentials -> Add Credentials```

- Choose ```Username and Password``` for Dockerhub credentials and ```Secret text``` for GitHub Personal access token.


Once all the configurations are done, restart the Jenkins using ```http://<PUBLIC IP OF EC2 INSTANCE>:8080/restart```



