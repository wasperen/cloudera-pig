#!/bin/bash
for cdh in 5.7.0 5.8.3; do
	sed "s/#CDH_VER#/$cdh/g" Dockerfile.cdh-template >Dockerfile.cdh-$cdh;
	docker build --tag "base-cdh-$cdh" --file Dockerfile.cdh-$cdh .;

	for pig in 0.15 0.16; do
		sed "s/#CDH_VER#/$cdh/g" Dockerfile.pig-template | sed "s/#PIG_VER#/$pig/g" >Dockerfile.cdh-$cdh.pig-$pig;
		docker build --tag "base-cdh-$cdh-pig-$pig" --file Dockerfile.cdh-$cdh.pig-$pig .;
		docker volume create opt-cdh-$cdh-pig-$pig;
		docker run -d --rm -v opt-cdh-$cdh-pig-$pig:/opt/pig-$pig base-cdh-$cdh-pig-$pig /bin/true;
	done
done
