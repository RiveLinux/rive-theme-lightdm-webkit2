path = require("path")

Path   = require("./Path")

# The main build structure
module.exports = class Build
  constructor: (root) ->

    @dirs = {}
    @dirs.root    = new Path(".")
    @dirs.build   = @dirs.root.join("build")
    @dirs.src     = @dirs.root.join("src")
    @dirs.scripts = @dirs.src.join("scripts")
    @dirs.styles  = @dirs.src.join("styles")
    @dirs.views   = @dirs.src.join("views")

    @files =
      scripts: @dirs.scripts.search("**/*.{coffee,js}")
      styles:  @dirs.styles.search("**/*.{css,sass}")
      views:   @dirs.views.search("**/*.{html,html,haml}")
      entries:
        script: @dirs.scripts.join("app.coffee")
        style:  @dirs.styles.join("app.scss")

    @entries = (entry.toString() for name, entry of @files.entries)

    @output =
      path:     @dirs.build.resolve().toString()
      filename: path.join('scripts', 'app.js').toString()
