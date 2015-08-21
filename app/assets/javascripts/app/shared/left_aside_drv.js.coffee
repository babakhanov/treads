angular.module("app.shared").directive "leftAside", ->
  restrict: 'E'
  replace: true
  templateUrl: "layout/left_aside.html"
  scope:
    user: "="
  controller: [ "$scope", "$rootScope", ($scope, $rootScope) ->
    $scope.$watch (->
      $rootScope.treads
    ), (->
      $scope.treads = $rootScope.treads
      if $scope.treads.length
        $scope.showTreads = true
      else
        $scope.showTreads = false
    ), true

  ] 
