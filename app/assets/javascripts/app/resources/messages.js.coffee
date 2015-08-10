angular.module "app.resources"
  .factory "Message", ($resource) ->
    $resource "/treads/:id/messages", { id: "@id" },
      create:
        method: "POST"
      index:
        method: "GET"
      destroy:
        method: "DELETE"
      update:
        method: "PATCH"
