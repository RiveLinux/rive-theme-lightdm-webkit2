# A single background image
#
# Parses the name from the path:
#   "/usr/share/backgrounds/foo-bar-baz.png" // => "Foo Bar Baz"
module.exports = class App.Background

  constructor: (options) ->
    @[key] = value for key, value of options

    partials = @path.split("/")

    @name ||= partials[partials.length - 1].replace(/-/g, " ").replace(/\..+$/, "").replace(/ by.+$/, "")

