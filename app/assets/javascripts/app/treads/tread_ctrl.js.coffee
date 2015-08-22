treadCtrl = ->
  ($rootScope, $routeParams, $scope, Message, Tread, currentUser, Spinner) ->
    $scope.newMsg = ""

    treadId = parseInt($routeParams.treadId)

    Tread.index (id: treadId), (response) ->
      $scope.tread = response.tread
      $scope.messages = $scope.tread.messages
      $scope.users = []
      $rootScope.treads[treadId].new_msg = false
      $scope.tread.users.map (user) ->
        $scope.users[user.id] = user

    $scope.sendMsg = ->
      if $scope.newMsg
        Message.create (id: treadId, message: {text: $scope.newMsg, tread_id: treadId, user_id: currentUser.id}), (response) ->
          $scope.messages.push(response.message)
          $scope.newMsg = ""

    window.socket.on "message", (data) ->
      if data.user_id != currentUser.id && treadId == data.tread_id
        $scope.messages.push data
        $scope.$apply()

angular.module "app.treads"
  .controller "treadCtrl", [
    "$rootScope"
    "$routeParams"
    "$scope"
    "Message"
    "Tread"
    "currentUser"
    "Spinner"
    treadCtrl()
  ]
