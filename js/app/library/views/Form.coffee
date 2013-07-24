define (require, exports, module) ->
  Backbone = require "backbone"
  Item = require "cs!library/views/form/FormItem"
  Button = require "cs!library/views/form/Button"
  class Form extends Backbone.View
    tagName: "form"
    constructor: ->
      Backbone.View.apply @, arguments
      if (@options.model?)
        @options.model.on "invalid", (model, errors) =>
          for index, error of errors
            @items[error.field].showError error.message if (@items[error.field]?)
        @options.model.on "change", =>
          for key, value of @options.model.changed
            @items[key].setValue value
    render: ->
      for item in @options.items then do (item) =>
        items = @items ?= {}
        field = "value"
        field = "checked" if (item.type == "checkbox")
        item[field] = @model.get item.name if (@model.has item.name)
        items[item.name] = new Item item
        items[item.name].render()
        $(@el).append items[item.name].el
      if (@options.buttons?)
        buttonsItem = new Item {type: "button"}
        buttonsItem.render()
        buttonsElement = $(buttonsItem.el).find(".controls")
        for item in @options.buttons then do (item) =>
          buttons = @buttons ?= {}
          buttons[item.name] = new Button item
          buttons[item.name].render()
          buttonsElement.append buttons[item.name].el
          buttonsElement.append "&nbsp;"

        $(@el).append buttonsItem.el
      return this

    getValues: ->
      values = {}
      for key, item of @items
        el = $(item.el).find("##{key}")
        el = $(item.el).find("[name='#{key}']") if el.length == 0
        values[key] = el.val() if el.length == 1
        if el.length > 1
          values[key] = []
          for index in [0..el.length-1] by 1
            element = el[index]
            values[key].push $(element).val() if $(element).prop "checked"
      return values
  module.exports = Form