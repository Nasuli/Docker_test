FROM ubuntu:22.04
MAINTAINER Natalie Sukhikh

RUN apt-get update && apt-get install
COPY . /soft

RUN cd /soft \
    && tar -xjvf samtools-1.20.tar.bz2 && rm samtools-1.20.tar.bz2 \
    && tar -xjvf htslib-1.20.tar.bz2 && rm htslib-1.20.tar.bz2 \
    && tar -xjvf bcftools-1.20.tar.bz2 && rm bcftools-1.20.tar.bz2 \
    && tar -xzvf vcftools-0.1.16.tar.gz && rm vcftools-0.1.16.tar.gz \
    && tar -xzvf libdeflate-1.21.tar.gz && rm libdeflate-1.21.tar.gz \
    && tar -xzvf cmake-3.30.3.tar.gz && rm cmake-3.30.3.tar.gz

ENV SOFT /soft

WORKDIR soft/
