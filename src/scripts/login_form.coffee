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

    @disable()
    @unblur()

  blur: -> @effect_on(@effects.blur)

  unblur: -> @effect_off(@effects.blur)

  enable: -> @controls.removeAttr("disabled")

  disable: -> @controls.attr("disabled", "disabled")

  effect_on: (class_name) ->
    @disable()
    @el.addClass(class_name)
    # TODO
    #@app.$("main").animate({ height: "120" }, { duration: "600" })

  effect_off: (class_name) ->
    @enable()
    @app.timeout 100, => @el.removeClass(class_name)
    # TODO
    #@app.$("main").animate({ height: "300" }, { duration: "600" })

  authenticate: ->
    console.log("Start authenticate")

    @effect_on(@effects.blur)

    lightdm.authenticate()
