#!/bin/sh
xhost +local:user
docker run --rm \
    -it \
    --net host \
    --env CLIENT_IP=192.168.1.239 \
    --env MASTER_IP=192.168.1.239 \
    -e DISPLAY=$DISPLAY \
    --name ros_book_08 \
    -v $HOME/.Xauthority:/root/.Xauthority \
    -v "$(pwd)/catkin_ws:/home/catkin_ws" \
    ros_book_08:latest
    #--user=$USER \
    #--env="DISPLAY" \
    #--volume="/etc/group:/etc/group:ro" \
    #--volume="/etc/passwd:/etc/passwd:ro" \
    #--volume="/etc/shadow:/etc/shadow:ro" \
    #--volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    #--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
