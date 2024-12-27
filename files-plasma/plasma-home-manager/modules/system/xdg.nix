{ config, pkgs, ...}: {
  xdg.desktopEntries = {
    opera = {
      name = "Opera";
      genericName = "Web Browser";
      exec = "opera --lang=pt-br %U";
      icon = "opera";
      terminal = false;
      categories = [ "Application" "Network" "WebBrowser" ];
      mimeType = [ "text/html" "text/xml" ];
    };
  };
}
