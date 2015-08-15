angular.module("app.shared").directive "leftAside", ->
  restrict: 'E'
  replace: true
  templateUrl: "layout/left_aside.html"
  scope:
    user: "="
  controller: [ "$scope", "Tread", "$rootScope", ($scope, Tread, $rootScope) ->
    $scope.user = $rootScope.user
    $scope.showTreads = false

    getTreads = ->
      Tread.index "", (response) => 
        $scope.treads = response.treads
        $scope.showTreads = true

    $scope.$watch (->
      $rootScope.user
    ), (->
      $scope.user = $rootScope.user
      if $scope.user
        getTreads()
    ), true

    getTreads() if $scope.user

  ] 
