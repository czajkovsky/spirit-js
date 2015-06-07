class Spirit.Cloud
  constructor: (@game) ->
    @sprite = @game.add.sprite(@game.world.randomX, @game.world.randomY, 'cloud-inactive')
    @sprite.wrapper = this
    @initPhysics()
    @initCollisions()
    @active = false

  activate: ->
    return if @active
    @active = true
    # @sprite.body.destroy()

    @sprite.loadTexture('cloud-active', 0)
    @sprite.body.setZeroVelocity()
    @sprite.body.velocity.x = @randomVelocity()
    # @sprite.body.setCollisionMask(Spirit.COLLISIONS_MASKS.cloud_inactive)
    # @sprite.body.setCollisionCategory(Spirit.COLLISIONS_CATEGORIES.cloud_inactive)
    # @sprite.body.setCategoryPresolveCallback(Spirit.COLLISIONS_CATEGORIES.cloud_inactive, @_enemyCollision, @)
    @game.physics.box2d.enable(@sprite, false)


  initPhysics: ->
    @game.physics.box2d.enable(@sprite, false)
    @sprite.body.velocity.x = @randomVelocity()
    @sprite.body.velocity.y = @randomVelocity()
    @sprite.body.linearDamping = 0

  initCollisions: ->
    @sprite.body.setCollisionMask(Spirit.COLLISIONS_MASKS.cloud_inactive)
    @sprite.body.setCollisionCategory(Spirit.COLLISIONS_CATEGORIES.cloud_inactive)

  randomVelocity: ->
    sign = (if Math.random() > 0.5 then -1 else 1)
    base = parseInt(Math.random() * 100, 10)
    sign * base

  _enemyCollision: (cloud, enemy, fixture1, fixture2, begin) ->
    console.log 'asfasafs'
    enemy.sprite.destroy()
