angular.module("app.shared").directive "autoGrowTextarea", ->
  restrict: 'C'
  link: ($scope, $element, $attrs) ->
    angular.element($element).autogrow()
