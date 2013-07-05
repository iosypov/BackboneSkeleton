define (require, exports, module) ->
  Backbone = require "backbone"
  global = require "cs!views/Global"

  class Help extends Backbone.Router
    routes:
      "help": "index"

    index: ->
      global.setTitle("Help")
      global.setActiveMenu("help")

  module.exports = Help