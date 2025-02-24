# Use the existing Nanopolish image as the base
FROM bproject/nanopolish:v1


# Set the environment variable to make apt-get noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Install the required dependencies (including CMake, Python, and others)
RUN apt-get update && apt-get install -y \
    cmake \
    libhdf5-dev \
    libzstd-dev \
    && rm -rf /var/lib/apt/lists/*

# Clone the VBZ compression repository
RUN git clone --recursive https://github.com/nanoporetech/vbz_compression.git /opt/vbz_compression

# Configure and build the VBZ plugin without Conan
RUN cd /opt/vbz_compression && \
    git submodule update --init && \
    mkdir build && \
    cd build && \
    cmake -D CMAKE_BUILD_TYPE=Release -D ENABLE_CONAN=OFF -D ENABLE_PERF_TESTING=OFF -D ENABLE_PYTHON=OFF .. && \
    make -j

# Optional: Verify that the plugin was built and installed
RUN ls /opt/vbz_compression/build

# Set a default command to run (useful for debugging)
ENTRYPOINT ["/bin/bash"]