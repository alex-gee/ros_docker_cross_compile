FROM ubuntu:xenial
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y \
    tzdata \
    python-rosdep \
    python-rosinstall-generator \
    python-wstool \
    python-rosinstall \
    build-essential \
    python-catkin-pkg \
    python-pip \
    wget \
    git \
    cmake
RUN apt-get install -y libc6-armel-cross \
    libc6-dev-armel-cross \
    binutils-arm-linux-gnueabi \
    libncurses5-dev \
    gcc-arm-linux-gnueabihf \
    g++-arm-linux-gnueabihf

# Boost
RUN wget https://sourceforge.net/projects/boost/files/boost/1.58.0/boost_1_58_0.tar.bz2 -q && \
    echo "using gcc : arm : arm-linux-gnueabihf-g++ ;" > /root/user-config.jam && \
    tar xjf boost_1_58_0.tar.bz2 && \
    cd /boost_1_58_0 && \
    ./bootstrap.sh && \
    ./b2 --with-atomic --with-program_options --with-chrono --with-date_time --with-filesystem --with-regex --with-serialization --with-thread --with-system --no-samples --no-tests toolset=gcc-arm link=static cxxflags=-fPIC

# Load cross compile toolchain
ADD ./config /config

# console-bridge
RUN mkdir cb_ws && \
    cd cb_ws && \
    git clone https://github.com/ros/console_bridge && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr ../console_bridge -DCMAKE_TOOLCHAIN_FILE=/config/rostoolchain.cmake && \
    make install

# ROS
RUN pip install -U catkin_pkg
RUN rosdep init && rosdep update
RUN mkdir /ros_catkin_ws
WORKDIR /ros_catkin_ws
RUN rosinstall_generator roscpp_core --rosdistro kinetic --deps --tar > kinetic-roscpp_core.rosinstall && \
    cat kinetic-roscpp_core.rosinstall && \
    wstool init -j8 src kinetic-roscpp_core.rosinstall && \
    rosdep install --from-paths src --ignore-src --rosdistro kinetic -y --as-root apt:false