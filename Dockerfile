# Define global args
ARG FUNCTION_DIR="/home/app/"
ARG RUNTIME_VERSION="3.9"
ARG DISTRO_VERSION="3.12"


# Stage 1 - bundle base image + runtime
# Grab a fresh copy of the image and install GCC
FROM public.ecr.aws/lambda/python:${RUNTIME_VERSION} AS base-image


# Stage 1 - Add app related dependencies
FROM base-image as build-image2
ARG FUNCTION_DIR
RUN mkdir -p ${FUNCTION_DIR}
WORKDIR ${FUNCTION_DIR}


# Copy over and install requirements
COPY requirements.txt .
RUN python${RUNTIME_VERSION} -m pip install --upgrade pip
RUN python${RUNTIME_VERSION} -m pip install -r requirements.txt --target ${FUNCTION_DIR}


# Stage 2 - final runtime image
FROM base-image
ARG FUNCTION_DIR
WORKDIR ${FUNCTION_DIR}
COPY . ${FUNCTION_DIR}
CMD [ "app.handler" ]