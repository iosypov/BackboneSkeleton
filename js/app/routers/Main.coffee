define (require, exports, module) ->
  Backbone = require "backbone"
  global = require "cs!views/Global"
  Test = require "cs!views/Test"
  class Main extends Backbone.Router

    routes:
      "": "index"


    index: ->
      global.setTitle "bla"
      global.setActiveMenu "home"
      test = new Test {el: $("#main-area")}
      test.render()

  module.exports = Main