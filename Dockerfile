# Define global args
ARG FUNCTION_DIR="/var/task/"
ARG RUNTIME_VERSION="3.9"
ARG DISTRO_VERSION="3.12"


# Stage 1 - bundle base image + runtime
# Grab a fresh copy of the image and install GCC
FROM public.ecr.aws/lambda/python:${RUNTIME_VERSION} AS base-image
WORKDIR ${FUNCTION_DIR}
COPY . .

RUN python${RUNTIME_VERSION} -m pip install --upgrade pip
RUN python${RUNTIME_VERSION} -m pip install -r requirements.txt

CMD [ "app.handler" ]
