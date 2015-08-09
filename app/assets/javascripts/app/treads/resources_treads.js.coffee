angular.module "app.treads"
  .factory "Tread", ($resource) ->
    $resource "/treads/:id", { id: "@id" },
      create:
        method: "POST"
      index:
        method: "GET"
        isArray: true
      destroy:
        method: "DELETE"
      update:
        method: "PATCH"
