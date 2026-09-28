# Enterprise Cloud Architect
## Operational Manual

### Project
Secure Multi-Tier Web Application

### Application Stack
WordPress + MySQL

### Operating System
Ubuntu Server

### Container Platform
Docker and Docker Compose

### Security
UFW Firewall

### Automation
Bash Script + Cron

---

# 1. System Overview

This infrastructure consists of an Ubuntu Server virtual machine running Docker.

Docker Compose manages two application tiers:

1. WordPress web application
2. MySQL database

Persistent Docker volumes are used to protect application and database data.

# 2. Architecture

The infrastructure contains:

- Host computer
- Hypervisor
- Ubuntu Server VM
- UFW firewall
- Docker Engine
- WordPress container
- MySQL container
- Persistent volumes
- Automated backup system

# 3. Deployment

Deployment instructions will be documented based on the actual commands used during implementation.

# 4. Security Configuration

UFW is configured using a default-deny incoming policy.

Only required ports are permitted.

# 5. Backup and Recovery

The Bash automation script performs database backups.

Cron is used to schedule the backup operation.

# 6. Maintenance

Maintenance procedures include:

- Checking containers
- Checking Docker volumes
- Checking disk usage
- Checking firewall status
- Checking backup files

# 7. Disaster Recovery

The database backup can be restored using MySQL tools after recreating the required container environment.
