angular.module "app.resources"
  .factory "Tread", ($resource) ->
    $resource "/treads/:id", { id: "@id" },
      create:
        method: "POST"
      index:
        method: "GET"
      show:
        method: "GET"
      destroy:
        method: "DELETE"
      update:
        method: "PATCH"
