FROM node
MAINTAINER Rex Tsai <rex.cc.tsai@gmail.com>

# Usual update and install
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y supervisor

# Get slack-irc
RUN npm install -g slack-irc

# Add configurations
ADD slack-irc/config.json.sample slack-irc/config.json.sample

# Add supervisor configs
ADD supervisord.conf supervisord.conf

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["-n", "-c", "/supervisord.conf"]
ENTRYPOINT ["/usr/bin/supervisord"]
