{ pkgs, ... }:

{
    config = {
      fonts = {
        enableDefaultPackages = true;
        packages = with pkgs; [
          noto-fonts
          noto-fonts-cjk
          noto-fonts-emoji
          jetbrains-mono
          fira-code
          fira-code-symbols

          (nerdfonts.override { fonts = [ "Inconsolata" ]; })
          powerline
          inconsolata
          inconsolata-nerdfont
          iosevka
          font-awesome
          ubuntu_font_family
          terminus_font
        ];
      };

    };

}
