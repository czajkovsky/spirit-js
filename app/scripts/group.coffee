class Spirit.Group
  constructor: (@game, @key, @isMoving) ->
    @container = @game.add.group()
    @container.enableBody = true
    @container.physicsBodyType = Phaser.Physics.BOX2D
    @mask = Spirit.COLLISIONS_MASKS[@key]
    @category = Spirit.COLLISIONS_CATEGORIES[@key]

  create: (x, y) ->
    _sprite = @container.create(x, y, @key)
    _sprite.body.setCollisionMask(@mask)
    _sprite.body.setCollisionCategory(@category)
    if @isMoving
      _sprite.body.velocity.x = @_randomVelocity()
      _sprite.body.velocity.y = @_randomVelocity()

  _randomVelocity: ->
    sign = (if Math.random() > 0.5 then -1 else 1)
    base = parseInt(Math.random() * 100, 10)
    sign * base


