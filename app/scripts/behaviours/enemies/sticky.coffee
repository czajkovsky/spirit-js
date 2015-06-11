class Spirit.Behaviours.EnemySticky extends Spirit.Behaviours.EnemyBase
  constructor: (@sprite, @manager) ->
    super(@sprite, @manager)
    @initPhysics()

  initPhysics: ->
    @sprite.body.setCircle(40)

  snapToPlayer: (player) ->
    speed = 80
    enemy = @sprite.body
    angle = Math.atan2(player.y - enemy.y, player.x - enemy.x)
    enemy.rotation = angle
    @sprite.body.velocity.y = Math.sin(angle) * speed
    @sprite.body.velocity.x = Math.cos(angle) * speed

