FROM gitpod/workspace-full-vnc

# Install Nix
RUN curl -L https://nixos.org/nix/install | sh
RUN echo ". ~/.nix-profile/etc/profile.d/nix.sh" >> ~/.bashrc

ENV NIXPKGS_ALLOW_UNFREE=1

# Chrome + Chromium + Driver
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.chromium
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.chromedriver
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.google-chrome

# Firefox + Driver
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.firefox
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.geckodriver

# General
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.ruby
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.yarn
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.nodejs

# Ruby on Rails
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.gmp
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.mupdf
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.redis
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.sqlite
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.ffmpeg
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.mysql80
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.gnupatch
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.memcached
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.postgresql
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.imagemagick
RUN ~/.nix-profile/bin/gem install rails

# Clean Up
RUN ~/.nix-profile/bin/nix-collect-garbage
