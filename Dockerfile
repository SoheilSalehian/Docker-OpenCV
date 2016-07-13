FROM ubuntu:14.04

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y unzip wget build-essential \
		cmake git pkg-config libswscale-dev \
		python3-dev python3-numpy \
		libtbb2 libtbb-dev libjpeg-dev libgtk2.0-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev opencl-dev xvfb \
    vim
		
RUN cd && wget -Nc http://ffmpeg.org/releases/ffmpeg-3.1.1.tar.bz2 \
    && bzip2 -d ffmpeg-3.1.1.tar.bz2 && tar -xvf ffmpeg-3.1.1.tar \
    && cd ffmpeg-3.1.1/ && ./configure --enable-avresample --enable-pic \
    --disable-doc --disable-static --enable-shared --enable-gpl \ 
    --enable-nonfree --enable-postproc --disable-yasm \
    && make && sudo make install \
    && cd && rm -rf ffmpeg-3.1.1 && rm ffmpeg-3.1.1.tar

RUN cd && wget https://github.com/SoheilSalehian/opencv/archive/memory-snapshots.zip \ 
	&& unzip memory-snapshots.zip \
	&& cd opencv-memory-snapshots && mkdir build && cd build \
	&& cmake -D WITH_FFMPEG=OFF -D ENABLE_MEMORY_SNAPSHOTS=YES -D BUILD_SHARED_LIBS=OFF -D USE_IPP=ON .. && make -j2 && make install \
	&& cd && rm -rf opencv-memory-snapshots && rm memory-snapshots.zip

# TODO: Add these as part of the container setup
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
# Xvfb :1 -screen 0 1024x768x16 &> xvfb.log  &
