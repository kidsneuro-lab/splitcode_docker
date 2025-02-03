# Stage 1: Build splitcode statically
FROM gcc:14.2.0 AS builder

# Install cmake
RUN apt-get update && apt-get install -y cmake

# Set working directory
WORKDIR /tmp

# Download and extract the splitcode source tarball
RUN wget https://github.com/pachterlab/splitcode/archive/refs/tags/v0.31.2.tar.gz && \
    tar -xzf v0.31.2.tar.gz

# Change into the source directory.
# (The extracted folder is usually named "splitcode-0.31.2". Adjust if necessary.)
WORKDIR /tmp/splitcode-0.31.2

# Create a build directory, configure with CMake to produce a static binary, and compile.
RUN mkdir build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-static" && \
    make

# Stage 2: Create the final Alpine image with the statically compiled binary
FROM alpine:latest

# Copy the statically compiled binary from the builder stage
COPY --from=builder /tmp/splitcode-0.31.2/build/src/splitcode /usr/local/bin/splitcode

# Set the entrypoint so that running the container executes splitcode
ENTRYPOINT ["/usr/local/bin/splitcode"]
CMD ["--help"]