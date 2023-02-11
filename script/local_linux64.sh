# sh -c "export BUILD_TYPE=Debug && ./local_linux64.sh"
BUILD_PATH=./../build_linux64
CMAKELISTS_PATH=./../
CORE_NUM=$(cat /proc/cpuinfo | grep -c ^processor)
TARGETS=$@

# config env
CC=gcc
CXX=g++

# config and build project
echo "BUILD_TYPE=$BUILD_TYPE"
cmake -B $BUILD_PATH -S $CMAKELISTS_PATH \
    -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
    -DCMAKE_C_COMPILER=$CC -DCMAKE_CXX_COMPILER=$CXX \
    -DCMAKE_C_FLAGS=-m64 -DCMAKE_CXX_FLAGS=-m64
make -C $BUILD_PATH $TARGETS -j$CORE_NUM