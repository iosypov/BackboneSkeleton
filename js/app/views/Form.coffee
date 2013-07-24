
define (require, exports, module) ->
    Backbone = require "backbone"
    $ = require "jquery"
    Form = require "cs!library/views/Form"
    TestModel = require "cs!models/Test"
    class Test extends Backbone.View
        tagName: "div",
        active: "",
        attributes:
            "class": "nav"
        events:
          "click #submit": "getValues"
          "click #submit2": "submit2"
        submit2: ->
          @model.set(@form.getValues())
          @model.set
            username: "bla"
            "user-type": 2
            checkbox: ["label2"]
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
              name: "checkbox"
              title: "Checkbox"
              type: "checkboxgroup"
              label: "Label"
              items: [
                {
                  label: "Label1"
                  value: "label1"
                },
                {
                  label: "Label2"
                  value: "label2"
                }
              ]
            }
            {
              name: "autocomplete"
              title: "Autocomplete"
              autocomplete: {
                source: ["A", "ab", "aaab"]
              }
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
          @model = new TestModel(
            username: "shura"
            checkbox: ["label1"]
          )
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