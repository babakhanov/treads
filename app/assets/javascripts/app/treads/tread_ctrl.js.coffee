treadCtrl = ->
  ($scope, Tread, Message, $routeParams, currentUser) ->
    $scope.newMsg = ""

    treadId = $routeParams.id

    Tread.index (id: treadId), (response) ->
      $scope.tread = response.tread
      $scope.messages = $scope.tread.messages
      $scope.users = []
      $scope.tread.users.map (user) ->
        $scope.users[user.id] = user

    $scope.sendMsg = ->
      if $scope.newMsg
        Message.create (id: treadId, message: {text: $scope.newMsg, tread_id: treadId, user_id: currentUser.id}), (response) ->
          $scope.messages.push(response.message)
          $scope.newMsg = ""

    window.socket.on "message", (data) ->
      if data.user_id != currentUser.id
        $scope.messages.push data
        $scope.$apply()

angular.module "app.treads"
  .controller "treadCtrl", [
    "$scope" 
    "Tread" 
    "Message" 
    "$routeParams" 
    "currentUser" 
    treadCtrl()
  ]
