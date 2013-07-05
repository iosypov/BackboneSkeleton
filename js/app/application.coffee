#This is the main entry point for the App

define (require, exports, module) ->
  Backbone = require "backbone"
  $ = require "jquery"
  _ = require "underscore"
  global = require "cs!views/Global"
  MainRouter = require "cs!routers/Main"
  HelpRouter = require "cs!routers/Help"

  class init
    dispatcher = _.clone Backbone.Events
    global.render()

    new MainRouter();
    new HelpRouter();

    Backbone.history.on "route", (params, name, callback) ->
      #console.log 1

    Backbone.history.start()

  module.exports = init: init;