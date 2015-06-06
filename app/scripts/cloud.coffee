class Spirit.Cloud
  constructor: (@game) ->
    @sprite = @game.add.sprite(@game.world.randomX, @game.world.randomY, 'cloud-inactive')
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
    @sprite.body.setCollisionMask(Spirit.COLLISIONS_MASKS.cloud_inactive)
    @sprite.body.setCollisionCategory(Spirit.COLLISIONS_CATEGORIES.cloud_inactive)

  randomVelocity: ->
    sign = (if Math.random() > 0.5 then -1 else 1)
    base = parseInt(Math.random() * 100, 10)
    sign * base
