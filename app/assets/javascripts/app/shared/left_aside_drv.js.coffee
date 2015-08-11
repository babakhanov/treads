angular.module("app.shared").directive "leftAside", ->
  restrict: 'E'
  replace: true
  templateUrl: "layout/left_aside.html"
  scope: true
  controller: [ "$scope", "Tread", ($scope, Tread) ->
    Tread.index "", (response) ->
      $scope.treads = response.treads
  ] 
