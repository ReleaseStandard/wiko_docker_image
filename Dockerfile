FROM ubuntu:18.04
ENV TZ=Europe/Minsk

RUN apt-get update && apt-get install wget tar nano make\
	git gnupg flex bison gperf build-essential \
	zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev \
	libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 \
	libgl1-mesa-dev g++-multilib mingw32 tofrodos \
	python-markdown libxml2-utils xsltproc zlib1g-dev:i386 \
	openjdk-8-jdk lunch

RUN     mkdir /toolchain && \
	wget -O aarch64-linux-android-4.9-master.tar.gz 'https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/+archive/master.tar.gz' && \
	tar -zxvf aarch64-linux-android-4.9-master.tar.gz -C /toolchain

RUN	wget -O /bin/repo 'https://storage.googleapis.com/git-repo-downloads/repo' && chmod a+x /bin/repo

RUN	mkdir /WORKING_DIRECTORY && cd /WORKING_DIRECTORY && git config --global user.name "Your Name" && git config --global user.email "you@example.com" && repo init -u https://android.googlesource.com/platform/manifest -b android-7.1.0_r1 && repo sync
