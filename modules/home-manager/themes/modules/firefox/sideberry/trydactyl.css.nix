 { config, ... }:
''
:root {
    /* Generic */
    --tridactyl-font-family: monospace !important;
    --tridactyl-font-family-sans: sans-serif !important;
    --tridactyl-font-size: 12pt !important;
    --tridactyl-small-font-size: calc(var(--tridactyl-font-size) * 0.75) !important;
    --tridactyl-bg: #ff00ff !important;
    --tridactyl-fg: black !important;
    --tridactyl-logo: url("moz-extension://__MSG_@@extension_id__/static/logo/Tridactyl_64px.png") !important;
    --tridactyl-scrollbar-color: auto !important;

    /* Mode indicator */
    --tridactyl-status-font-family: var(--tridactyl-font-family) !important;
    --tridactyl-status-font-size: var(--tridactyl-small-font-size) !important;
    --tridactyl-status-bg: var(--tridactyl-bg) !important;
    --tridactyl-status-fg: var(--tridactyl-fg) !important;
    --tridactyl-status-border: 1px lightgray solid !important;
    --tridactyl-status-border-radius: 2px !important;

    /* Search highlight */
    --tridactyl-search-highlight-color: #ff00ff !important;

    /* Hinting */

    /* Hint character tags */
    --tridactyl-hintspan-font-family: var(--tridactyl-font-family-sans) !important;
    --tridactyl-hintspan-font-size: var(--tridactyl-small-font-size) !important;
    --tridactyl-hintspan-font-weight: bold !important;
    --tridactyl-hintspan-fg: white !important;
    --tridactyl-hintspan-bg: #ff00ff !important;
    --tridactyl-hintspan-border-color: ButtonShadow !important;
    --tridactyl-hintspan-border-width: 0px !important;
    --tridactyl-hintspan-border-style: solid !important;
    --tridactyl-hintspan-js-background: hsla(0, 0%, 65%) !important;

    /* Element highlights */
    --tridactyl-hint-active-fg: var(--tridactyl-fg) !important;
    --tridactyl-hint-active-bg: #ff00ff !important;
    --tridactyl-hint-active-outline: 1px solid #cc0000 !important;

    --tridactyl-hint-bg: rgba(255, 255, 0, 0.25) !important;
    --tridactyl-hint-outline: 1px solid #8f5902 !important;

    /* :viewsource */
    --tridactyl-vs-bg: var(--tridactyl-bg) !important;
    --tridactyl-vs-fg: var(--tridactyl-fg) !important;
    --tridactyl-vs-font-family: var(--tridactyl-font-family) !important;

    /*commandline*/

    --tridactyl-cmdl-bg: var(--tridactyl-bg) !important;
    --tridactyl-cmdl-fg: var(--tridactyl-fg) !important;
    --tridactyl-cmdl-line-height: 1.5 !important;
    --tridactyl-cmdl-font-family: monospace !important;
    --tridactyl-cmdl-font-size: calc(var(--tridactyl-font-size) * 0.75) !important;

    /*completions*/

    --tridactyl-cmplt-option-height: 1.4em !important;
    --tridactyl-cmplt-fg: var(--tridactyl-fg) !important;
    --tridactyl-cmplt-bg: var(--tridactyl-bg) !important;
    --tridactyl-cmplt-font-size: calc(var(--tridactyl-font-size) * 10/12) !important;
    --tridactyl-cmplt-font-family: monospace !important;
    /* i don't think 0.5px is redered */
    --tridactyl-cmplt-border-top: 1px solid grey !important;

    /* need a better way for naming variables 
     *
        - .Properties for .HistoryCompletionSource table
        - .Properties for .BmarkCompletionSource table

    */

    /*sectionHeader*/

    --tridactyl-header-first-bg: LightGray !important;
    --tridactyl-header-second-bg: #ddd !important;
    --tridactyl-header-third-bg: LightGray !important;
    /* eg. What if I dont want liner-gradient as bg?
     *
     * :root .sectionHeader { background: blue !important; }
     *
     * ????
     */

    --tridactyl-header-font-size: inherit !important;
    --tridactyl-header-font-weight: bold !important;
    /* i don't think 0.5px is redered */
    --tridactyl-header-border-bottom: 1px solid bottom !important;

    /*url style*/

    --tridactyl-url-text-decoration: none !important;
    --tridactyl-url-fg: #1f9947 !important;
    --tridactyl-url-bg: var(--tridactyl-bg) !important;
    --tridactyl-url-cursor: pointer !important;

    /*option focused*/

    --tridactyl-of-fg: var(--tridactyl-fg) !important;
    --tridactyl-of-bg: #ffec8b !important;

    /*new tab spoiler box*/
    --tridactyl-highlight-box-bg: rgba(0, 0, 0, 0.07) !important;
    --tridactyl-highlight-box-fg: var(--tridactyl-fg) !important;

    --tridactyl-private-window-icon-url: url("chrome://browser/skin/privatebrowsing/private-browsing.svg") !important;

    --tridactyl-container-fingerprint-url: url("resource://usercontext-content/fingerprint.svg") !important;
    --tridactyl-container-briefcase-url: url("resource://usercontext-content/briefcase.svg") !important;
    --tridactyl-container-dollar-url: url("resource://usercontext-content/dollar.svg") !important;
    --tridactyl-container-cart-url: url("resource://usercontext-content/cart.svg") !important;
    --tridactyl-container-circle-url: url("resource://usercontext-content/circle.svg") !important;
    --tridactyl-container-gift-url: url("resource://usercontext-content/gift.svg") !important;
    --tridactyl-container-vacation-url: url("resource://usercontext-content/vacation.svg") !important;
    --tridactyl-container-food-url: url("resource://usercontext-content/food.svg") !important;
    --tridactyl-container-fruit-url: url("resource://usercontext-content/fruit.svg") !important;
    --tridactyl-container-pet-url: url("resource://usercontext-content/pet.svg") !important;
    --tridactyl-container-tree-url: url("resource://usercontext-content/tree.svg") !important;
    --tridactyl-container-chill-url: url("resource://usercontext-content/chill.svg") !important;

    --tridactyl-container-color-blue: #37adff !important;
    --tridactyl-container-color-turquoise: #00c79a !important;
    --tridactyl-container-color-green: #51cd00 !important;
    --tridactyl-container-color-yellow: #ffcb00 !important;
    --tridactyl-container-color-orange: #ff9f00 !important;
    --tridactyl-container-color-red: #ff613d !important;
    --tridactyl-container-color-pink: #ff4bda !important;
    --tridactyl-container-color-purple: #af51f5 !important;

    --tridactyl-externaledit-bg: var(--tridactyl-logo) no-repeat center !important;
}
''
