module.exports = class App.LogoChannel extends Spine.Controller

  constructor: ->
    super(arguments...)

    @el = @parent.el.find("img[data-channel=#{@channel}]")

    #@el.attr("src", "#{@path}-#{@channel}.png")
    @el.attr("src", @path)

    @position = new App.Vector(x: @parent.position.x, y: @parent.position.y)
    @velocity = new App.Vector

  update: ->
    @position.add(@velocity)
    @velocity.multiply_scalar(0.8) # TODO: Magic number
    @velocity.clear() if @velocity.magnitude() <= 0.1

    @el.css
      left: @position.x
      top:  @position.y

    @

