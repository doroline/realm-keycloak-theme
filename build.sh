#!/bin/sh
BUILD_DIR=./target
JAR_FILE="realm-theme.jar"

rm -f $BUILD_DIR/$JAR_FILE
mkdir -p $BUILD_DIR

docker run \
	--rm \
	-v $BUILD_DIR:/target \
	-v .:/app/theme \
	-u `stat -c "%u:%g" $BUILD_DIR` \
	openjdk:21-slim \
	jar cvf /target/realm-theme.jar -C /app ./theme/realm-theme -C /app/theme ./META-INF

echo Build completata: $BUILD_DIR/$JAR_FILE
