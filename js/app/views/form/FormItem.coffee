define (require, exports, module) ->
  Backbone = require "backbone"
  template = require "jade!templates/form/form-item"
  Input = require "cs!views/form/Input"
  Combobox = require "cs!views/form/Combobox"
  class FormItem extends Backbone.View
    tagName: "div"
    attributes:
      class: "control-group"
    showError: (message) ->
      $(@el).addClass "error"
      $(@el).find(".help-inline").text(message).show()
      console.log @, message
    render: ->
      el = template @options
      $(@el).html el;
      switch @options.type
        when "combobox" then element = new Combobox @options
        when "button" then element = null
        else element = new Input @options

      $(@el).find(".controls").prepend element.render().el if (element?)
      return this
  module.exports = FormItem