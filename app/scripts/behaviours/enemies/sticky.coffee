class Spirit.Behaviours.EnemySticky extends Spirit.Behaviours.EnemyBase
  constructor: (@sprite, @manager) ->
    super(@sprite, @manager)
    @initPhysics()

  initPhysics: ->
    @sprite.body.setCircle(40)

  @offsetX: (x, y, i) ->
    x + parseInt(Math.random() * 1000, 10) % 300

  @offsetY: (x, y, i) ->
    x + parseInt(Math.random() * 1000, 10) % 300

  snapToPlayer: (player) ->
    speed = 80
    enemy = @sprite.body
    angle = Math.atan2(player.y - enemy.y, player.x - enemy.x)
    enemy.rotation = angle
    @sprite.body.velocity.y = Math.sin(angle) * speed
    @sprite.body.velocity.x = Math.cos(angle) * speed

