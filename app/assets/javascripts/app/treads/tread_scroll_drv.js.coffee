treadScrollDirective = ->
  restrict: "A"
  scope: false
  controller: ["$scope", ($scope) ->
    $scope.$on "onRepeatLast", (scope, element, attrs) ->
      element.parent("div").animate { scrollTop: 10000 }, '500'
      element.parent("div").addClass("loaded")
  ] 

angular.module "app.treads"
  .directive "treadScroll", [treadScrollDirective]
