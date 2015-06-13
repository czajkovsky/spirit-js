class Spirit.Behaviours.EnemySticky extends Spirit.Behaviours.EnemyBase
  constructor: (@sprite, @manager) ->
    super(@sprite, @manager)
    @initPhysics()

  initPhysics: ->
    @sprite.body.setCircle(40)

  @offsetX: (x, y, i) ->
    rand = parseInt(Math.random() * 1000, 10) % 100
    x + (rand * (if rand % 2 > 0 then -1 else 1))

  @offsetY: (x, y, i) ->
    rand = parseInt(Math.random() * 1000, 10) % 100
    y + (rand * (if rand % 2 > 0 then -1 else 1))

  snapToPlayer: (player) ->
    speed = 80
    enemy = @sprite.body
    angle = Math.atan2(player.y - enemy.y, player.x - enemy.x)
    enemy.rotation = angle
    @sprite.body.velocity.y = Math.sin(angle) * speed
    @sprite.body.velocity.x = Math.cos(angle) * speed

