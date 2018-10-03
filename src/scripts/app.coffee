window.jQuery    ||= require('jquery')
window.$         ||= window.jQuery
window.Popper      = require('popper.js')
window.Bootstrap   = require('bootstrap')
window.Spine       = require('spine')

LightDM = require('./mock.coffee')
# Only set LightDM globals to mocks if they aren't already set
window.lightdm        ||= new LightDM.Greeter()
window.theme_utils    ||= new LightDM.ThemeUtils()
window.greeter_config ||= new LightDM.GreeterConfig()

fa = require('@fortawesome/fontawesome')
fa.library.add(
  require('@fortawesome/fontawesome-free-solid/faKeyboard'),
  require('@fortawesome/fontawesome-free-solid/faLanguage'),
  require('@fortawesome/fontawesome-free-solid/faDesktop'),
  require('@fortawesome/fontawesome-free-solid/faImage'),
)

# TODO: Move all theme_utils/greeter_config calls to here

module.exports = global.App = class App extends Spine.Controller

  constructor: ->
    super(arguments...)

    # TODO: See: https://github.com/Antergos/web-greeter/issues/143
    # Should be fixed in 3.0 release
    background_images = greeter_config.get_str("branding", "background_images")
    logo              = greeter_config.get_str("branding", "logo")
    user_image        = greeter_config.get_str("branding", "user_image") # TODO: Unused

    @backgrounds = new App.Backgrounds(app: @, path: background_images, find: theme_utils.dirlist)
    @logo        = new App.Logo(el: @$("#logo"), path: logo)

    new App.Callbacks()
    new App.LoginForm(el: @$("#login_form"), callback: => lightdm.authenticate())
    new App.Timer(callback: => @logo.update())
    new App.DropdownList(el: @$("#layouts"),     items: lightdm.layouts,  name_key: "description")
    new App.DropdownList(el: @$("#languages"),   items: lightdm.languages)
    new App.DropdownList(el: @$("#sessions"),    items: lightdm.sessions)
    new App.DropdownList(el: @$("#backgrounds"), items: @backgrounds.all, callback: (background) => @backgrounds.update(background))

require('./callbacks.coffee')
require('./vector.coffee')
require('./logo.coffee')
require('./logo_channel.coffee')
require('./dropdown_list.coffee')
require('./background.coffee')
require('./backgrounds.coffee')
require('./login_form.coffee')
require('./timer.coffee')

$ ->
  $('[data-toggle="tooltip"]').tooltip()

  window.app = new App(el: $('body'))

