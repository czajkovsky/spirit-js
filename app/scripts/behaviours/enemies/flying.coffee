class Spirit.Behaviours.EnemyFlying extends Spirit.Behaviours.EnemyBase
  initPhysics: ->
    @sign = 1
    @sprite.body.setCircle(40)

  @offsetX: (x, y, i) ->
    x

  @offsetY: (x, y, i) ->
    y + i * 105

  fly: (world) ->
    offset = 50
    speed = 700
    @sign = -1 if @sprite.body.x > world.width - offset && @sign == 1
    @sign = 1 if @sprite.body.x < offset && @sign == -1
    distanceFactor = @_distanceFrom(world.width / 2)
    @sprite.body.velocity.x = (250 + world.width / 2 - distanceFactor) * @sign

  _distanceFrom: (x) ->
    return x - @sprite.body.x if @sprite.body.x < x
    @sprite.body.x - x
