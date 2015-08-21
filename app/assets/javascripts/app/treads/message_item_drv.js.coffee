messageItemDirective =  ->
  restrict: "E"
  templateUrl: "treads/message_item.html"
  scope: 
    message: "="
    user: "="
  controller: [ "$scope", "currentUser", ($scope, currentUser) ->
    $scope.currentUser = currentUser
  ]

  controllerAs: "block"

angular.module("app.treads").directive("messageItem", [messageItemDirective])
