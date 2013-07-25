define (require, exports, module) ->
  Backbone = require "backbone"
  Option = require "cs!library/views/form/Option"
  class Combobox extends Backbone.View
    tagName: "select"
    constructor: ->
      Backbone.View.apply @, arguments
      if (@options.collection?)
        @valueAttribute = @options.collection.valueAttribute ?= "value"
        @labelAttribute = @options.collection.labelAttribute ?= "label"
        @options.collection.on "add", (model) =>
          optionList = @optionList ?= {}
          item = {}
          item.model = model
          item.value = model.get @valueAttribute
          item.label = model.get @labelAttribute
          item.selected = true if (item.value == @options.value)
          optionList[item.value] = new Option item
          $(@el).append optionList[item.value].render().el
          @options.items.push item
        @options.collection.on "remove", (model) =>
          @optionList[model.get @valueAttribute].$el.remove()
          delete @optionList[model.get @valueAttribute]
    setValue: (value) ->
      $(@el).val value
      $(@el).select2 "val", value
    afterRender: ->
      $(@el).select2(@options.select2) if @options.select2?
    render: ->
      if (@options.params)
        for key, value of @options.params
          @$el.attr key, value
      optionList = @optionList ?= {}
      @options.items = [] unless @options.items
      if @options.collection
        @options.collection.each (model) =>
          item = {}
          item.model = model
          item.value = model.get @valueAttribute
          item.label = model.get @labelAttribute
          @options.items.push item
      for item in @options.items
        item.selected = true if (item.value == @options.value)
        optionList[item.value] = new Option item
        $(@el).append optionList[item.value].render().el
      @$el.attr "id", @options.name
      @$el.attr "name", @options.name; this
  module.exports = Combobox
