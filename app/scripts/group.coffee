class Spirit.Group
  constructor: (@game, @key) ->
    @container = @game.add.group()
    @container.enableBody = true
    @container.physicsBodyType = Phaser.Physics.BOX2D
    @mask = Spirit.COLLISIONS_MASKS[@key]
    @category = Spirit.COLLISIONS_CATEGORIES[@key]

  create: (x, y) ->
    _sprite = @container.create(x, y, @key)
    _sprite.body.setCollisionMask(@mask)
    _sprite.body.setCollisionCategory(@category)
