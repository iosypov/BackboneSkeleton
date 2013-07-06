define (require, exports, module) ->
  Backbone = require "backbone"
  template = require "jade!templates/form-item"
  class FormItem extends Backbone.View
    tagName: "div"
    attributes:
      class: "control-group"
    render: ->
      console.log @options.name
      el = template @options
      $(@el).html el; this
  module.exports = FormItem