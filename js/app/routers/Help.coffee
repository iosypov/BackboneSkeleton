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

      items = [
        {
          name: "username"
          title: "Username"
        },
        {
          name: "password"
          title: "Password"
        }
      ]
      form = new Form {
        items: items
        attributes:
          class: "form-horizontal"
      }
      $("#main-area").html form.render().el

  module.exports = Help