window.jQuery    ||= require('jquery')
window.$         ||= window.jQuery
window.Popper      = require('popper.js')
window.Bootstrap   = require('bootstrap')
window.Spine       = require('spine')

LightDM                 = require('./mock.coffee')
# Only set LightDM globals to mocks if they aren't already set
window.lightdm        ||= new LightDM.Greeter()
window.theme_utils    ||= new LightDM.ThemeUtils()
window.greeter_config ||= new LightDM.GreeterConfig()

fa         = require('@fortawesome/fontawesome')
faKeyboard = require('@fortawesome/fontawesome-free-solid/faKeyboard')
faLanguage = require('@fortawesome/fontawesome-free-solid/faLanguage')
faDesktop  = require('@fortawesome/fontawesome-free-solid/faDesktop')
faImage    = require('@fortawesome/fontawesome-free-solid/faImage')

fa.library.add(faLanguage, faKeyboard, faDesktop, faImage)

#require('spine/lib/route.js')
#require('spine/lib/local.js')

module.exports = global.App = class App extends Spine.Controller

  fps: 60

  constructor: ->
    super(arguments...)

    @callbacks   = new App.Callbacks(app: @)
    @backgrounds = new App.Backgrounds(app: @)
    @logo        = new App.Logo(app: @, el: @$("#logo"))
    @login_form  = new App.LoginForm(app: @, el: @$("#login_form"))

    new App.DropdownList(app: @, el: @$("#layouts"),   items: lightdm.layouts,  name_key: "description")
    new App.DropdownList(app: @, el: @$("#languages"), items: lightdm.languages)
    new App.DropdownList(app: @, el: @$("#sessions"),  items: lightdm.sessions)
    new App.DropdownBackground(@)

    @interval(1000 / @fps, @update)

  interval: (duration, callback) -> setInterval(callback, duration)

  timeout: (duration, callback) -> setTimeout(callback, duration)

  update: => @logo.update()

require('./callbacks.coffee')

require('./vector.coffee')

require('./logo.coffee')
require('./logo_channel.coffee')

require('./dropdown_list.coffee')
require('./dropdown_background.coffee')

require('./background.coffee')
require('./backgrounds.coffee')

require('./login_form.coffee')

$ ->
  $('[data-toggle="tooltip"]').tooltip()

  window.app = new App(el: $('body'))

