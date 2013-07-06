define (require, exports, module) ->
  Backbone = require "backbone"
  $ = require "jquery"
  template = require "jade!templates/global"
  Menu = require "cs!views/Menu"
  TopMenu = require "cs!config/menus/TopMenu"
  LeftMenu = require "cs!config/menus/LeftMenu"
  class Global extends Backbone.View
    el: $("body")
    template: template

    render: ->
      @$el.html @template()
      @showMenus(); this

    setActiveMenu: (active) ->
      return @ unless @menu?
      @menu.options.active = active
      @leftMenu.options.active = active
      @showMenus(); this

    setTitle: (string) ->
      $(@el).find("#header").html string
      $("title").html string

    showMenus: ->
      unless (@menu?)
        @menu = new Menu
            el: $("#menu"),
            items: TopMenu,
            active: "home"

        @leftMenu = new Menu
            el: $("#left-menu"),
            items: LeftMenu,
            active: "home"

      @menu.render()
      @leftMenu.render()

  module.exports = new Global