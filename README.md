# 🐧 Alpine-based MinIO Server

This repository contains a **lightweight, Alpine-based Docker image for MinIO**, along with a simple `docker-compose.yml` file for quick setup.

---

## 🚀 Features

- Based on **Alpine Linux** (small footprint)
- Lightweight and fast startup
- Supports **standalone mode** (ideal for testing or single-node deployments)
- Exposes **S3** and **Console** ports
- Persistent storage via Docker volumes
- Easy configuration via environment variables

---

## 🧰 Prerequisites

- Docker (v20+)
- Docker Compose (v2+)

---

## 🐳 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/oxnul/minio.git
cd minio/build
```

### 2. Build the Image

```bash
docker build -t <Your image name>:latest .
```

### 3. Run Using Docker Compose

```bash
docker-compose up -d
```

---

## ⚙️ Configuration

Edit the `docker-compose.yml` file to set your own credentials and ports.
#### *You can also use pre build image.*
```yaml
services:
   minio:
     image: oxnul/minio:0.1
     container_name: minio
     network_mode: host
     restart: always
     command: "/opt/minio server /data"
     environment:
       MINIO_ROOT_USER: minioadmin
       MINIO_ROOT_PASSWORD: minioadmin123
     volumes:
      - $PWD/data/:/data/
```

---

## 📂 Accessing MinIO

Once the container is running, open your browser and visit:

- **Console UI:** [http://localhost:9000](http://localhost:46735)
- **S3 Endpoint:** [http://localhost:46735](http://localhost:9000)

Default credentials:
```
Username: minioadmin
Password: minioadmin123
```

---

## 🧾 Environment Variables

| Variable | Description | Default |
|-----------|--------------|----------|
| `MINIO_ROOT_USER` | Root access key (username) | `minioadmin` |
| `MINIO_ROOT_PASSWORD` | Root secret key (password) | `minioadmin123` |
| `MINIO_VOLUMES` | Storage path inside container | `/data` |

---

## 🪣 Example Usage with `mc` (MinIO Client)

Install the MinIO client (mc):

```bash
curl -O https://dl.min.io/client/mc/release/linux-amd64/mc
chmod +x mc
sudo mv mc /usr/local/bin/
```

Add your local server:

```bash
mc alias set local http://localhost:9000 minioadmin minioadmin123
```

Create a new bucket:

```bash
mc mb local/mybucket
```

---

## 🧹 Cleanup

To stop and remove all containers and volumes:

```bash
docker-compose down -v
```

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

**Enjoy lightweight S3 storage on Alpine! 🐧**

