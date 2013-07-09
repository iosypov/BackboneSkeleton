define (require, exports, module) ->
  Backbone = require "backbone"
  class Option extends Backbone.View
    tagName: "option"
    render: ->
      if (@options.params)
        for key, value of @options.params
          @$el.attr key, value
      @$el.attr "value", @options.value
      @$el.attr "selected", "selected" if @options.selected?
      @$el.html @options.label; this
  module.exports = Option
