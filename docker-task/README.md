Building this Dockerfile will build an image with ubuntu:16.04 as base image.

The following packages is installed in it:

	- telnet
	- curl
	- ffmpeg

While running the docker image built using this file use the following command to launch with bash

	docker run -it <image_name> bash
