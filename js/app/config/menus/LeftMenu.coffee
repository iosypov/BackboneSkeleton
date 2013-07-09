define (require, exports, module) ->
  module.exports = [

    {
        name: "home",
        link: "#",
        title: "Home",
        icon: "home"
    },
    {
        name: "help",
        link: "#help",
        title: "Help"
    },
    {
        name: "examples",
        title: "Examples",
        className: "nav-header",
        type: "text"
    },
    {
        name: "form",
        link: "#form",
        title: "Form"
    }
  ]
