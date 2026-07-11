{pkgs, ...}:
{

  programs.ssh.startAgent = true;

  environment.systemPackages = with pkgs; [
    fd
    ripgrep
    fastfetch
    tmux
    wget
    yazi
    btop
    broot

    keychain
  ];


  programs.git = {
    enable = true;

    config = {
      user = {
        name = "saventsv";
        email = "saventv@gmail.com";
      };

      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "nvim";
    };
  };

  programs.fzf = {
    keybindings = true;
    fuzzyCompletion = true;
  };

  programs.bash = {
    enable = true;

    shellAliases = {
      ll = "ls -lah";
      grep = "grep --color=auto";
      ff = "fastfetch";
      nd = "nix develop";
      t = "tmux";
      cups = "xdg-open http://localhost:631";
      syncthing-ui = "xdg-open http://localhost:8384";
    };

    interactiveShellInit = ''
      set -o vi
      export EDITOR=nvim
      export VISUAL=nvim
      export MANPAGER="nvim +Man!"
      export PATH="/home/saven/.local/bin/:$PATH"

      # fzf_cd() {
      #   local dir
      #     dir=$(find . -type d 2>/dev/null | fzf)
      #     if [[ -n "$dir" ]]; then
      #       cd "$dir"
      #     fi
      # }

      fzf_cd() {
        local dir
          dir=$(fd --type d --max-depth 4 | fzf)
            if [[ -n "$dir" ]]; then
              cd "$dir"
              READLINE_LINE=""
              READLINE_POINT=0
            fi
          # [[ -n "$dir" ]] && cd "$dir"
          # READLINE_LINE=""
          # READLINE_POINT=0
          # bind '"\e"'
      }

      # bind -x '"\C-f": fzf_cd'
      bind '"\C-f": "\C-ufzf_cd\C-m"'
      bind -x '"\C-n": nvim'

      bind '"\C-l": clear-screen'
      shopt -s cdspell
      set completion-ignore-case on

      # if command -v keychain > /dev/null 2>&1; then
      #   eval $(keychain --eval id_ed25519)
      # fi
      '';

    promptInit = ''
      PS1="\u in \w \$ "
      '';

    # loginShellInit = ''
    #   if [ -z "$SSH_AUTH_SOCK" ]; then
    #     eval "$(ssh-agent -s)"
    #   fi
    # '';
};

  environment.variables = { 
    EDITOR = "nvim";
    VISUAL = "nvim"; 
    MANPAGER="nvim +Man!";
    PATH="/home/saven/.local/bin/:$PATH";
    GTK_THEME = "Everforest-Dark";
    GTK_ICON_THEME = "Papirus-Dark";
  };
}
