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
  "pascalprecht.translate"
  "app.core"
  "app.auth"
  "app.shared"
  "app.treads"
])


angular.module "app"
  .config [
    "$translateProvider" 
    ($translateProvider) ->
      $translateProvider.preferredLanguage(I18n.locale);
      $translateProvider.translations I18n.locale, I18n.translations[I18n.locale]
  ]
