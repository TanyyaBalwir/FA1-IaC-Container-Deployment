# FA2 - DevOps CI/CD Pipeline and Kubernetes Deployment

## 1. Project Overview
This project demonstrates a DevOps workflow using Git, GitHub Actions, Docker, Kubernetes, Prometheus, and Grafana. It automates application testing and Docker image publishing and supports container deployment and monitoring.

## 2. Technologies Used
- **Git and GitHub:** Source code management
- **GitHub Actions:** CI/CD automation
- **Pytest:** Automated backend testing
- **Docker:** Containerization
- **Docker Hub:** Docker image registry
- **Kubernetes:** Container deployment and management
- **Prometheus:** Application metrics monitoring
- **Grafana:** Monitoring dashboards

## 3. CI/CD Pipeline
The GitHub Actions workflow runs when code is pushed to the main branch or a pull request is created. It runs backend tests and builds and publishes Docker images when the workflow conditions are met.

## 4. Docker Images
- Backend: `tanyyabalwir/fa2-backend:latest`
- Frontend: `tanyyabalwir/fa2-frontend:latest`

## 5. Kubernetes Deployment
The `k8s/` directory contains Kubernetes configuration files for the backend, frontend, Prometheus, and Grafana.

To apply the Kubernetes configurations in a cluster, run:

```bash
kubectl apply -f k8s/
```

Check the deployment status using:

```bash
kubectl get pods
kubectl get deployments
kubectl get services
```

## 6. Monitoring
Prometheus is configured to scrape its own metrics and the backend metrics endpoint at `/metrics`. Grafana is deployed to provide a dashboard interface for monitoring.

## 7. Testing and Verification
Verify the GitHub Actions workflow, Docker Hub images, Kubernetes pod status, Prometheus targets, and Grafana availability. Add screenshots of successful results as evidence after verifying them.

## 8. Conclusion
This project demonstrates how CI/CD automation, containerization, Kubernetes deployment, and monitoring can be combined in a DevOps workflow.
