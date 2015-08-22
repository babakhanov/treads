angular.module("app.shared").directive "leftAside", ->
  restrict: 'E'
  replace: true
  templateUrl: "layout/left_aside.html"
  scope:
    user: "="
    treads: "="
  controller: ["$scope", "$routeParams", "$location", ($scope, $routeParams, $location) ->
    $scope.$location = $location
    $scope.$routeParams = $routeParams
    if $routeParams.treadId && parseInt($routeParams.treadId) > 0
      $scope.activeTread = parseInt($routeParams.treadId)
    else
      $scope.activeTread = 0
  ]
