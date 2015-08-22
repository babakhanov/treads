angular.module("app.shared").directive "currentUser", ->
  restrict: 'E'
  replace: true
  templateUrl: "layout/current_user.html"
  scope:
    user: "="
  controller: ["$scope", ($scope) ->

  ]



