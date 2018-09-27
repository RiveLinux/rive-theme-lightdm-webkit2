module.exports = class App.Vector

  x: 0
  y: 0

  constructor: (options) ->
    @[key] = value for key, value of options

  @subtract: (a, b) ->
    new App.Vector
      x: a.x - b.x
      y: a.y - b.y

  add_scalars: (x, y) ->
    @x += x
    @y += y

    @

  add: (vector) -> @add_scalars(vector.x, vector.y)

  multiply_scalar: (scalar) ->
    @x *= scalar
    @y *= scalar

    @

  magnitude: -> Math.sqrt(@x * @x + @y * @y)

  set_scalars: (x, y) ->
    @x = x
    @y = y

    @

  set: (vector) -> @set_scalars(vector.x, vector.y)

  set_scalar: (scalar) -> @set_scalars(scalar, scalar)

  clear: ->
    @x = 0
    @y = 0

    @

