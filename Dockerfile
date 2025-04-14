# Use minimal base image
FROM python:3.9-alpine

# Create a non-root user
RUN adduser -D appuser


# Set working directory
WORKDIR /app

COPY app/main.py .

# Switch to non-root user
USER appuser

# Expose port and run app
EXPOSE 8080
CMD ["python", "main.py"]
