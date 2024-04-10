{config, home, ...}:

{
  services.mako = {

    #font = "JetBrains Mono Regular 10";
    font = "JuliaMono Regular 10";

    backgroundColor = "#${config.colorScheme.colors.base00}";
    textColor = "#${config.colorScheme.colors.base05}";
    borderRadius = 8;
    borderSize = 2;
    borderColor = "#${config.colorScheme.colors.base02}";

    width = 280;
    height = 173;

  };
}
