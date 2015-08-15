messageItemDirective =  ->
  restrict: "E"
  templateUrl: "treads/message_item.html"
  scope: 
    message: "="
    user: "="
  controller: [ "$scope", "$rootScope", ($scope, $rootScope) ->
    $scope.current_user = $rootScope.user
  ]

  controllerAs: "block"

angular.module("app.treads").directive("messageItem", [messageItemDirective])
