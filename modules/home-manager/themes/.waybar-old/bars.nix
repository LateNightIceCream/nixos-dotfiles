{

  # returns this attrs which consists of the individual 
  # home.nix entries for the different bars
  # so e.g. (import [...]/waybar/bars.nix).bar-1

  bar-1 = import ./bars/bar-1/home.nix;
  bar-2 = import ./bars/bar-2/home.nix;
  bar-3 = import ./bars/bar-3/home.nix;
  bar-4 = import ./bars/bar-4/home.nix;
  bar-5 = import ./bars/bar-5/home.nix;

}
