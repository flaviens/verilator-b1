# Repo to reproduce a segfault in Verilator

We provide a Docker image for better reproducibility.

You can either pull the image or make it.

To pull the Docker image:

```bash
docker pull docker.io/ethcomsec/verilator-b1
```

To make the Docker image:
```bash
make build_docker
```

Then, to run the Docker image:
```bash
make run_docker
```
