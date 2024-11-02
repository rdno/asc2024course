FROM alpine:latest
# Based on: https://github.com/drillan/docker-alpine-jupyterlab
ARG NB_USER
ARG NB_UID
ENV USER=${NB_USER}
ENV HOME=/home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

RUN apk update \
&& apk add \
    ca-certificates \
    libstdc++ \
    libgfortran \
    openmpi \
    python3 \
    py3-pip \
    proj-util geos git \
    hdf5 \
    hdf5-dev \
&& apk add --virtual=build_dependencies \
    cmake \
    gcc \
    g++ \
    gfortran \
    make \
    musl-dev \
    openmpi-dev \
    linux-headers \
    python3-dev \
    cython \
    geos-dev \
    proj-dev \
&& ln -s /usr/include/locale.h /usr/include/xlocale.h \
&& python3 -m pip --no-cache-dir install --break-system-packages \
    numpy==1.26.4 \
    scipy \
    matplotlib \
    psutil \
    obspy \
    cartopy \
    jupyter \
    jupyterlab \
    pandas \
    tqdm \
    ipympl \
    pyyaml \
    pyasdf \
    pypdf \
&& cd ${HOME} \
&& git clone --branch devel --depth=1 https://github.com/adjtomo/pyatoa.git \
&& cd pyatoa \
&& pip install --break-system-packages -v -e . \
&& cd .. \
&& git clone --branch devel --depth=1 https://github.com/adjtomo/seisflows.git \
&& cd seisflows \
&& pip install --break-system-packages -v -e . \
&& cd /

ADD docker/clean_specfem2d_repo.sh /bin/clean_specfem2d_repo.sh

RUN git clone --branch devel --depth=1 https://github.com/specfem/specfem2d \
&& cd specfem2d \
&& ./configure FC=gfortran CC=gcc CXX=mpicxx MPIFC=mpif90 --with-mpi \
&& make all \
&& sh /bin/clean_specfem2d_repo.sh \
&& rm /bin/clean_specfem2d_repo.sh

RUN apk del --purge -r build_dependencies \
&& rm -rf /var/cache/apk/*

ENV OMPI_MCA_plm="^rsh" \
    OMPI_ALLOW_RUN_AS_ROOT=1 \
    OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1


ADD docker/Welcome.ipynb ${HOME}/Welcome.ipynb
RUN echo "#!/bin/sh" >> /bin/init && echo "/usr/bin/jupyter lab --allow-root --no-browser --ip=0.0.0.0 --notebook-dir=${HOME}" >> /bin/init && chmod +x /bin/init
SHELL ["/bin/sh", "-c"]
EXPOSE 8888
WORKDIR ${HOME}
