
# Jenkins GitHub Integration Project

## Overview

This project demonstrates the integration between **Jenkins** and **GitHub** to automate the continuous integration process. Jenkins is configured to pull code from a GitHub repository, build the application, and run tests. The process is triggered automatically using GitHub webhooks whenever a new commit is pushed to the repository.

By following this documentation, you will set up a **Freestyle Jenkins Job** to pull code from a GitHub repository, build it using a shell script, and verify the process using GitHub webhooks.

---

## Table of Contents

- [Technologies Used](#technologies-used)
- [Setup Instructions](#setup-instructions)
  - [Step 1: Setting Up Jenkins](#step-1-setting-up-jenkins)
  - [Step 2: Creating Jenkins Job](#step-2-creating-jenkins-job)
  - [Step 3: Configuring GitHub Webhook](#step-3-configuring-github-webhook)
- [Running the Project](#running-the-project)
- [Build and Test Process](#build-and-test-process)

---

## Technologies Used

- **Jenkins**: Open-source automation server that helps in building, deploying, and automating applications.
- **GitHub**: A web-based version control repository that hosts the code used in this project.
- **Shell Script**: A simple script is used to automate the build and test steps.

---

## Setup Instructions

### Step 1: Setting Up Jenkins

1. Install Jenkins on your local machine or cloud environment.
   - Refer to the [Jenkins Documentation](https://www.jenkins.io/doc/book/installing/) for detailed setup instructions.
   
2. Install the **Git Plugin**:
   - Go to **Manage Jenkins** → **Manage Plugins**.
   - In the `Available` tab, search for **Git Plugin**.
   - Install and restart Jenkins if required.

### Step 2: Creating Jenkins Job

1. Open the Jenkins dashboard, and click **New Item**.
2. Enter a job name, for example, `GitHub_Project_Builder`.
3. Select **Freestyle project** and click **OK**.
4. In the project configuration, scroll down to the **Source Code Management** section.
   - Choose **Git**.
   - Enter your GitHub repository URL: 
     ```
     https://github.com/phsinghka/jenkins-github-integration-practice.git
     ```
   - Add credentials (GitHub username and access token).
5. In **Build Triggers**, enable the **GitHub hook trigger for GITScm polling**.
6. In the **Build** section, select **Execute shell** and enter the following commands:
   ```bash
   npm install
   npm test
   ```
7. Optionally, you can configure **Post-build Actions** to:
   - Archive build artifacts.
   - Send email notifications for build status.

### Step 3: Configuring GitHub Webhook

1. Open your GitHub repository.
2. Go to **Settings** → **Webhooks**.
3. Click **Add webhook** and enter the following details:
   - **Payload URL**: This is the Jenkins webhook URL, which should be in the format:
     ```
     http://<your-jenkins-url>/github-webhook/
     ```
   - **Content type**: `application/json`
   - **Event trigger**: Select **Just the push event**.
4. Save the webhook configuration.
5. Test the integration by pushing code changes to GitHub and monitoring Jenkins for automatic builds.

---

## Running the Project

To run the Jenkins job, follow these steps:

1. **Initial Run**:
   - Navigate to Jenkins and manually trigger the job by clicking **Build Now**.
   - Monitor the **Console Output** to ensure Jenkins pulls the code, installs dependencies, and runs the test suite.
   
2. **Automatic Trigger**:
   - Push a new commit to the connected GitHub repository.
   - The GitHub webhook should trigger the Jenkins job automatically, and you can track the build progress in Jenkins.

---

## Build and Test Process

The build process consists of two steps:

1. **Dependency Installation**:
   - The `npm install` command installs the project dependencies required to run and test the application.
   
2. **Running Unit Tests**:
   - The `npm test` command runs unit tests defined in the `tests/` directory.
   - Test results can be viewed in Jenkins via the **Console Output** or archived as build artifacts.
