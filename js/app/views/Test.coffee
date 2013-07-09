
define (require, exports, module) ->
    Backbone = require "backbone"
    $ = require "jquery"
    Form = require "cs!views/Form"
    TestModel = require "cs!models/Test"
    class Test extends Backbone.View
        tagName: "div",
        active: "",
        attributes:
            "class": "nav"
        events:
          "click #submit": "getValues"
        getValues: ->

          #console.log(@form.getValues())
          @model.set(@form.getValues())
          @model.isValid()
        render: ->
          items = [
            {
              name: "username"
              title: "Username"
              params:
                placeholder: "Username"
                value: "uebok"
            },
            {
              name: "password"
              title: "Password"
              params:
                type: "password"
                placeholder: "password"
            },
            {
              name: "user-type"
              title: "User Type"
              type: "combobox"
              selected: 2

              items: [
                {
                  value: 1
                  label: "Admin"
                },
                {
                  value: 2
                  label: "Moderator"
                },
                {
                  value: 3
                  label: "User"
                }
              ]
            },
            {
              name: "autocomplete"
              title: "Autocomplete"
              autocomplete: {
                source: ["A", "ab", "aaab"]
              }
            },
            {
              name: "qweqwe"
              title: "Vvvvv"
              params:
                placeholder: "asd"
                class: "span11"
            }
          ]
          buttons = [
            {
              type: "submit",
              params:
                class: "btn btn-primary"
              title: "Submit"
              name: "submit"
            },
            {
              type: "submit2",
              params:
                class: "btn"
              title: "Submit2"
              name: "submit2"
            }
          ]
          @model = new TestModel()
          @form = new Form {
            items: items
            model: @model
            buttons: buttons
            attributes:
              class: "form-horizontal"
          }
          $(@el).html @form.render().el
          return this;

    module.exports = Test