# `items` option is required, assumes each item has a `name` (or whatever is configured for `name_key`)
module.exports = class App.DropdownList extends Spine.Controller

  elements:
    "button":         "button"
    ".dropdown-menu": "menu"

  events:
    "click .dropdown-toggle": (event) -> event.preventDefault() # Disallow default browser action since it's a link

  constructor: ->
    super(arguments...)

    @current    = @items[0]
    @name_key ||= "name"

    @button.tooltip()
    @draw()

  sorter: (a, b) =>
    if @name(a) > @name(b) then 1 else if @name(a) < @name(b) then -1 else 0

  draw: ->
    @menu.empty()

    @add_header()
    @add_items()

  name: (item) -> item[@name_key]

  add_header: ->
    elmH = $("<h6 class='dropdown-header'>")
    elmH.text(@button.data("original-title"))
    @menu.append(elmH)

  add_items: ->
    for item in @items.sort(@sorter)
      @create_item(item)

  create_item: (item) ->
    elmA = $("<a>")
    elmA.attr(href: "#", class: "dropdown-item")
    elmA.attr("data-#{key}", item[key]) for key, value of item
    elmA.text(@name(item))
    elmA.click (event) => @item_selected($(event.target).data())

    if @name(item) == @name(@current) then elmA.addClass("active")

    return @menu.append(elmA)

  item_selected: (item) ->
    @current = item

    if typeof(@callback) == "function" then @callback(@current)

    @draw()

