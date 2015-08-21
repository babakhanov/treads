mainCtrl = ->
  (Auth, $location, $scope, ngToast, $rootScope, $cookies, Tread) ->
  ($cookies, $location, $rootScope, $scope, Auth, Tread, ngToast) ->

    $scope.ready = false
    $rootScope.token = $cookies.get("XSRF-TOKEN")
    $rootScope.treads = {}

    window.socket.on "message", (data) ->
      unless $location.path() == "/treads/#{data.tread_id}"
        $rootScope.treads[data.tread_id].new_msg = true

    getTreads = ->
      Tread.index "", (response) -> 
        for tread in response.treads
          $rootScope.treads[tread.id] = tread

    if window.anonimusUser
      $scope.ready = true
      $scope.isAuthenticated = false
      $rootScope.user = null
      if $location.path() != "/sign_in" && $location.path() != "/sign_up"
        $location.path("/sign_in")
    else
      Auth.currentUser().then ((user) ->
        $scope.isAuthenticated = true
        $scope.ready = true
      ), (error) ->
        $scope.ready = true
        # Log on console to check out what the error is.

    $scope.$on 'devise:login', (event, currentUser) ->
      if currentUser.user && currentUser.user.id
        $scope.isAuthenticated = true
        $rootScope.user = currentUser
        getTreads()
      else
        $scope.isAuthenticated = false
        $rootScope.user = null

    $scope.$on 'devise:new-session', (event, currentUser) ->
      $scope.isAuthenticated = true
      $rootScope.user = currentUser
      getTreads()

    $scope.$on 'devise:logout', (event, oldCurrentUser) ->
      $scope.isAuthenticated = false
      $rootScope.user = null

    $scope.$on 'devise:new-registration', (event, user) ->
      $rootScope.user = user

    @logout = ->
      Auth.logout().then ((oldUser) ->
        alert 'Successfully logged out!'
      ), (error) ->
        # An error occurred logging out.


angular.module "app.core"
  .controller "mainCtrl", [
    "$cookies"
    "$location"
    "$rootScope"
    "$scope"
    "Auth"
    "Tread"
    "ngToast"
    mainCtrl()
  ] 
