messageItemDirective =  ->
  restrict: "E"
  templateUrl: "treads/message_item.html"
  scope: 
    message: "="
    user: "="
  controller: ($scope, $element, $attrs) ->
    $scope.current_user = gon.user

  controllerAs: "block"

angular.module("app.treads").directive("messageItem", [messageItemDirective])
