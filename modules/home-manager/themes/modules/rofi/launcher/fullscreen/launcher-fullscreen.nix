{ config, ... }:
let
in ''
  configuration {
    modi: "drun";
    display-drun:       "";
    drun-display-format: "{name}";
    font: "JetBrainsMono NF 12";
    sidebar-mode: false;
  }

  @theme "/dev/null"

  * {
      red:                         rgba ( 220, 50, 47, 100 % );
      selected-active-foreground:  var(background);
      lightfg:                     rgba ( 88, 104, 117, 100 % );
      separatorcolor:              var(foreground);
      urgent-foreground:           var(red);
      alternate-urgent-background: var(lightbg);
      lightbg:                     rgba ( 238, 232, 213, 100 % );
      background-color:            transparent;
      border-color:                transparent;
      normal-background:           transparent;
      selected-urgent-background:  var(red);
      alternate-active-background: var(lightbg);
      spacing:                     2;
      blue:                        #ff00ff;
      alternate-normal-foreground: var(foreground);
      urgent-background:           var(background);
      selected-normal-foreground:  #${config.colorScheme.colors.base05};
      active-foreground:           var(blue);
      background:                  #${config.colorScheme.colors.base05}61;
      selected-active-background:  var(blue);
      active-background:           #ff00ff;
      selected-normal-background:  #${config.colorScheme.colors.base00};
      alternate-normal-background: transparent;
      foreground:                  #${config.colorScheme.colors.base00}D9;
      selected-urgent-foreground:  var(background);
      normal-foreground:           var(foreground);
      alternate-urgent-foreground: var(red);
      alternate-active-foreground: var(blue);
      placeholder-color:           #${config.colorScheme.colors.base00}61;
      foreground-solid:            #${config.colorScheme.colors.base00};
  }

  element {
      padding: 2px ;
      cursor:  pointer;
      spacing: 5px ;
      border:  0;
  }
  element normal.normal {
      background-color: var(normal-background);
      text-color:       var(normal-foreground);
  }
  element normal.urgent {
      background-color: var(urgent-background);
      text-color:       var(urgent-foreground);
  }
  element normal.active {
      background-color: var(active-background);
      text-color:       var(active-foreground);
  }
  element selected.normal {
      background-color: var(selected-normal-background);
      text-color:       var(selected-normal-foreground);
  }
  element selected.urgent {
      background-color: var(selected-urgent-background);
      text-color:       var(selected-urgent-foreground);
  }
  element selected.active {
      background-color: var(selected-active-background);
      text-color:       var(selected-active-foreground);
  }
  element alternate.normal {
      background-color: var(alternate-normal-background);
      text-color:       var(alternate-normal-foreground);
  }
  element alternate.urgent {
      background-color: var(alternate-urgent-background);
      text-color:       var(alternate-urgent-foreground);
  }
  element alternate.active {
      background-color: var(alternate-active-background);
      text-color:       var(alternate-active-foreground);
  }
  element-text {
      background-color: transparent;
      cursor:           inherit;
      highlight:        inherit;
      text-color:       inherit;
  }
  element-icon {
      background-color: transparent;
      size:             1.0000em ;
      cursor:           inherit;
      text-color:       inherit;
  }
  window {
      fullscreen: true;
      padding:          38% 38%;
      background-color: var(background);
      border:           1;
  }
  mainbox {
      padding: 0;
      border:  0;
  }
  message {
      padding:      1px ;
      border-color: var(separatorcolor);
      border:       2px dash 0px 0px ;
  }
  textbox {
      text-color: var(foreground);
  }
  listview {
      padding:      8px 0px 0px ;
      scrollbar:    true;
      border-color: var(separatorcolor);
      spacing:      2px ;
      fixed-height: 0;
      border:       2px dash 0px 0px ;
  }
  scrollbar {
      width:        0px ;
      padding:      0;
      handle-width: 0px ;
      border:       0;
      handle-color: var(normal-foreground);
  }
  sidebar {
      border-color: var(separatorcolor);
      border:       2px dash 0px 0px ;
  }
  button {
      cursor:     pointer;
      spacing:    0;
      text-color: var(normal-foreground);
  }
  button selected {
      background-color: var(selected-normal-background);
      text-color:       var(selected-normal-foreground);
  }
  num-filtered-rows {
      expand:     false;
      text-color: var(placeholder-color);
  }
  num-rows {
      expand:     false;
      text-color: var(placeholder-color);
  }
  textbox-num-sep {
      expand:     false;
      str:        "/";
      text-color: var(placeholder-color);
  }
  inputbar {
      padding:    1px ;
      spacing:    0px ;
      text-color: var(foreground);
      children:   [ "prompt","textbox-prompt-colon","entry","num-filtered-rows","textbox-num-sep","num-rows","case-indicator" ];
  }
  case-indicator {
      spacing:    0;
      text-color: var(normal-foreground);
  }
  entry {
      text-color:        var(foreground-solid);
      cursor:            text;
      spacing:           0;
      placeholder-color: var(placeholder-color);
      placeholder:       "Type to filter";
  }
  prompt {
      spacing:    0;
      text-color: var(foreground);
  }
  textbox-prompt-colon {
      margin:     0px 0.3000em 0.0000em 0.0000em ;
      expand:     false;
      str:        ":";
      text-color: inherit;
  }

''
