sessionsCtrl = ->
  ($scope, Auth, $location, $rootScope) ->
    if $rootScope.user
      $location.path '/'

    $scope.logout = ->
      Auth.logout().then ((oldUser) ->
        $rootScope.user = undefined
        $rootScope.lists = undefined
        $location.path '/sign_in'
      ), (error) ->

    $scope.signinData = {}
    $scope.signIn = ->
      Auth.login($scope.signinData).then ((user) ->
        $rootScope.user = user
        $location.path '/'
      ), (error) ->
        $scope.error = error

angular.module "app.auth"
  .controller "sessionsCtrl", ["$scope", "Auth", "$location", "$rootScope", sessionsCtrl()]

