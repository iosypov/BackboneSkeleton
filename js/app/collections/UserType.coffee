define (require, exports, module) ->
  Backbone = require "backbone"
  $ = require "jquery"
  class UserType extends Backbone.Collection
    valueAttribute: "value"
    labelAttribute: "label"
  module.exports = UserType