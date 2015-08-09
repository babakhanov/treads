//= require ./treads/treads
//= require ./shared/shared

angular.module("app", [
  "ngRoute"
  "templates"
  "ngResource"
  "app.shared"
  "app.treads"
])


angular.module("app").config ($routeProvider) ->
  $routeProvider
    .when("/",
      templateUrl: "treads/index.html",
      controller: "treadsCtrl"
    ).when('/sign_in',
      templateUrl: 'sign_in.html',
      controller: 'SessionsCtrl'
    ).otherwise(
      redirectTo: "/"
    )
