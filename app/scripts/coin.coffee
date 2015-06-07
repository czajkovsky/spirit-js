class Spirit.Coin
  constructor: (@game) ->
    @sprite = @game.add.sprite(@game.world.randomX, @game.world.randomY, 'coin')
    @initPhysics()
    @initCollisions()
    # @active = false

  initPhysics: ->
    @game.physics.box2d.enable(@sprite, false)
    @sprite.body.linearDamping = 0

  initCollisions: ->
    @sprite.body.setCollisionMask(Spirit.COLLISIONS_MASKS.coin)
    @sprite.body.setCollisionCategory(Spirit.COLLISIONS_CATEGORIES.coin)
