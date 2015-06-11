class Spirit.Behaviours.EnemyBase extends Spirit.Behaviours.Base
  constructor: (@sprite, @manager) ->
    super(@sprite, @manager)
    @initCollisions()

  initCollisions: ->
    @sprite.body.setCollisionMask(Spirit.COLLISIONS_MASKS.enemy_random)
    @sprite.body.setCollisionCategory(Spirit.COLLISIONS_CATEGORIES.enemy_random)
    @sprite.body.setCategoryPresolveCallback(Spirit.COLLISIONS_CATEGORIES.cloud_active, @_cloudCollision, @)

  _cloudCollision: (enemy, cloud, _fixture1, _fixture2, begin) ->
    return unless begin
    @manager.markForCreation('coin', { x: @sprite.x, y: @sprite.y })
    @sprite.destroy()
