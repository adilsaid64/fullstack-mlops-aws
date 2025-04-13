# 3️⃣ Local Application Deployment With Minikube

This guide walks you through deploying services within the k8s folder to a **local Minikube cluster** using `kubectl`

Running your applications on a local Minikube cluster is ideal for development, testing, and experimentation without incurring the cost and overhead of managing a full EKS (Elastic Kubernetes Service) cluster on AWS. It allows you to iterate quickly, debug locally, and simulate your production environment from your PC.

---

## 📁 K8s Structure

Kubernetes manifests are organized using [**Kustomize**](https://kustomize.io/), with a separation between **base configs** and **environment specific overlays**:

```
k8s/
├── Service-App-1/
│   ├── base/               # Generic deployment/services for the application
│   └── overlays/
│       └── dev/            # Environment specific (e.g. dev)
├── Service-App-2/
│   ├── base/
│   └── overlays/
│       └── dev/
```

Each service uses a `kustomization.yaml` to patch configurations by environment.

---

## 🚀 Deployment

### Start Minikube

```bash
minikube start
```

---

### Deploy MLflow

```bash
kubectl apply -k k8s/mlflow/overlays/dev
```

---

### Deploy ZenML

```bash
kubectl apply -k k8s/zenml/overlays/dev
```

---

### Check Deployment Status

```bash
kubectl get pods -A
kubectl get deployments -A
kubectl get svc -A
```

You should see pods, services, and deployments for both MLflow and ZenML running.

---

## 🌐 Accessing Services

To access services locally:

### Port Forward (Quick way)

```bash
kubectl port-forward svc/mlflow 5000:5000
kubectl port-forward svc/zenml 8080:8080
```

Now you can visit:
- **MLflow UI** → [http://localhost:5000](http://localhost:5000)
- **ZenML UI** → [http://localhost:8080](http://localhost:8080)
