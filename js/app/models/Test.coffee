define (require, exports, module) ->
  Backbone = require "backbone"
  class Test extends Backbone.Model
    validate: (attrs, options) ->
      errors = []
      if (attrs.username == "uebok")
        errors.push
          field: "username"
          message: "very bad"
      return errors if (errors.length > 0)
  module.exports = Test