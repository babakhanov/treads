treadCtrl = ->
  ($scope, Tread) ->
    $scope.tread_id = window.location.hash.split("/")[2]
    Tread.index (id: $scope.tread_id), (response) ->
      $scope.tread = response.tread
      $scope.messages = $scope.tread.messages
      $scope.users = []
      $scope.tread.users.map (user) ->
        $scope.users[user.id] = user

angular.module("app.treads").controller "treadCtrl", ["$scope", "Tread", treadCtrl()]
