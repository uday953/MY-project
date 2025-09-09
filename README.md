This repository demonstrates a CI/CD pipeline on AWS.

Structure:
- **/iac**: Terraform code to provision AWS resources
- **/pipeline**: CI/CD definitions (GitHub Actions workflow)
- **/app**: Sample Node.js app
- **README.md**: Documentation with setup steps & architecture

Steps:
1. Deploy infrastructure with Terraform (`/iac`).
2. Push code to GitHub, pipeline (`/pipeline`) automates build & deploy.
3. App (`/app`) runs on ECS or EC2, served via S3/CloudFront.
