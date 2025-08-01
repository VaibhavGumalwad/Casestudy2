## Folder Structure:-
myapp/
├── src/
│   ├── index.js
│   └── package.json
├── infra/
│   ├── main.tf
│   └── variables.tf
├── ansible/
│   ├── deploy.yml
│   └── hosts.ini
├── scripts/
│   ├── build_and_push.sh
│   └── cleanup.sh
└── Jenkinsfile

## Architecture Diagram:-
Developer (Git) → GitHub (Repo) → Jenkins (CI/CD)
   │                          │
   │                          ├─ Build Docker Image → DockerHub
   │                          │
   │                          ├─ Terraform → AWS EC2 Instance
   │                          │
   │                          └─ Ansible → Deploy Docker Container
User → Browser → AWS EC2 (Deployed Node.js App)

## Branching Strategy:-
- main branch--> Production-ready code only
- develop branch-->Active development branch
- Feature branches-->For each feature, merged via Pull Request into develop
- Pull Request policy-->Requires code review before merging into main
  
