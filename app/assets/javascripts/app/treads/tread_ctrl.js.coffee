treadCtrl = ->
  ($scope, Message) ->
    $scope.tread_id = window.location.hash.split("/")[2]
    Message.index (id: $scope.tread_id), (response) ->
      $scope.messages = response.messages

angular.module("app.treads").controller "treadCtrl", ["$scope", "Message", treadCtrl()]
