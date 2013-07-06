define (require, exports, module) ->
  Backbone = require "backbone"
  Item = require "cs!views/FormItem"
  class Form extends Backbone.View
    tagName: "form"
    items: {}
    render: ->
      for item in @options.items then do (item) =>
        console.log item
        @items[item.name] = new Item item
        @items[item.name].render()
        $(@el).append @items[item.name].el
      return this
  module.exports = Form