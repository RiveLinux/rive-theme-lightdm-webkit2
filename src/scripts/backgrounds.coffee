# Manages the list of backgrounds
module.exports = class App.Backgrounds extends Spine.Controller

  constructor: ->
    super(arguments...)

    @path ||= greeter_config.branding.background_images
    @all  ||= []

    @find_all()

    @current ||= @all[0]
    @update_background()

  find_all: (path=@path) ->
    for entry in theme_utils.dirlist(path)
      if entry.toLowerCase().match(/(png|jpg|bmp)$/)
        @all.push(new App.Background(path: entry))
      else if !entry.match(/\w+\.\w+$/)
        @find_all(entry)

  update_background: ->
    @app.el.css("background-image": "url('#{@current.path}')")
    @app.$("main .bg").css("background-image": "url('#{@current.path}')")

