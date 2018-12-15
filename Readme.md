# Cross compile for armhf
Currently only compiles roscpp

## Build the container
docker build . -t ros_kinetic_cross_armhf

## Build
docker run ros_kinetic_cross_armhf /ros_catkin_ws/src/catkin/bin/catkin_make_isolated --install -DCMAKE_TOOLCHAIN_FILE=/config/rostoolchain.cmake
