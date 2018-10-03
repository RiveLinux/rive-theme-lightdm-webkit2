module.exports = class App.LoginForm extends Spine.Controller

  elements:
    "input, button": "controls"
    "#username":     "username"

  events:
    "submit": "authenticate"

  effects:
    blur: "blurred"

  constructor: ->
    super(arguments...)

    @unblur()

  blur: -> @effect_on(@effects.blur)

  unblur: -> @effect_off(@effects.blur)

  enable: -> @controls.removeAttr("disabled")

  disable: -> @controls.attr("disabled", "disabled")

  effect_on: (class_name) ->
    @disable()
    @el.addClass(class_name)

  effect_off: (class_name) ->
    @enable()
    @el.removeClass(class_name)

  authenticate: ->
    @blur()
    if typeof(@callback) == "function" then @callback()

