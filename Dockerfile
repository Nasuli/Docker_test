FROM ubuntu:22.04
MAINTAINER Natalie Sukhikh

RUN apt-get update && apt-get install -y build-essential bzip2 zlib1g-dev libncurses5-dev libbz2-dev liblzma-dev pkg-config libcurl4-openssl-dev libssl-dev
COPY . /soft

RUN cd /soft \
    && tar -xjvf samtools-1.20.tar.bz2 && rm samtools-1.20.tar.bz2 \
    && tar -xjvf htslib-1.20.tar.bz2 && rm htslib-1.20.tar.bz2 \
    && tar -xjvf bcftools-1.20.tar.bz2 && rm bcftools-1.20.tar.bz2 \
    && tar -xzvf vcftools-0.1.16.tar.gz && rm vcftools-0.1.16.tar.gz \
    && tar -xzvf libdeflate-1.21.tar.gz && rm libdeflate-1.21.tar.gz \
    && tar -xzvf cmake-3.30.3.tar.gz && rm cmake-3.30.3.tar.gz

# PROGRAM NAME: samtools
# VERSION: 1.20
# RELEASE DATE: 2024-04-15	
RUN cd soft/samtools-1.20 \
    && ./configure \
    && make -j$(nproc) \
    && make install \
    && cd ../  \
    && rm -r samtools-1.20
ENV SAMTOOLS=/usr/local/bin/samtools

# PROGRAM NAME: htslib
# VERSION: 1.20 
# RELEASE DATE: 2024-04-15
RUN cd soft/htslib-1.20 \
    && ./configure  \
    && make -j$(nproc) \
    && make install \
    && cd ../  \
    && rm -r htslib-1.20

# PROGRAM NAME: bcftools
# VERSION: 1.20 
# RELEASE DATE: 2024-04-15
RUN cd soft/bcftools-1.20 \
    && ./configure  \
    && make -j$(nproc) \
    && make install \
    && cd ../  \
    && rm -r bcftools-1.20
ENV BCFTOOLS=/usr/local/bin/bcftools

# PROGRAM NAME: vcftools
# VERSION: 0.1.6
# RELEASE DATE: 2018-08-02
RUN cd soft/vcftools-0.1.16 \
    && ./configure  \
    && make -j$(nproc) \
    && make install \
    && cd ../  \
    && rm -r vcftools-0.1.16
ENV VCFTOOLS=/usr/local/bin/vcftools

# PROGRAM NAME: cmake
# VERSION: 3.30.3
# RELEASE DATE: 2024
RUN cd soft/cmake-3.30.3 \
    && ./configure  \
    && make -j$(nproc) \
    && make install \
    && cd ../  \
    && rm -r cmake-3.30.3
    
# PROGRAM NAME: libdeflate   
# VERSION: 1.21
# RELEASE DATE: 2024-08-04
RUN cd soft/libdeflate-1.21 \
    && cmake -B build && cmake --build build
ENV LIBDEFLATE=/soft/libdeflate-1.21/build/programs/libdeflate-gzip
ENV PATH=$PATH:/soft/libdeflate-1.21/build/programs

ENV SOFT /soft
RUN apt clean

## USER CONFIGURATION, containers should not run as root
RUN adduser --disabled-password --gecos '' user && chsh -s /bin/bash && mkdir -p /home/user
USER    user
WORKDIR /home/user

CMD ["bash"]

