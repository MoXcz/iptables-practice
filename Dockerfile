FROM nginx:latest

# Don't install "recommended" dependencies (reduce total size of the image)
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker

# Remove prompt dialogs from installed packages
RUN DEBIAN_FRONTEND=noninteractive \
  apt update \
  # Necessary to run commands with -y flag to answer "yes" during the prompt
  && apt install -y iptables \
  # Remove unnecessary cache from updated package lists
  && rm -rf /var/lib/apt/lists/*

