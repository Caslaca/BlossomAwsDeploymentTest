# Use the official PostgreSQL image as the base image
FROM postgres

# Install necessary tools and dependencies for AWS SSM
RUN apt-get update && apt-get install -y \
    amazon-ssm-agent \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install the amazon-ecs-exec-checker (optional but recommended for debugging)
RUN curl -o /usr/local/bin/amazon-ecs-exec-checker \
    https://amazon-ecs-exec-checker.s3.amazonaws.com/amazon-ecs-exec-checker-linux-amd64 \
    && chmod +x /usr/local/bin/amazon-ecs-exec-checker

