class Spirit.Behaviours.EnemyFlying extends Spirit.Behaviours.EnemyBase
  constructor: (@sprite, @manager) ->
    super(@sprite, @manager)
    @initPhysics()

  initPhysics: ->
    @sign = 1
    @sprite.body.setCircle(40)

  fly: (world) ->
    offset = 50
    speed = 700
    @sign = -1 if @sprite.body.x > world.width - offset && @sign == 1
    @sign = 1 if @sprite.body.x < offset && @sign == -1
    @sprite.body.velocity.x = speed * @sign

