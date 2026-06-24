{pkgs, config, ...}:
{

  environment.systemPackages = with pkgs; [
    fd
    ripgrep
    fastfetch
    tmux
    wget
    git
  ];

  programs.fzf = {
    keybindings = true;
    fuzzyCompletion = true;
  };
}
