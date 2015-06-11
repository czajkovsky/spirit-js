class Spirit.Cloud
  constructor: (@group, x, y) ->
    @sprite = @group.create(x, y, 'cloud-inactive')
    @initPhysics()
    @initCollisions()
    @active = false

  initPhysics: ->
    @sprite.body.velocity.x = @randomVelocity()
    @sprite.body.velocity.y = @randomVelocity()

  # initCollisions: ->
  #   @sprite.body.setCollisionMask(Spirit.COLLISIONS_MASKS.cloud_inactive)
  #   @sprite.body.setCollisionCategory(Spirit.COLLISIONS_CATEGORIES.cloud_inactive)

  # randomVelocity: ->
  #   sign = (if Math.random() > 0.5 then -1 else 1)
  #   base = parseInt(Math.random() * 100, 10)
  #   sign * base

  # _enemyCollision: (cloud, enemy, fixture1, fixture2, begin) ->
  #   console.log 'asfasafs'
  #   enemy.sprite.destroy()
