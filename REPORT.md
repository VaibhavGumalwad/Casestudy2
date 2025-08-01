## Architecture Diagram:-
Developer (Git) → GitHub (Repo) → Jenkins (CI/CD)->Build Docker Image → DockerHub->Terraform → AWS EC2 Instance -->Ansible → Deploy Docker Container

## Branching Strategy:-
- main branch--> Production-ready code only
- develop branch-->Active development branch
- Feature branches-->For each feature, merged via Pull Request into develop
- Pull Request policy-->Requires code review before merging into main
  
## Terraform Resource Summary
- VPC-->10.0.0.0/16 CIDR
- Public Subnet-->10.0.1.0/24 with public IP mapping
- Security Group-->Allows SSH (22) and HTTP (80)
- EC2 Instance-->t2.micro (Amazon Linux 2)
- Elastic IP--> Attached to EC2 instance

## Pipeline Execution Screenshots or Logs
1. Jenkins Pipeline Stages:
   - Checkout (GitHub develop branch)
   - Build & Push Docker Image to DockerHub
   - Provision AWS infrastructure using Terraform
   - Configure EC2 and deploy container using Ansible
2. (Add Jenkins console output or stage success screenshots)
