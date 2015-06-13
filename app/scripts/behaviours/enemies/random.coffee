class Spirit.Behaviours.EnemyRandom extends Spirit.Behaviours.EnemyBase
  constructor: (@sprite, @manager) ->
    super(@sprite, @manager)
    @initPhysics()

  initPhysics: ->
    @sprite.body.velocity.x = @_randomVelocity()
    @sprite.body.velocity.y = @_randomVelocity()
    @sprite.body.angle = parseInt(Math.random() * 100, 10) % 90
    @sprite.body.rotateLeft(parseInt(Math.random() * 100, 10) % 90)
    @sprite.body.setCircle(40)

  @offsetX: (x, y, i) ->
    x + parseInt(Math.random() * 1000, 10) % 100

  @offsetY: (x, y, i) ->
    x + parseInt(Math.random() * 1000, 10) % 100
