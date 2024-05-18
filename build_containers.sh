#!/bin/bash

services=$(find . -maxdepth 1 -type d -not -path '.' -not -name '.*' -exec basename {} \;)

for service in $services; do
  echo "Building container for $service..."
  cd $service || { echo "Failed to enter directory $service"; exit 1; }
  podman build -t ghcr.io/b3n4kh/no_trainer_$service .
  podman push ghcr.io/b3n4kh/no_trainer_$service
  cd ..
  echo "Finished building container for $service"
done

echo "All containers have been built."

