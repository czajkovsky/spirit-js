class Spirit.Player

  constructor: (@engine, @game) ->
    @sprite = @game.add.sprite(300, 300, 'rocket')

  initPhysics: ->
    @sprite.anchor.setTo(0.5, 0.5)
    @sprite.body.allowRotation = false
    @sprite.body.collideWorldBounds = true
    @sprite.body.setCircle(42)

  initCollisions: ->
    @sprite.body.setCollisionMask(Spirit.COLLISIONS_MASKS.player)
    @sprite.body.setCollisionCategory(Spirit.COLLISIONS_CATEGORIES.player)
    @sprite.body.setCategoryPresolveCallback(Spirit.COLLISIONS_CATEGORIES.enemy_random, @_enemyCollision, @)
    @sprite.body.setCategoryContactCallback(Spirit.COLLISIONS_CATEGORIES.cloud_inactive, @_cloudCollision, @)
    @sprite.body.setCategoryContactCallback(Spirit.COLLISIONS_CATEGORIES.coin, @_coinCollision, @)

  updateRotation: ->
    @sprite.body.rotation = @game.physics.arcade.moveToPointer(@sprite, 10, @game.input.activePointer, 350)

  _enemyCollision: (rocket, enemy, _fixture1, _fixture2, begin) ->
    return unless begin
    enemy.sprite.destroy()
    @engine.progressManager.decLive()

  _coinCollision: (rocket, coin, _fixture1, _fixture2, begin) ->
    return unless begin
    coin.sprite.destroy()
    @engine.progressManager.incScore()

  _cloudCollision: (rocket, cloud, _fixture1, _fixture2, begin) ->
    return unless begin
    @engine.groupsManager.markForCreation('cloud_active', { x: cloud.sprite.x, y: cloud.sprite.y })
    cloud.sprite.destroy()

  test: ->
    console.log 'testa'
    # new Spirit.Cloud(@game)

    # cloud.sprite.wrapper.activate() unless begin
    # cloud.sprite.destroy()
    # new Spirit.CloudActive(@game)

