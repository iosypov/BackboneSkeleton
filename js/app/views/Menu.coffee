
define (require, exports, module) ->
  Backbone = require "backbone"
  _ = require "underscore"
  $ = require "jquery"
  template = require "jade!templates/menu"
  class Menu extends Backbone.View
    tagName: "ul"
    template: template
    active: "",
    attributes:
      "class": "nav"

    initialize: ->
      if (@options.items?)
          @items = @options.items
          delete @options.items


      if (@options.active?)
          @active = @options.active
          delete @options.active


    render: ->
      el = this.template {items: this.items, active: this.active}
      $(@el).html(el);
      $(@el).addClass("nav"); this

  module.exports = Menu