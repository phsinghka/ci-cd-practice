
# Java Application CI Pipeline with Jenkins

This repository contains a simple Java application and a Jenkins pipeline configuration to automate the build, test, and archive process using Maven.

## Project Overview

The main objective of this project is to demonstrate how to set up a Continuous Integration (CI) pipeline in Jenkins to build a Java application whenever changes are pushed to a specific branch (`java-app`). The pipeline will perform the following tasks:

- **Checkout**: Pulls the latest code from the `java-app` branch in the GitHub repository.
- **Build**: Compiles and builds the Java application using Maven.
- **Archive**: Stores the build artifact (a `.jar` file) as part of the Jenkins job output.


## Prerequisites

Before running the pipeline, ensure you have the following installed:

- **Jenkins**: Installed and running on a server.
- **Java (JDK 17 or later)**: Required to build the Java application.
- **Maven**: Required for managing dependencies and building the project.
- **Git**: For cloning the repository and version control.

### Installing Java and Maven

#### Install Java:
```bash
sudo apt update
sudo apt install openjdk-11-jdk
```

#### Install Maven:
```bash
sudo apt install maven
```

### Jenkins Plugins Required:
- **Pipeline**: For creating a pipeline-based job.
- **Git**: For pulling the code from GitHub.

---


### Jenkinsfile Overview

The `Jenkinsfile` defines the stages of the pipeline:

1. **Checkout**: Pulls the code from the `java-app` branch.
2. **Build**: Runs `mvn clean package` to build the Java application.
4. **Archive**: Archives the generated JAR file as a build artifact.

---

## Getting Started

### Step 1: Clone the Repository

To start working on this project, clone the repository:

```bash
git clone https://github.com/phsinghka/jenkins-github-integration-practice.git
cd jenkins-github-integration-practice
```

### Step 2: Create the `java-app` Branch

In your local repository, create and switch to the `java-app` branch:

```bash
git checkout -b java-app
git push origin java-app
```

### Step 3: Set Up Jenkins Pipeline

1. **Create a Jenkins Pipeline Job**:
   - Go to **Jenkins Dashboard > New Item > Pipeline** and name the job (e.g., `java-build-pipeline`).
   - In the **Pipeline** section, select **Pipeline script from SCM**.
   - Set the **SCM** to **Git** and enter the repository URL: `https://github.com/phsinghka/jenkins-github-integration-practice.git`.
   - Specify the branch as `*/java-app`.
   - Save the job configuration.

2. **Configure Webhooks**:
   - Set up a GitHub webhook to trigger the Jenkins build automatically when code is pushed to the `java-app` branch. Go to **GitHub Repository > Settings > Webhooks > Add webhook**.
   - Set the **Payload URL** to: `http://<JENKINS_SERVER_IP>:<JENKINS_PORT>/github-webhook/`.
   - Set the **Content Type** to **application/json**.
   - Select **Just the push event**.

3. **Run the Jenkins Pipeline**:
   - Make a push to the `java-app` branch, and Jenkins will automatically trigger the pipeline.
   - Alternatively, you can manually run the pipeline by going to **Jenkins Dashboard > Your Pipeline Job > Build Now**.
