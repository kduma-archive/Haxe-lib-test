#!/bin/zsh

find bin/ ! -name '.gitignore' -delete

docker build . -t kduma-docker/haxe-compiler


docker run --rm --volume $(pwd):/usr/src/app kduma-docker/haxe-compiler haxe build-php.hxml  --verbose
docker run --rm --volume $(pwd):/usr/src/app kduma-docker/haxe-compiler haxe build-js.hxml  --verbose
docker run --rm --volume $(pwd):/usr/src/app kduma-docker/haxe-compiler haxe build-java.hxml  --verbose
docker run --rm --volume $(pwd):/usr/src/app kduma-docker/haxe-compiler haxe build-cs.hxml  --verbose
docker run --rm --volume $(pwd):/usr/src/app kduma-docker/haxe-compiler haxe build-python.hxml  --verbose

