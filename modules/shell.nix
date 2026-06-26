{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    fd
    ripgrep
    nitch
    tmux
    wget
    yazi
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
      emacs = "emacs -nw";
    };

    interactiveShellInit = ''
      set -o vi
      export EDITOR=nvim
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

      bind '"\C-l": clear-screen'
      shopt -s cdspell
      set completion-ignore-case on
      '';

    promptInit = ''
      PS1="\u in \w \$ "
      '';
  };
}
