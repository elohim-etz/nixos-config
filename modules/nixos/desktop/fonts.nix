{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
    cantarell-fonts
    noto-fonts
    noto-fonts-cjk-sans

    noto-fonts-color-emoji
    noto-fonts-emoji-blob-bin

    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    ];

    fontconfig = {
      localConf = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
        <fontconfig>
          <match target="pattern">
            <test qual="first" name="family" compare="eq">
              <string>Cantarell</string>
            </test>
            <edit name="family" mode="assign">
              <string>Cantarell</string>
            </edit>
            <edit name="genericfamily" mode="delete"/>
          </match>
        </fontconfig>
      '';
    };
  };
}
