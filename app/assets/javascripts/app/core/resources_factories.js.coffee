angular.module "app.core"
  .factory "Message", ($resource) ->
    $resource "/treads/:id/messages", { id: "@id" },
      create: method: "POST"
      index:  method: "GET"

  .factory "Tread", ($resource) ->
    $resource "/treads/:id", { id: "@id" },
      create: method: "POST"
      index:  method: "GET"
      show:   method: "GET"
