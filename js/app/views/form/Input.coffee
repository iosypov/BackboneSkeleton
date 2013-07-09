define (require, exports, module) ->
  Backbone = require "backbone"
  class Input extends Backbone.View
    tagName: "input"
    render: ->
      @$el.attr "type", "text"
      if (@options.params)
        for key, value of @options.params
          @$el.attr key, value
      @$el.attr "id", @options.name
      @$el.attr "name", @options.name
      @$el.typeahead @options.autocomplete if @options.autocomplete?
      return this
  module.exports = Input
