module.exports = class App.Logo extends Spine.Controller

  scale:
    small:  2
    medium: 5
    large:  10

  channel_names: ['red', 'green', 'blue', 'white']

  constructor: ->
    super(arguments...)

    @position ||= new App.Vector(x: 10, y: 10)
    @channels   = []

    for name in @channel_names
      channel = new App.LogoChannel(parent: @, path: @path, name: name)
      channel.position.set(@position)
      @channels.push(channel)

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
    

