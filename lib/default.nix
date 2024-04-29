{ lib, ... }:

# note: this lib extension will only be available in
# home-manager modules, i.e. home-manager.lib and not
# in nixos modules.
rec {

  # readDirsToStrs :: path -> listOf str
  # reads only the directories in the base path
  readDirsToStrs = basePath:
    (lib.attrNames
      (lib.filterAttrs (n: v: v == "directory") (builtins.readDir basePath)));

  # like readDirsToStrs except converts
  # the strings to paths
  # readDirsToPaths :: path -> listOf path
  readDirsToPaths = basePath:
    map (x: lib.path.append basePath x) (readDirsToStrs basePath);

  # creates theme module imports list 
  # for use in module/home-manager/themes/themes
  # mkThemeImports :: path -> listOf path
  mkThemeImports = modDir:
    lib.lists.flatten (map (dir: import dir) (readDirsToPaths modDir));

}
