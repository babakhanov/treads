treadsCtrl = ->
  ($scope, $resource, User) ->
    User.index '', (response) ->
      $scope.users = response.users
    

angular.module("app.treads").controller "treadsCtrl", ["$scope", "$resource", "User", treadsCtrl()]
