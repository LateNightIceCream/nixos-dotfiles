{ lib, config, pkgs, ... }:
let

  /*
   { 
     rosepine = { dawn = { ... }; moon = { ... }; } 
   }
  */
  themeVariants = lib.mapAttrs (n: v: import ./${n}) 
    (lib.filterAttrs (n: v: v == "directory" ) (builtins.readDir ./.));

  /*
    {
      rosepine.dawn = lib.mkOption {
        type = lib.types.attrs;
        default = themeVariants.rosepine.dawn;
      }
    }
  */
  mkVariantOptions = variantsAttrs: builtins.mapAttrs (schemeName: variants: 

    builtins.mapAttrs (variantName: variantValue: 
      lib.mkOption {
        type = lib.types.attrs;
        description = "${schemeName} colorScheme of the ${variantName} variant";
        default = variantValue;
      }
    ) variants

  ) variantsAttrs;

in
{

  options.lnicColorSchemes = mkVariantOptions themeVariants; 

  config = {
  };
}
