treadCtrl = ->
  ($scope, Tread, Message, $routeParams, $rootScope) ->
    $scope.newMsg = ""
    currentUser = $rootScope.user.user
    treadId = $routeParams.id
    $scope.$on "onRepeatLast", (scope, element, attrs) ->
      element.parent("div").animate { scrollTop: 10000 }, '500'
      element.parent("div").addClass("loaded")
      
    Tread.index (id: treadId), (response) ->
      $scope.tread = response.tread
      $scope.messages = $scope.tread.messages
      $scope.users = []
      $scope.tread.users.map (user) ->
        $scope.users[user.id] = user

    $scope.sendMsg = ->
      if $scope.newMsg
        console.log ">" + $scope.newMsg
        Message.create (id: treadId, message: {text: $scope.newMsg, tread_id: treadId, user_id: currentUser.id}), (response) ->
          $scope.messages.push(response.message)
          $scope.newMsg = ""

    chat_is = "tread_#{treadId}"
    console.log chat_is
    socket = io("http://localhost:5001")
    socket.on "connect", ->
      console.log "connect"
    socket.on chat_is, (data) ->
      if data.user_id != currentUser.id
        $scope.messages.push(data)
        $scope.$apply()
    socket.on "disconnect", ->
      console.log "disconnect"
    

angular.module("app.treads").controller "treadCtrl", ["$scope", "Tread", "Message", "$routeParams", "$rootScope", treadCtrl()]
