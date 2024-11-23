FROM alpine:3.20.3

ARG ROOT_PASSWORD
ENV ROOT_PASSWORD=${ROOT_PASSWORD}

# Install OpenSSH
RUN apk update && apk add --no-cache openssh python3 \
  && mkdir ~/.ssh \
  && ssh-keygen -A \
  && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
  && echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

# Copy script 
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

# Espone la porta 22 per SSH
EXPOSE 22

# Execute command
ENTRYPOINT ["/usr/local/bin/startup.sh"]
