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
    ).when('/treads/:id',
      templateUrl: 'treads/show.html',
      controller: 'treadCtrl'
    ).otherwise(
      redirectTo: "/"
    )
