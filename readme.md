# infra

This repository contains most of the configuration files for the self-hosted infrastructure and services used by my open source projects.

## Background

My aims are/were:

* minimise the time and effort required to maintain self-hosted services
* minimise the time I might have to spend to rebuild these systems [if something bad happens](https://www.reuters.com/article/us-france-ovh-fire-idUSKBN2B20NU)
* minimise cost

The current setup is quite simple:

![](diagram.svg)

* A single **Linux** (Debian) server configured using **Ansible**
* Applications run in **Docker** containers, managed with Docker Compose
* **nginx-proxy** container listens on :443, handles TLS termination, and proxies HTTP requests onto individial application containers
* Users connect via **Cloudflare** (caches and handles certificates), admins connect via a **Tailscale** VPN

## Build from scratch

In the worst case (server dies), everything can be rebuilt relatively quickly with the following steps: 

1. Provision a new Linux server (virtual machine) running Debian/Ubuntu
2. Clone this repository locally and run the `ansible/site.yml` Ansible playbook to setup the host machine
   * The playbook will setup users install some basic packages (including Docker), and configure automatic package security updates
   * The playbook also installs and configures Tailscale, and configures ufw to only allow SSH access using the VPN
3. Clone this repository onto the host machine and start bringing up the Docker Compose projects in `docker/`
   * Start with `nginx`, then move onto other directories
   * Some containers reference environment variables which need to be declared in `.env` files in each compose directory

Some of the apps are stateless, and others store data inside Docker volumes.

Important data/configs outside of Git are automatically backed up using restic to an object storage bucket. (see `backup` containers in docker-compose.yml files)

## License

MIT, have fun :)
