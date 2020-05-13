#!/bin/sh
# exit when any command fails
set -e

cd $(dirname "$0")
git submodule update --init

DB_CREATOR_DIR=bob_robotics/tools/ant_world_db_creator
DB_CREATOR=$DB_CREATOR_DIR/ant_world_db_creator
if [ ! -f "$DB_CREATOR_DIR/build/Makefile" ]; then
    pushd "$DB_CREATOR_DIR"
    mkdir build || true
    cd build
    cmake ..
    popd
fi
make -C "$DB_CREATOR_DIR/build" -j`nproc`

$DB_CREATOR
