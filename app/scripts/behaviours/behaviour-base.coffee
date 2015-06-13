class Spirit.Behaviours.Base
  constructor: (@sprite, @engine) ->
    @manager = @engine.groupsManager
    @initCollisions()
    @initPhysics()

  initPhysics: ->
    # abstract

  initCollisions: ->
    # abstract

  _randomVelocity: ->
    sign = (if Math.random() > 0.5 then -1 else 1)
    base = parseInt(Math.random() * 100, 10) + 10
    sign * base
