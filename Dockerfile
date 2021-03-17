FROM rust:latest

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends build-essential cmake && rm -rf /var/lib/apt/lists/*

ARG protoc_ver=3.15.6

WORKDIR /usr

# Install protoc
RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v${protoc_ver}/protoc-${protoc_ver}-linux-x86_64.zip \
        && unzip protoc-${protoc_ver}-linux-x86_64.zip \
        && rm protoc-${protoc_ver}-linux-x86_64.zip

# And rust tools (clippy and grcov)
RUN rustup toolchain add nightly \
        && rustup component add --toolchain nightly clippy \
        && rustup component add clippy  \
        && cargo install grcov
