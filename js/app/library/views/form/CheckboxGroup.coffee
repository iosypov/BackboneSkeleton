define (require, exports, module) ->
  Backbone = require "backbone"
  Checkbox = require "cs!library/views/form/Checkbox"
  class CheckboxGroup extends Backbone.View
    tagName: "div"
    setValue: (values) ->
      @$el.find("input").prop "checked", false
      for value in values
        @items[value].setChecked() if @items[value]
    render: ->
      @$el.html ""
      if (@options.items)
        for key, item of @options.items
          items = @items ?= {}
          item.name = @options.name
          item.checked = _.indexOf(@options.value, item.value) != -1
          items[item.value] = new Checkbox item
          @$el.append(items[item.value].render().el)
      return this
  module.exports = CheckboxGroup
