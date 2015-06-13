class Spirit.Behaviours.CloudActive extends Spirit.Behaviours.Base
  constructor: (@sprite, @manager) ->
    super(@sprite, @manager)
    @initPhysics()

  initPhysics: ->
    @sprite.body.setCircle(160)
    @sprite.body.static = true
