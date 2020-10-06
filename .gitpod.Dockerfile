FROM gitpod/workspace-full-vnc

# Install Nix
RUN curl -L https://nixos.org/nix/install | sh
RUN echo ". ~/.nix-profile/etc/profile.d/nix.sh" >> ~/.bashrc

# Install All Required Dependencies
ENV NIXPKGS_ALLOW_UNFREE=1

# Chromium + Driver
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.chromium
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.chromedriver

# Firfox + Driver
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.firefox
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.geckodriver

# PostgreSQL
RUN ~/.nix-profile/bin/nix-env -iA nixpkgs.postgresql

# Clean Up
RUN ~/.nix-profile/bin/nix-collect-garbage
RUN ~/.nix-profile/bin/nix-store --optimize
