FROM rust:latest

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends build-essential cmake && rm -rf /var/lib/apt/lists/*

ARG protoc_ver=3.13.0

WORKDIR /usr
RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v${protoc_ver}/protoc-${protoc_ver}-linux-x86_64.zip && unzip protoc-${protoc_ver}-linux-x86_64.zip && rm protoc-${protoc_ver}-linux-x86_64.zip
RUN rustup component add clippy  && cargo install grcov # rustfmt
