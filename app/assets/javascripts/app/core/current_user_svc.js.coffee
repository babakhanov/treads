currentUser = ($rootScope) ->
  $rootScope.user.user

angular.module "app.core"
  .service "currentUser", ["$rootScope", currentUser]
