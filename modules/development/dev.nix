{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    go
    gcc
    gnumake
    maven
    python3
    nodejs
    beamPackages.elixir
    beamPackages.erlang
    rebar3
    cargo
  ];
  programs.java.enable = true;
}
