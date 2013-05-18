#!/bin/bash 

ver=$(node -v)
if [ "$ver" != "v0.8.14" ]; 
then
	wget http://nodejs.org/dist/v0.8.14/node-v0.8.14.tar.gz
	tar xvf node-v0.8.14.tar.gz
	cd node-v0.8.14
	./configure
	make
	sudo make install
	sudo ln -s /usr/local/bin/node /usr/bin/node
	cd ../
	rm -rf node-v0.8.14
	rm -f node-v0.8.14.tar
else
	echo 'node v0.8.14 installed'
fi