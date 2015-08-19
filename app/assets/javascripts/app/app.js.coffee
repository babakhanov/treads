//= require ./core/core
//= require ./auth/auth
//= require ./treads/treads
//= require ./shared/shared

angular.module("app", [
  "ngRoute"
  "templates"
  "ngResource"
  "Devise"
  "ngCookies"
  "ngToast"
  "app.core"
  "app.auth"
  "app.shared"
  "app.treads"
])


