SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_C_COMPILER /usr/bin/arm-linux-gnueabihf-gcc-5)
set(CMAKE_CXX_COMPILER /usr/bin/arm-linux-gnueabihf-g++-5)
SET(CMAKE_FIND_ROOT_PATH /usr/arm-linux-gnueabihf)

set(CMAKE_LIBRARY_PATH
  /usr/arm-linux-gnueabihf/
  /usr/arm-linux-gnueabihf/lib
  /usr/tinyxml2/lib/
  /python_ws/_install/lib/)

set(LD_LIBRARY_PATH ${LD_LIBRARY_PATH}
  /usr/arm-linux-gnueabihf/
  /usr/arm-linux-gnueabihf/lib
  /boost_1_58_0/stage/lib
  /usr/tinyxml2/lib/
  /python_ws/_install/lib/)

set(BOOST_ROOT "" CACHE PATH "/boost_1_58_0" )
set(BOOST_LIBRARYDIR "/boost_1_58_0/stage/lib")
set(Boost_NO_SYSTEM_PATHS on CACHE BOOL "Do not search system for Boost" )

set(TinyXML_LIBRARY "/usr/tinyxml2/lib/libtinyxml2.so")
set(TinyXML2_LIBRARY "/usr/tinyxml2/lib/libtinyxml2.so")

# TODO should not work
set(PYTHON_LIBRARY "/python_ws/_install/lib/libpython2.7.so")
set(PYTHON_INCLUDE_DIR "/python_ws/_install/include/python2.7")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE BOTH)