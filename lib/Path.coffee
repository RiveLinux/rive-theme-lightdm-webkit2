# TODO: Look for library to handle this

# Something kind of like Ruby's Pathname

fs        = require("fs")
minimatch = require("minimatch")
path      = require("path")
dir       = require("node-dir")

# Path object which delegates to 'fs' and 'path', similar to Ruby's Pathname
module.exports = class Path
  constructor: (path) ->
    @path = path.toString()

  join: (args...) ->
    args.unshift(@path)
    new Path(args.join(path.sep)) # @delegatePathNew("join", args...) # NOTE: Has no normalization
  dirname:      -> @delegatePathNew("dirname")
  basename:     -> @delegatePathNew("basename")
  extname:      -> @delegatePath("extname")
  name:         -> @delegatePath("basename", @extname())
  resolve:      -> @delegatePathNew("resolve")
  readdirSync:  -> @delegateFs("readdirSync")
  readFileSync: -> @delegateFs("readFileSync")

  search: (pattern) ->
    files   = dir.files(@path, sync: true, recursive: true)
    matches = minimatch.match(files, pattern, matchBase: true)

    new Path([".", matchPath].join(path.sep)) for matchPath in matches

  delegatePathNew: (name, args...) -> new Path(@delegatePath(name, args...))
  delegatePath:    (name, args...) -> path[name](@path, args...)
  delegateFs:      (name, args...) -> fs[name](@path, args...)
  toString:                        -> @path

