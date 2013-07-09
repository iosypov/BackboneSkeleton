define (require, exports, module) ->
  Backbone = require "backbone"
  Option = require "cs!views/form/Option"
  class Combobox extends Backbone.View
    tagName: "select"
    render: ->
      if (@options.params)
        for key, value of @options.params
          @$el.attr key, value
      optionList = @optionList ?= {}
      if (@options.items)
        for value in @options.items
          value.selected = true if (value.value == @options.selected)
          optionList[value.value] = new Option value
          $(@el).append optionList[value.value].render().el
      @$el.attr "id", @options.name
      @$el.attr "name", @options.name; this
  module.exports = Combobox
