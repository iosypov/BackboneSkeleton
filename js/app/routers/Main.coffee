define (require, exports, module) ->
  Backbone = require "backbone"
  global = require "cs!views/Global"
  Form = require "cs!views/Form"
  class Main extends Backbone.Router

    routes:
      "": "index"
      "form": "form"

    index: ->
      global.setTitle "bla"
      global.setActiveMenu "home"

    form: ->
      global.setTitle "Test Form"
      global.setActiveMenu "form"
      form = new Form {el: $("#main-area")}
      form.render()


  module.exports = Main