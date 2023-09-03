# New Show: Exploring Containers and Processes

## [Containers are just processes](https://securitylabs.datadoghq.com/articles/container-security-fundamentals-part-1/#containers-are-just-processes)

To comprehend containers, let's begin by recognizing that at their core, they are processes running on an operating system. Imagine them as applications that execute directly on the host.

### Check for Active Processes

```bash
podman ps -f name=nginx

Start a Podman Container
```bash
podman run -d nginx:1.23.1

Check Processes Again
```bash
podman ps -f name=nginx

Interacting with a container as a process
Now that we understand containers are processes, let's delve into how we can interact with them.
