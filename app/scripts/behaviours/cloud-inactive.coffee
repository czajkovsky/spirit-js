class Spirit.Behaviours.CloudInactive extends Spirit.Behaviours.Base
  constructor: (@sprite) ->
    super(@sprite)
    @initPhysics()

  initPhysics: ->
    @sprite.body.velocity.x = @_randomVelocity()
    @sprite.body.velocity.y = @_randomVelocity()
    @sprite.body.setCircle(50)
