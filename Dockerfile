FROM osrf/ros:kinetic-desktop-full

##############################################################################
##                                  common                                  ##
##############################################################################
# install ifconfig & ping
RUN apt-get update && apt-get install -y \
    iproute2 \
    iputils-ping \
    net-tools \
    terminator \
    nautilus \
    gedit \
    usbutils

##############################################################################
##                              ros initialize                              ##
##############################################################################

RUN mkdir -p /home/catkin_ws/src

# for catkin build
RUN apt-get update && apt-get install -y \
    python-catkin-tools

##############################################################################
##                       catkin_wsがあればいらない                          ##
##############################################################################
#WORKDIR /home/catkin_ws
#COPY ./packages/catkin_build.bash /
#RUN	/bin/bash -c "source /opt/ros/melodic/setup.bash; catkin init" && \
    # echo "source /home/catkin_ws/devel/setup.bash" >> ~/.bashrc && \
    # echo "source /catkin_build.bash" >> ~/.bashrc

##############################################################################
##                            setting ros master                            ##
##############################################################################

# ROS MATERのIP設定 run.shで上書き可能
ENV CLIENT_IP 192.168.1.221
ENV MASTER_IP 192.168.1.200

RUN echo 'export ROS_IP=${CLIENT_IP}' >> ~/.bashrc && \
    echo 'export ROS_MASTER_URI=http://${MASTER_IP}:11311' >> ~/.bashrc
