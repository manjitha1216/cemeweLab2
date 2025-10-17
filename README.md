# 🧩 cemewe DevOps Course for beginners 🚀

## 🚀 CI/CD Terraform Lab 2 — Launch Apache EC2 Instance with Image from S3

This lab demonstrates how to use Terraform to automatically provision an Apache Web Server on AWS EC2 and display an image hosted in an Amazon S3 bucket.

It also introduces GitHub Actions for automating your Terraform workflow (CI/CD).

---

## 1. 🧰 Prerequisites

Before starting this lab, make sure you have the following tools installed and configured on your system:

### 🧱 Core Tools
- [**Terraform**](https://developer.hashicorp.com/terraform/downloads) — used for Infrastructure as Code (IaC)  
  ▶️ **Installation guide (YouTube):** [How to Install Terraform](https://www.youtube.com/watch?v=ntf5mvIvE2k)

- [**Git**](https://git-scm.com/downloads) — used for version control  
  ▶️ **Configuration guide (YouTube):** [Git Configuration Tutorial](https://www.youtube.com/watch?v=3Tsaxxv9sls)

- [**AWS CLI**](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) — used for managing AWS services via the command line  
  ▶️ **Installation guide (YouTube):** [AWS CLI Setup Tutorial](https://www.youtube.com/watch?v=u0JyzUGzvJA&t=296s)

---

### 🧩 Recommended VS Code Setup
Use **Visual Studio Code (VS Code)** as your IDE for this lab.  
It provides syntax highlighting, linting, and Terraform integration for a smoother workflow.

▶️ **Watch:** [Best VS Code Extensions for Terraform & DevOps](https://www.youtube.com/watch?v=ThlynejTCWE)

---

## 🪜 2. Create a New Project Folder Locally

Open a terminal and create a new folder for your lab:

```bash
mkdir terraform-lab2
```
```bash
cd terraform-lab2
```
Open it in VS Code:
```bash
code .
```
Inside VS Code, create the following files:

- main.tf
- variables.tf
- .github/workflows/deploy-apache.yml

Copy the Terraform code from your lab instructions in the git repo into these files.

## 4. ⚙️ Configure Git (if not already configured)

Initialize a new Git repository:
This tells Git to start tracking your files.
```bash
git init
```
If this is your first time using Git on your system, set your username and email:
```bash
git config --global user.name "Username"
git config --global user.email "email@example.com"
```
You can verify your configuration using:
```bash
git config --list
```

If you want to use different identities for specific projects (for example, one for personal projects and one for work), you can configure Git only for the current repository.

```bash
git config user.name "Username"
git config user.email "email@example.com"
```
## 5. 🧑‍💻 Update Your Student Name

Before running Terraform commands, open the `variables.tf` file and update the following variable:

```hcl
variable "student_name" {
  description = "Unique student identifier"
  type        = string
  default     = "your-name"  # <-- Each student updates this value
}
```

## 6. 🔑 Configure AWS Credentials in GitHub

GitHub Actions needs AWS credentials to deploy Terraform resources.

Go to your GitHub repository → Settings → Secrets and variables → Actions → New repository secret

Add these secrets:

- AWS_ACCESS_KEY_ID: Your AWS IAM user access key ID
- AWS_SECRET_ACCESS_KEY: Your AWS IAM user secret access key

## 7. 😎 Push your code to Git repository

Go to your GitHub repository → Actions tab
You should see the workflow running. Once it completes successfully, Terraform resources are deployed automatically!
