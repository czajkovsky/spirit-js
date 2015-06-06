class Spirit.Enemies.Random
  constructor: (@game, x, y) ->
    @sprite = @game.add.sprite(@game.world.randomX, @game.world.randomY, 'random-enemy')
    @initPhysics()
    @initCollisions()

  initPhysics: ->
    @game.physics.box2d.enable(@sprite, false)
    @sprite.body.velocity.x = @randomVelocity()
    @sprite.body.velocity.y = @randomVelocity()
    @sprite.body.linearDamping = 0
    @sprite.body.angle = parseInt(Math.random() * 100, 10) % 90
    @sprite.body.rotateLeft(parseInt(Math.random() * 100, 10) % 90)

  initCollisions: ->
    @sprite.body.setCollisionMask(Spirit.COLLISIONS_MASKS.enemy)
    @sprite.body.setCollisionCategory(Spirit.COLLISIONS_CATEGORIES.enemy)
    @sprite.body.setCategoryPresolveCallback(Spirit.COLLISIONS_CATEGORIES.player, @_enemyCollision, @)

  randomVelocity: ->
    sign = (if Math.random() > 0.5 then -1 else 1)
    base = parseInt(Math.random() * 100, 10)
    sign * base
