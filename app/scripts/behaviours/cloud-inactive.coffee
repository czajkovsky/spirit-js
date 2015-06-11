class Spirit.Behaviours.CloudInactive extends Spirit.Behaviours.Base
  constructor: (@sprite, @manager) ->
    super(@sprite, @manager)
    @initPhysics()

  initPhysics: ->
    @sprite.body.velocity.x = @_randomVelocity()
    @sprite.body.velocity.y = @_randomVelocity()
    @sprite.body.setCircle(50)
