{pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    go
    gcc
    gnumake
    maven
    python3
    nodejs
    elixir
    erlang
    rebar3
  ];
  programs.java.enable = true;
}
