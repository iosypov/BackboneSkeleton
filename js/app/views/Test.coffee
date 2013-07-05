
define (require, exports, module) ->
    Backbone = require "backbone"
    $ = require "jquery"
    template = require "jade!templates/test"
    class Test extends Backbone.View
        tagName: "ul",
        template: template,
        active: "",
        attributes:
            "class": "nav"

        render: ->
            @$el.html @template(
              item: "Hello world1111!"
            )
            return this;

    module.exports = Test