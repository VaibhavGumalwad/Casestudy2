#!/usr/bin/env bash
set -euo pipefail
IMAGE="vaibhavgumalwad/myapp:${GIT_COMMIT:-latest}"
echo "[INFO] Building Docker image: $IMAGE"
docker build -t "$IMAGE" .
echo "[INFO] Pushing Docker image to DockerHub..."
docker push "$IMAGE"
echo "[INFO] Docker image pushed successfully!"
