# deploy_docker_image
image for deployments


https://circleci.com/docs/2.0/custom-images/


`docker build . -t greenstonedevops/ubuntu_python3_nodejs`

## push to docker hub

`docker push greenstonedevops/ubuntu_python3_nodejs`


## run interactively

`docker run --rm -i -t greenstonedevops/ubuntu_python3_nodejs bash`

`cat /etc/issue`
Debian GNU/Linux 10 \n \l

`nodejs -v`
v12.18.3

`python3 -v`
Python 3.7.3 (default, Jul 25 2020, 13:03:44)
[GCC 8.3.0] on linux

`gcc -v`
gcc version 8.3.0 (Debian 8.3.0-6)

`find / -name package-lock.json`
/usr/local/lib/node_modules/npm/docs/package-lock.json
/usr/local/lib/node_modules/npm/node_modules/npm-normalize-package-bin/package-lock.json