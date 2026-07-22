{pkgs, ...}:
{

  services.gnome.gcr-ssh-agent.enable = false;
  programs.ssh.startAgent = true;

  environment.systemPackages = with pkgs; [
    fd
    ripgrep
    fastfetch
    tmux
    wget
    yazi
    btop

    keychain
  ];

  # programs.starship = {
  #   enable = true;
  #   settings = {
  #     format = "$directory$git_branch $character";
  #
  #     directory = {
  #       style = "blue";
  #       truncation_length = 0;
  #       truncate_to_repo = false;
  #       format = " [$path]($style)";
  #     };
  #
  #     git_branch = {
  #       symbol = " ";
  #       style = "purple";
  #       format = " on [$symbol$branch]($style)";
  #     };
  #
  #     character = {
  #       success_symbol = "󰘧 ";
  #       error_symbol = "󰘧 ";
  #       vimcmd_symbol = " ";
  #     };
  #   };
  # };

  programs.starship = {
    enable = true;
    settings = {
      format = "$username in $directory$git_branch\n$character";

      username = {
        show_always = true;
        style_user = "green";
        style_root = "red";
        format = "[$user]($style)";
      };

      directory = {
        style = "blue";
        truncation_length = 0;
        truncate_to_repo = false;
        format = " [$path]($style)";
      };

      git_branch = {
        symbol = " ";
        style = "purple";
        format = " on [$symbol$branch]($style)";
      };

      character = {
        success_symbol = "󰘧 ";
        error_symbol = "󰘧 ";
        vimcmd_symbol = " ";
      };
    };
  };

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
      # ls = "ls --color=always";
      ls = "ls --classify";
      ll = "ls -lah";
      grep = "grep --color=auto";
      ff = "fastfetch";
      nd = "nix develop";
      t = "tmux";
      cups = "xdg-open http://127.0.0.1:631";
      syncthing-ui = "xdg-open http://127.0.0.1:8384";
    };

    interactiveShellInit = ''
      set -o vi
      bind 'set show-mode-in-prompt on'
      bind 'set vi-ins-mode-string ""'
      # bind 'set vi-cmd-mode-string "[N] "'
      bind 'set vi-cmd-mode-string "[] "'


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
      # set completion-ignore-case on
      bind 'set completion-ignore-case on'

      # if command -v keychain > /dev/null 2>&1; then
      #   eval $(keychain --eval id_ed25519)
      # fi

      export EDITOR=nvim
      export VISUAL=nvim
      export MANPAGER="nvim +Man!"
      export PATH="/home/saven/.local/bin/:$PATH"
      eval "$(dircolors -b ~/.dircolors)"
      eval "$(starship init bash)"
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
