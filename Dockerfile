FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

# Install apt dependencies
RUN apt-get update && apt-get install build-essential git help2man perl python3 make autoconf flex bison ccache libgoogle-perftools-dev numactl perl-doc libfl2 libfl-dev zlib1g zlib1g-dev mold g++-9 -y
# Use g++9 by default
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++-9

# Install latest Verilator
RUN bash -c "git clone https://github.com/verilator/verilator && cd verilator && autoconf && ./configure && make -j$(nproc) && make install"

# Copy the source code
COPY tb.cc /tb.cc
COPY top.sv /top.sv
COPY test_loop.sh /test_loop.sh

# Compile the source code
RUN verilator --cc --exe --build ../tb.cc top.sv -j $(nproc)
# RUN bash ./test_loop.sh
