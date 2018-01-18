# Run Lighthouse w/ Chrome Headless in a container
#
# Lighthouse is a tool that allows auditing, performance metrics, and best 
# practices for Progressive Web Apps. 


FROM debian:sid
LABEL name="lighthouse" \
      maintainer="Andreas Krivas" \
      version="2.1" \
      description="Lighthouse analyzes web apps and web pages, collecting performance metrics and insights on developer best practices."

# Install deps + add Chrome Stable + purge
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    --no-install-recommends \
  && curl -sSL https://deb.nodesource.com/setup_8.x | bash - \
  && curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update && apt-get install -y \
    google-chrome-stable \
    nodejs \
    --no-install-recommends \
  && npm --global install yarn \
  && apt-get purge --auto-remove -y curl gnupg \
  && rm -rf /var/lib/apt/lists/*

ARG CACHEBUST=1
RUN yarn global add lighthouse

# Add Chrome as a user
RUN groupadd -r chrome && useradd -r -g chrome -G audio,video chrome \
    && mkdir -p /home/chrome/reports && chown -R chrome:chrome /home/chrome

# Storing lighthouse reports
VOLUME /home/chrome/reports
WORKDIR /home/chrome/reports

# Run Chrome non-privileged
USER chrome

CMD ["/bin/bash"]
