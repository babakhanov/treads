angular.module("app.shared").directive "leftAside", ->
  restrict: 'E'
  replace: true
  templateUrl: "layout/left_aside.html"
  scope: true
  controller: [ '$scope', 'User', ($scope, User) ->
    $scope.userInnitials = (user) ->
      user.first_name.substr(0, 1) + user.last_name.substr(0, 1)
    User.index "", (response) ->
      $scope.users = response.users


  ] 
