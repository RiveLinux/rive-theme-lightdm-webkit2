# TODO

* Configs
  * /etc/lightdm/lightdm-webkit2-greeter.conf
    * Theme is rive
  * /etc/lightdm/lightdm.conf
    * greeter-session is lightdm-webkit2-greeter
* Options
  * Toggle blurred backgrounds
    `display: none` for blurred `.bg` elements ()
  * Fonts
    * Text input font
    * Button font (this includes the WM dropdown)
    * Menu font (all menus, including dropdowns)
  * Logo
    * Utility to autogenerate individual RGB channel images from a given image?
* `Logo#move_down/up` to move logo to center when authenticating
* Show current WM in menu
* Menu base controller
* `background-size: cover;` for blurred `.bg` elements
  * `cover` looks good for the background but the blurred bg's are the wrong size, using cover
    for the blurred bg makes the size to the element, way too small
* Themes
* Use /usr/share/lightdm-webkit/themes/js/mock.js instead of app/scripts/lightdm-mock.js
* Accessibility
  * WCAG AA Specifications
