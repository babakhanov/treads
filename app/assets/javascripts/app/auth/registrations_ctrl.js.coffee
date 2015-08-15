registrationsCtrl = ->
  ($scope, Auth, $location, $rootScope) ->
    if $rootScope.user
      $location.path("/")

    $scope.signupData = {}
    $scope.addUser = ->
      Auth.register($scope.signupData).then ((registeredUser) ->
        $rootScope.user = registeredUser
        $rootScope.lists = new Array()
        $location.path("/")
      ), (error) ->
        $scope.error = error


angular.module "app.auth"
  .controller "registrationsCtrl", ["$scope", "Auth", "$location", "$rootScope", registrationsCtrl()]
