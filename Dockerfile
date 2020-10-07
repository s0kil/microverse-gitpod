FROM gitpod/workspace-full-vnc

SHELL ["/bin/bash", "-c"]

# Install Nix
RUN curl -L https://nixos.org/nix/install | sh
RUN echo ". ~/.nix-profile/etc/profile.d/nix.sh" >> ~/.bashrc

ENV PATH="$PATH:$HOME/.nix-profile/bin"
ENV NIXPKGS_ALLOW_UNFREE=1

# Chrome + Chromium + Driver
RUN nix-env -iA nixpkgs.chromium
RUN nix-env -iA nixpkgs.chromedriver
RUN nix-env -iA nixpkgs.google-chrome
RUN sudo ln -s /home/gitpod/.nix-profile/bin/google-chrome-stable /usr/bin/google-chrome

# Firefox + Driver
RUN nix-env -iA nixpkgs.firefox
RUN nix-env -iA nixpkgs.geckodriver

# Common
RUN nix-env -iA nixpkgs.gmp
RUN nix-env -iA nixpkgs.mupdf
RUN nix-env -iA nixpkgs.redis
RUN nix-env -iA nixpkgs.sqlite
RUN nix-env -iA nixpkgs.ffmpeg
RUN nix-env -iA nixpkgs.libyaml
RUN nix-env -iA nixpkgs.libtool
RUN nix-env -iA nixpkgs.mysql80
RUN nix-env -iA nixpkgs.libxml2
RUN nix-env -iA nixpkgs.libxslt
RUN nix-env -iA nixpkgs.libsass
RUN nix-env -iA nixpkgs.gnupatch
RUN nix-env -iA nixpkgs.memcached
RUN nix-env -iA nixpkgs.postgresql
RUN nix-env -iA nixpkgs.imagemagick

# Ruby on Rails
RUN /bin/bash -c "source ~/.rvm/scripts/rvm \
  && gem update --system --no-document \
  && gem update --no-document \
  && gem install rubocop rails rspec --no-document \
  && rails new empty-rails && rm -rf empty-rails"

# HTML, CSS, JavaScript
RUN /bin/bash -c "npm update --global \
  && npm install hint lighthouse eslint stylelint --global"

# Editor Tools
RUN /bin/bash -c "source ~/.rvm/scripts/rvm \
  && gem install htmlbeautifier solargraph --no-document"

# Puppeteer Dependencies
# https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#chrome-headless-doesnt-launch-on-unix
RUN sudo apt-get update \
  && sudo apt-get install --yes gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget \
  && sudo apt-get clean \
  && sudo rm -rf /var/cache/apt/* /var/lib/apt/lists/* /tmp/*

# Clean Up
RUN ~/.nix-profile/bin/nix-collect-garbage
