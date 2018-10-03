module.exports = class App.Timer extends Spine.Controller

  fps: 60

  constructor: ->
    super(arguments...)

    @interval(1000 / @fps, @callback)

  interval: (duration, callback) -> setInterval(callback, duration)
