angular.module("app.shared").directive "leftAside", ->
  restrict: 'E'
  replace: true
  templateUrl: "layout/left_aside.html"
  scope:
    user: "="
    treads: "="
