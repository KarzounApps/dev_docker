# Project Initialization Guide

Welcome to the Octobot project! This guide will help you set up your development environment quickly and efficiently.

## Prerequisites

Ensure you have the following installed on your machine:

- Git
- Docker
- Docker Compose

## Initial Setup

1. **Clone the Repository:**

   - Clone the main repository where the initialization script is located.
```git clone https://github.com/KarzounApps/octobot-docker-dev.git```
2. **Navigate to the Project Directory:**

- Change to the directory where the repository was cloned

```cd octobot-docker-dev```

3. **Run the Initialization Script:**

- Execute the `init_project.sh` script to set up the project. This script will:

  - Clone all necessary repositories.
  - Copy the `docker-compose.yml` file to the root directory.
  - Build Docker images for each service.
  - Start the Docker containers.

  `./init_project.sh`

## Repository Structure

The project consists of several repositories, each serving a different component of the Octobot system. Here’s a brief overview:

- **Octobot Dashboard** : [https://github.com/KarzounApps/octobot-dashboard.git]()
- **Octobot Design Studio** : [https://github.com/KarzounApps/octobot-design-studio.git]()
- **Octobot Server** : [https://github.com/KarzounApps/octobot-server.git]()
- **Octobot LLM** : [https://github.com/KarzounApps/octobot-llm.git]()
- **Octobot Chat21 Ionic** : [https://github.com/KarzounApps/octobot-chat21-ionic.git]()
- **Octobot Chat21 Ionic 8** : [https://github.com/KarzounApps/octobot-chat21-ionic8.git]()
- **Octobot Chat21 Web Widget**: [https://github.com/KarzounApps/octobot-chat21-web-widget.git]()
- **Octobot Nginx Proxy**: [https://github.com/KarzounApps/octobot-nginx-proxy.git]()
- **Octobot Chat21 HTTP Server:** [https://github.com/KarzounApps/octobot-chat21-http-server.git]()
- **Octobot Chat21 Server** : [https://github.com/KarzounApps/octobot-chat21-server.git]()
- **Octobot Chat21 RabbitMQ**: [https://github.com/KarzounApps/octobot-chat21-rabbitmq.git]()

## Docker Setup

The project uses Docker and Docker Compose for containerization and orchestration. The `docker-compose.yml` file defines the services, volumes, and environment variables needed to run the application.

## Building Docker Images

The initialization script will build Docker images for each service. If you need to rebuild any image, you can do so manually by navigating to the respective directory and running the Docker build command.

For example, to rebuild the `octobot-dashboard` image:

```cd octobot-dashboard```

```docker build -t octobot-dashboard .```

## Starting Docker Containers

To start all the services, use the following command:

```docker-compose up -d```

This will start all the containers defined in the `docker-compose.yml` file in detached mode.

## Stopping Docker Containers

To stop the running containers, use:

```docker-compose down```

## Troubleshooting

- **Docker Compose Issues** : Ensure that Docker and Docker Compose are installed correctly and that you have sufficient permissions.
- **Git Cloning Issues** : Verify the repository URLs and ensure you have access permissions.

## Conclusion

This guide should help you get your development environment up and running smoothly. If you encounter any issues or have any questions, feel free to reach out to the team for assistance. Happy coding!
