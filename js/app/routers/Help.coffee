define (require, exports, module) ->
  Backbone = require "backbone"
  global = require "cs!views/Global"
  Form = require "cs!views/Form"
  class Help extends Backbone.Router
    routes:
      "help": "index"

    index: ->
      global.setTitle("Help")
      global.setActiveMenu("help")

  module.exports = Help