# alpine-ssh

Create a docker image with alpine and ssh

# Root Password

By default root password is 'admin'

You can set root password passing from environment.

Example:

docker run -d -e ROOT_PASSWORD=mypassword danelsan/alpine-ssh

