FROM gitpod/workspace-full-vnc

RUN curl -L https://nixos.org/nix/install | sh
RUN echo "source ~/.nix-profile/etc/profile.d/nix.sh" >> ~/.bashrc
ENV NIXPKGS_ALLOW_UNFREE=1
RUN nix-env -iA nixpkgs.google-chrome
