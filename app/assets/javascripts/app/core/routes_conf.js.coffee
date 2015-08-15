angular.module "app.core"
  .config ($routeProvider) ->
    $routeProvider
      .when("/",
        templateUrl: "treads/index.html",
        controller: "treadsCtrl"
      ).when('/treads/:id',
        templateUrl: 'treads/show.html',
        controller: 'treadCtrl'
      ).when("/sign_up",
        templateUrl: "auth/sign_up.html",
        controller: "registrationsCtrl"
      ).when("/sign_in",
        templateUrl: "auth/sign_in.html",
        controller: "sessionsCtrl"
      ).otherwise(
        redirectTo: "/"
      )
