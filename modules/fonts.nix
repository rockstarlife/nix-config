{ config, pkgs, unstablePkgs, ... }:

{
  # fonts.packages = with pkgs; [
  #   # inter # open source clone of San Francisco from Apple.
  #   # nerd-fonts.jetbrains-mono
  #   # noto-fonts # резервный самый глобальный шрифт, подходит для всего.
  # ];


  fonts.packages = with unstablePkgs; [
    inter # open source clone of San Francisco from Apple.
    geist-font # inter 2.0
    nerd-fonts.jetbrains-mono
    noto-fonts # резервный самый глобальный шрифт, подходит для всего.
    tex-gyre.termes # time new romans coppy 1:1.
  ];


#make by myself
fonts.fontconfig = {
  antialias = true;
  hinting = {
    enable = true;          # включаем, но слабый
    style = "slight";   # или "none" для ещё ближе к macOS
  };
  defaultFonts = {
    serif     = [ "Geist" "Inter" ]; # Inter
    sansSerif = [ "Geist" "Inter" ]; # Inter
    monospace = [ "JetBrainsMono Nerd Font Mono" "JetBrains Mono" ];
    };

  localConf = ''
    <?xml version='1.0'?>
    <!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
    <fontconfig>

      <!-- macOS-подобный: слабый хинтинг + legacy фильтр для мягкости -->
      <match target="font">
        <edit name="antialias" mode="assign"><bool>true</bool></edit>
        <edit name="hinting" mode="assign"><bool>true</bool></edit>
        <edit name="hintstyle" mode="assign"><const>hintslight</const></edit>
        <edit name="rgba" mode="assign"><const>rgb</const></edit>
        <edit name="lcdfilter" mode="assign"><const>lcdlegacy</const></edit>  <!-- или lcdlight для ещё мягче -->
      </match>

      <!-- Отключаем bytecode hinting где возможно (ближе к macOS) -->
      <match target="font">
        <test name="embeddedbitmap" compare="contains"><bool>false</bool></test>
        <edit name="autohint" mode="assign"><bool>false</bool></edit>  <!-- выключаем автогинт -->
      </match>

      <!-- Для Chrome часто помогает -->
      <alias>
        <family>sans-serif</family>
        <prefer>
          <family>Helvetica Neue</family>
          <family>Arial</family>
          <family>Noto Sans</family>
        </prefer>
      </alias>

    </fontconfig>
  '';
};

}
