{ config, ... }: ''
  configuration {
    modi: "drun";
    display-drun:       "";
    drun-display-format: "{name}";
    sidebar-mode:       false;
  }

  @theme "/dev/null"

  * {
      spacing:          10;
      bg: #${config.colorScheme.palette.base00};
      fg: #${config.colorScheme.palette.base05};
      accent-fg: #${config.colorScheme.palette.base00};
      accent-bg: #${config.colorScheme.palette.base08};
      bg-border: @accent-bg;
      background-color: @bg;
  }

  window {
      width:            23.6%;
      border-radius:    8px;
      border:           2;
      padding:          12;
      background-color: @bg;
      border-color:     @bg-border;
  }

  inputbar {
      spacing:    0px;
      padding:    0px 5px 0px 5px;
      text-color: @fg;
      children:   [ prompt,textbox-prompt-colon,entry,case-indicator ];
  }

  prompt {
      spacing:    0;
      text-color: @fg;
  }

  textbox-prompt-colon {
      expand:     false;
      font: "lucide 16";
      str:        "";
      margin:     0px 0.62em 0em 0em ;
      text-color: @fg;
  }

  entry {
      spacing:    5px;
      font-size: 12px;
      text-color: @fg;
      padding-left: 12px;
      padding-right: 12px;
  }

  listview {
      fixed-height: 0;
      spacing:      0px ;
      scrollbar:    false;
      lines:        3;
  }

  element {
      border:  0;
      padding: 10px 5px 10px 5px;
      background-color: @bg;
      text-color:       @fg;

  }

  element.selected {
      background-color: @accent-bg;
      text-color:       @accent-fg;
      border-radius: 12px;
  }

  element-text {
      background-color: inherit;
      text-color:       inherit;
  }
''
