Spinner = ->
  request = 0
  @block = false

  @add = ->
    request += 1 unless @block
    @block = false
    $("body").addClass("spinner") if request > 0

  @remove = ->
    request -= 1 if request > 0
    $("body").removeClass("spinner") if request == 0

  @

angular.module "app.core"
  .service "Spinner", [Spinner]
