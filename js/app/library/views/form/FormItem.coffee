define (require, exports, module) ->
  Backbone = require "backbone"
  template = require "jade!library/templates/form/form-item"
  Input = require "cs!library/views/form/Input"
  Combobox = require "cs!library/views/form/Combobox"
  class FormItem extends Backbone.View
    tagName: "div"
    attributes:
      class: "control-group"
    setValue: (value) ->
      @options.value = value
      @element.setValue value
    showError: (message) ->
      $(@el).addClass "error"
      $(@el).find(".help-inline").text(message).show()
    render: ->
      el = template @options
      $(@el).html el;
      switch @options.type
        when "combobox" then @element = new Combobox @options
        when "button" then @element = null
        else @element = new Input @options

      $(@el).find(".controls").prepend @element.render().el if (@element?)
      return this
  module.exports = FormItem