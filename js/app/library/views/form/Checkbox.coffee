define (require, exports, module) ->
  Backbone = require "backbone"
  class Checkbox extends Backbone.View
    tagName: "label"
    attributes:
      class: "checkbox"
    setChecked: ->
      @input.prop "checked", true
    render: ->
      @$el.html("");
      @input = $("<input type='checkbox'>")
      if (@options.params)
        for key, value of @options.params
          @input.attr key, value

      @input.attr "value", @options.value
      @input.attr "name", @options.name
      if (_.isBoolean(@options.checked))
        @input.prop "checked", @options.checked
      else
        @input.prop "checked", @options.checked == @options.value
      @$el.append(@input).append(@options.label); this
  module.exports = Checkbox
