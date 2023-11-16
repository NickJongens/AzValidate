# Use the official PowerShell Core runtime as a base image
FROM mcr.microsoft.com/powershell:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the Azure Function App files to the container
COPY . .

# Install required modules
RUN pwsh -Command "Install-Module -Name PartnerCenter -Force -AllowClobber -Scope Global -RequiredVersion 3.*" && \
    pwsh -Command "Install-Module -Name MSOnline -Force -AllowClobber -Scope Global -RequiredVersion 1.*"

# Expose the port your function app will run on (if applicable)
# EXPOSE 80

# Specify the command to run your function app
CMD [ "pwsh", "./run.ps1" ]
