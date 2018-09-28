module.exports = class App.Logo extends Spine.Controller

  scale:
    small:  2
    medium: 5
    large:  10

  constructor: ->
    super(arguments...)

    @position ||= new App.Vector(x: 10, y: 10)
    @path     ||= greeter_config.branding.logo

    @channels = [ # TODO: Should be injected?
      new App.LogoChannel(parent: @, path: @path, channel: "red"),
      new App.LogoChannel(parent: @, path: @path, channel: "green"),
      new App.LogoChannel(parent: @, path: @path, channel: "blue")
    ]

    channel.position.set(@position) for channel in @channels

    # TODO: This shouldnt be here
    $('body').click => @shake(@scale.medium)
    $('body').keydown (event) =>
      scale = if event.keyCode == 9 then @scale.large else @scale.small

      @shake(scale)

  amplitude: (scale) ->
    ((Math.random() * 2) - 1) * scale

  shake: (scale) ->
    for channel in @channels
      channel.velocity.add_scalars(@amplitude(scale), @amplitude(scale))

  update: ->
    for channel in @channels
      displacement = App.Vector.subtract(@position, channel.position)

      if displacement.magnitude() > 0.1
        channel.velocity.add(displacement)

      channel.update()

  move_down: ->
    

