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

# Common
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.gmp
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.mupdf
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.redis
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.sqlite
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.ffmpeg
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.libyaml
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.libtool
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.mysql80
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.gnupatch
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.memcached
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.postgresql
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.imagemagick
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.libxml2
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.libxslt
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.libsass

# Development Tools
# RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.yarn
# RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.ruby_2_7
# RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.nodejs-14_x

# Ruby on Rails
RUN . ~/.rvm/scripts/rvm
RUN gem pristine --all
RUN gem update --no-document
#RUN ~/.nix-profile/bin/gem install psych --no-document --force
#RUN ~/.nix-profile/bin/gem install rails --no-document

# Update `.bashrc`
# RUN echo "PATH=\"$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH\""

# Clean Up
RUN ~/.nix-profile/bin/nix-collect-garbage
