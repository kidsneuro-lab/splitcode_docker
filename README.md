# Splitcode Docker Container

This repository provides a Docker container for [splitcode](https://github.com/pachterlab/splitcode) with a statically compiled binary on Alpine Linux. Please view the release notes to check which release of splitcode the image is built against. Please refer to [splitcode docs](https://splitcode.readthedocs.io/en/latest/) for how to use splitcode.

## Prebuilt Docker Image

A prebuilt image is now available on Docker Hub. You can pull it with:

```bash
docker pull schnknc/splitcode:latest
```
For more tags and details, visit the Docker Hub tags page.

**Usage**

To run the container and display splitcode’s help message, use:
```bash
docker run --rm schnknc/splitcode:latest --help
```
Pass any additional arguments as needed.

**Overview**
	•	Multi-stage Build:
The Dockerfile uses a builder stage (with preinstalled build tools) to compile a statically linked splitcode binary, and a minimal Alpine Linux stage for the final image.

## License

This project is licensed under the BSD-2 License (identical to splitcode repo).

