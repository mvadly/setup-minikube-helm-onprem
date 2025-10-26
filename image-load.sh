#!/bin/bash

image=""
driver=""

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --image)
      image="$2"
      shift 2
      ;;
    --driver)
      driver="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1"
      shift
      ;;
  esac
done

# Validate inputs
if [[ -z "$image" || -z "$driver" ]]; then
  echo "Usage: $0 --image <image-name> --driver <docker|podman|...>"
  exit 1
fi

# Save and load image
echo "$image saving to image.tar..."
$driver save -o image.tar "$image"

echo "$image loading to minikube..."
minikube image load image.tar

echo "Removing image.tar..."
rm -f image.tar