/**
 * Created with JetBrains WebStorm.
 * User: osipovivan
 * Date: 02.07.13
 * Time: 0:02
 * To change this template use File | Settings | File Templates.
 */

require.config({
    urlArgs: "bust=" + (new Date()).getTime(),
    baseUrl: "/js/app",
    paths: {
        jquery: "../../assets/jquery/jquery-1.10.1",
        underscore: "../../assets/underscore/underscore",
        backbone: "../../assets/backbone/backbone",
        bootstrap: "../../assets/bootstrap/js/bootstrap",
        text: "../../assets/require/text",
        jade: "../../assets/jade/jade",
        cs : '../../assets/coffee-script/cs' ,
        'coffee-script' : '../../assets/coffee-script/coffee-script'

    },

    priority: [
        "cs",
        "coffee-script",
        "jquery",
        "underscore",
        "backbone",
        "underscore",
        "bootstrap",
        "text",
        "jade"
    ],

    shim: {

        underscore: {
            exports: "_"
        },
        backbone: {
            deps: ['underscore', 'jquery'],
            exports: 'Backbone'
        },
        bootstrap: {
            deps: ['jquery']
        },
        bootstrap: {
            deps: ['jquery']
        }

    }
});

require([
    'jquery',
    'underscore',
    'backbone',
    'cs!application',
    'bootstrap',
    "text",
    "jade"

],
    function($, _, Backbone, app){
        app.init();

    }
);