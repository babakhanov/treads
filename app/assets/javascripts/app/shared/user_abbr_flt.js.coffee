angular.module("app.shared").filter "userAbbr", ->
  (text) ->
    words = text.split(" ")
    words[0].substr(0, 1) + words[1].substr(0, 1)
