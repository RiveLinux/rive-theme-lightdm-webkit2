# Manages the list of backgrounds
module.exports = class App.Backgrounds extends Spine.Controller

  constructor: ->
    super(arguments...)

    @paths ||= []
    @items ||= []

    @find_items()

    @current ||= @items[0]
    @update_background()

  find_items: ->
    for path in @paths
      for file in greeter_util.dirlist(path)
        @items.push(new App.Background(path: file))

  update_background: ->
    @app.el.css("background-image": "url('#{@current.path}')")
    @app.$("main .bg").css("background-image": "url('#{@current.path}')")

