class Spirit.Behaviours.CloudActive extends Spirit.Behaviours.Base
  constructor: (@sprite) ->
    super(@sprite)
    @initPhysics()

  initPhysics: ->
    @sprite.body.setCircle(160)
    @sprite.body.static = true
