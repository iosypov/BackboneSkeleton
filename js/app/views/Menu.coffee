
define (require, exports, module) ->
  Backbone = require "backbone"
  _ = require "underscore"
  $ = require "jquery"
  template = require "jade!templates/menu"
  class Menu extends Backbone.View
    tagName: "ul"
    template: template
    attributes:
      "class": "nav"

    render: ->
      el = this.template items: this.options.items, active: this.options.active
      $(@el).html(el);
      $(@el).addClass("nav"); this

  module.exports = Menu