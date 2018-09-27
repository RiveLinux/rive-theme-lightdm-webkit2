module.exports = class App.DropdownBackground extends App.DropdownList

  constructor: (app) ->
    super(app: app, el: app.$("#backgrounds"), items: app.backgrounds.all)

  callback: (background) ->
    @app.backgrounds.current = background

    @app.backgrounds.update_background()
