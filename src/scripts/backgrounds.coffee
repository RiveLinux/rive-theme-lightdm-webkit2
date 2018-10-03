# Manages the list of backgrounds
module.exports = class App.Backgrounds extends Spine.Controller

  constructor: ->
    super(arguments...)

    @all ||= []

    @find_all(@path)

    @current ||= @all[0]
    @update()

  find_all: (path) ->
    for entry in @find(path)
      if entry.toLowerCase().match(/(png|jpg|bmp)$/)
        @all.push(new App.Background(path: entry))
      else if !entry.match(/\w+\.\w+$/)
        @find_all(entry)

  update: (background) ->
    @current = background if background?

    @app.el.css("background-image": "url('#{@current.path}')")
    @app.$("main .bg").css("background-image": "url('#{@current.path}')")

