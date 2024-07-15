#!/bin/bash

# Define an array of repository URLs
repos=(
    #tiledesk
    # "https://github.com/Tiledesk/tiledesk.git"
    "https://github.com/KarzounApps/octobot-docker-dev.git"
    "https://github.com/KarzounApps/octobot-server.git"
    "https://github.com/KarzounApps/octobot-dashboard.git"
    "https://github.com/KarzounApps/octobot-llm.git"
    "https://github.com/KarzounApps/octobot-design-studio.git"
    "https://github.com/KarzounApps/octobot-chat21-ionic.git"
    "https://github.com/KarzounApps/octobot-chat21-ionic8.git"
    "https://github.com/KarzounApps/octobot-chat21-web-widget.git"
    "https://github.com/KarzounApps/octobot-nginx-proxy.git"
    #chat21
    "https://github.com/KarzounApps/octobot-chat21-http-server.git"
    "https://github.com/KarzounApps/octobot-chat21-server.git"
    "https://github.com/KarzounApps/octobot-chat21-rabbitmq.git"
)

# Directory to clone repositories into
clone_dir="octobot"

# Create the directory if it doesn't exist
mkdir -p "$clone_dir"

# Change to the directory
cd "$clone_dir" || exit

# Function to clone a repository and check out the main branch
clone_main_branch() {
  repo_url=$1
  repo_name=$(basename -s .git "$repo_url")

  # Clone the repository
  git clone "$repo_url"

  # Change to the repository directory
  cd "$repo_name" || exit

  # Checkout the main branch
  git checkout main

  # Return to the parent directory
  cd ..
}

# Iterate over the array and clone each repository
for repo in "${repos[@]}"; do
    echo "Cloning $repo..."
    clone_main_branch "$repo"
done

# Copy the docker-compose.yml file
docker_compose_src="octobot-docker-dev/docker-compose.yml"
docker_compose_dest="../docker-compose.yml"

if [ -f "$docker_compose_src" ]; then
    cp "$docker_compose_src" "$docker_compose_dest"
    echo "Copied docker-compose.yml to the current directory as docker-compose.yml"
else
    echo "docker-compose.yml not found in octobot repository"
fi

# Remove the octobot-docker-dev directory
rm -rf octobot-docker-dev

# Change to the parent directory
cd ..

# Function to build Docker images
build_images() {
  echo "Building images..."

  # Build octobot-dashboard
  cd ./octobot/octobot-dashboard
  docker build -t octobot-dashboard .
  cd ../..

  # Build octobot-design-studio
  cd ./octobot/octobot-design-studio
  docker build -t octobot-cds .
  cd ../..

  # Build octobot-chat21-ionic
  cd ./octobot/octobot-chat21-ionic
  docker build -t octobot-chat21-ionic .
  cd ../..

  # Build octobot-chat21-ionic8
  cd ./octobot/octobot-chat21-ionic8
  docker build -t octobot-chat21-ionic8 .
  cd ../..

  # Build octobot-nginx-proxy
  cd ./octobot/octobot-nginx-proxy
  docker build -t octobot-nginx-proxy .
  cd ../..

  # Build octobot-server
  cd ./octobot/octobot-server
  docker build -t octobot-server .
  cd ../..

  # Build octobot-chat21-http-server
  cd ./octobot/octobot-chat21-http-server
  docker build -t octobot-chat21-httpserver .
  cd ../..

  # Build octobot-chat21-server
  cd ./octobot/octobot-chat21-server
  docker build -t octobot-chat21-server .
  cd ../..

  # Build octobot-rabbitmq
  cd ./octobot/octobot-chat21-rabbitmq
  docker build -t octobot-rabbitmq .
  cd ../..

  # Build octobot-llm
  cd ./octobot/octobot-llm
  docker build -t octobot-llm .
  cd ../..

  echo "Images built successfully."
}

# Function to start Docker containers
start_containers() {
  echo "Starting containers..."
  docker-compose up -d
  echo "Containers started successfully."
}

# Execute functions
build_images
start_containers
