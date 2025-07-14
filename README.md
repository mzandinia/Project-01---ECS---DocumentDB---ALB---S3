# Full-Stack Application on AWS

A production-ready full-stack application deployed on AWS using modern cloud-native architecture with automated CI/CD pipeline.

![Workflow Diagram](./workflow-diagram.svg)

## 🏗️ Architecture Overview

This project demonstrates a complete full-stack application deployment using:

- **Frontend**: React + Vite hosted on S3
- **Backend**: Node.js + Express running on ECS Fargate
- **Database**: DocumentDB (MongoDB-compatible)
- **Load Balancer**: Application Load Balancer (ALB)
- **Infrastructure**: Terraform for Infrastructure as Code
- **CI/CD**: GitHub Actions for automated deployment

## 🚀 Tech Stack

### Frontend
- **React 18** with modern hooks
- **Vite** for fast development and building
- **Chakra UI** for component library
- **Zustand** for state management
- **React Router** for navigation

### Backend
- **Node.js** with Express framework
- **Mongoose** for MongoDB/DocumentDB integration
- **CORS** configured for cross-origin requests
- **Health check** endpoints for monitoring

### Infrastructure
- **AWS ECS Fargate** for containerized backend
- **AWS DocumentDB** for managed MongoDB-compatible database
- **AWS Application Load Balancer** for traffic distribution
- **AWS S3** for static website hosting
- **AWS ECR** for container image registry
- **AWS VPC** with public/private subnets
- **AWS SSM Parameter Store** for configuration management

### DevOps
- **Terraform** for Infrastructure as Code
- **Docker** for containerization
- **GitHub Actions** for CI/CD pipeline
- **AWS CLI** for deployment automation

## 📁 Project Structure

```
├── .github/workflows/          # CI/CD pipeline definitions
│   ├── ecr-setup.yml          # ECR repository setup
│   ├── docker-build-push.yml  # Backend container build & push
│   ├── terraform.yml          # Infrastructure deployment
│   └── frontend-deploy.yml    # Frontend S3 deployment
├── backend/                   # Node.js API server
│   ├── config/               # Database configuration
│   ├── controllers/          # Route controllers
│   ├── models/              # Data models
│   ├── routes/              # API routes
│   ├── Dockerfile           # Container definition
│   └── server.js            # Application entry point
├── frontend/                 # React application
│   ├── src/
│   │   ├── components/      # Reusable UI components
│   │   ├── pages/          # Application pages
│   │   └── store/          # State management
│   └── package.json
├── infra/                   # Terraform infrastructure
│   ├── modules/            # Reusable Terraform modules
│   │   ├── alb/           # Application Load Balancer
│   │   ├── docdb/         # DocumentDB cluster
│   │   ├── ecr/           # Elastic Container Registry
│   │   ├── ecs/           # ECS Fargate service
│   │   ├── network/       # VPC and networking
│   │   └── security_group/ # Security groups
│   └── *.tf               # Main Terraform configuration
└── docker-compose.yml      # Local development setup
```

## 🔄 CI/CD Pipeline

The deployment process is fully automated through GitHub Actions:

### 1. ECR Setup Workflow
- Creates ECR repository for Docker images
- Sets up image scanning and lifecycle policies

### 2. Docker Build & Push Workflow
- Builds backend Docker image
- Pushes to ECR with latest tag
- Triggers on backend code changes

### 3. Terraform Infrastructure Workflow
- Validates and applies infrastructure changes
- Waits for ECR image availability
- Deploys ECS service with new image

### 4. Frontend Deployment Workflow
- Builds React application
- Deploys to S3 bucket
- Configures static website hosting

## 🛠️ Local Development

### Prerequisites
- Node.js 18+
- Docker & Docker Compose
- AWS CLI configured
- Terraform 1.12+

### Setup
1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd Project\ 01\ -\ ECS\ -\ DocumentDB\ -\ ALB\ -\ S3
   ```

2. **Backend Development**
   ```bash
   cd backend
   npm install
   npm run dev
   ```

3. **Frontend Development**
   ```bash
   cd frontend
   npm install
   npm run dev
   ```

4. **Local Stack with Docker Compose**
   ```bash
   docker compose up -d
   ```

## ☁️ AWS Deployment

### Infrastructure Components

#### Networking
- **VPC** with public and private subnets across multiple AZs
- **Internet Gateway** for public internet access
- **NAT Gateway** for private subnet internet access
- **Security Groups** with least-privilege access rules

#### Compute & Storage
- **ECS Fargate Cluster** for serverless container hosting
- **Application Load Balancer** with health checks
- **DocumentDB Cluster** with encryption and backup
- **S3 Bucket** for static website hosting

#### Security & Monitoring
- **IAM Roles** with minimal required permissions
- **VPC Endpoints** for private AWS service access
- **SSM Parameter Store** for secure configuration
- **CloudWatch** for logging and monitoring

### Deployment Steps

1. **Set up Terraform Backend** (one-time setup)
   ```bash
   ./setup-terraform-backend.sh
   ```

2. **Configure GitHub Secrets** (see Configuration section below)

3. **Deploy via GitHub Actions**
   - Push code to main branch
   - GitHub Actions automatically handles all deployment

## 🔧 Configuration

### Environment Variables
- `AWS_REGION`: AWS deployment region
- `DOCDB_MASTER_USERNAME`: DocumentDB admin username
- `DOCDB_MASTER_PASSWORD`: DocumentDB admin password
- `CORS_ORIGIN`: Frontend URL for CORS configuration

### GitHub Secrets Required
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `TF_VAR_docdb_master_username`
- `TF_VAR_docdb_master_password`

## 📊 Monitoring & Observability

- **Health Checks**: ALB performs health checks on ECS tasks
- **CloudWatch Logs**: Centralized logging for all services
- **CloudWatch Metrics**: Performance and resource utilization
- **ECS Service Auto Scaling**: Based on CPU/memory utilization

## 🔒 Security Features

- **Private Subnets**: Backend services isolated from internet
- **Security Groups**: Restrictive inbound/outbound rules
- **VPC Endpoints**: Private connectivity to AWS services
- **Encryption**: DocumentDB encrypted at rest and in transit
- **IAM Roles**: Least privilege access principles

## 💰 Cost Optimization

- **Fargate Spot**: Consider for non-production workloads
- **DocumentDB**: Right-sized instance types
- **S3**: Lifecycle policies for old objects
- **CloudWatch**: Log retention policies

## 🚦 Getting Started

1. Fork this repository
2. Configure GitHub secrets
3. Push to main branch to trigger deployment
4. Monitor GitHub Actions for deployment status
5. Access your application via ALB DNS name

## 📝 API Endpoints

- `GET /health` - Health check endpoint
- `GET /api/products` - List all products
- `POST /api/products` - Create new product
- `PUT /api/products/:id` - Update product
- `DELETE /api/products/:id` - Delete product

## 🤝 Contributing

1. Create feature branch
2. Make changes
3. Test locally with Docker Compose
4. Submit pull request
5. CI/CD will validate and deploy

## 📄 License

This project is licensed under the MIT License.

---

**Note**: This is a hands-on learning project demonstrating AWS cloud architecture patterns and modern DevOps practices.