define (require, exports, module) ->
  Backbone = require "backbone"
  class Button extends Backbone.View
    tagName: "button"
    render: ->
      @$el.attr "type", "button"
      if (@options.params?)
        for key, value of @options.params
          @$el.attr key, value
      @options.title = "Button" unless (@options.title?)
      @$el.attr "id", @options.name
      @$el.attr "name", @options.name
      @$el.html @options.title
      return this
  module.exports = Button
