angular.module "app.shared"
  .factory "User", ($resource) ->
    $resource "/users/:id", { id: "@id" },
      create:
        method: "POST"
      index:
        method: "GET"
      destroy:
        method: "DELETE"
      update:
        method: "PATCH"
