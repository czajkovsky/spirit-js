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

  # initCollisions: ->
  #   @sprite.body.setCollisionMask(Spirit.COLLISIONS_MASKS.enemy)
  #   @sprite.body.setCollisionCategory(Spirit.COLLISIONS_CATEGORIES.enemy)
  #   @sprite.body.setCategoryPresolveCallback(Spirit.COLLISIONS_CATEGORIES.player, @_enemyCollision, @)
