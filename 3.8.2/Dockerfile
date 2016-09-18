FROM node:6
MAINTAINER Rex Tsai "https://about.me/chihchun"

# Slack irc version.
ENV SLACK_IRC_VERSION=3.8.2

# Usual update and install
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y supervisor

# Get slack-irc
RUN npm install -g slack-irc@${SLACK_IRC_VERSION}

# Add configurations
ADD slack-irc/config.json.sample slack-irc/config.json.sample
# Add supervisor configs
ADD supervisord.conf supervisord.conf

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD ["/usr/bin/supervisord", "-n", "-c", "/supervisord.conf"]
