angular.module("app.shared").directive 'onLastRepeat', ->
  (scope, element, attrs) ->
    if scope.$last
      setTimeout (->
        scope.$emit "onRepeatLast", element, attrs
        return
      ), 1
