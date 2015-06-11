class Spirit.Group
  constructor: (@manager, @game, @key, @behaviour) ->
    @container = @game.add.group()
    @container.enableBody = true
    @container.physicsBodyType = Phaser.Physics.BOX2D
    @mask = Spirit.COLLISIONS_MASKS[@key]
    @category = Spirit.COLLISIONS_CATEGORIES[@key]
    @items = []

  create: (x, y) ->
    _sprite = @container.create(x, y, @key)
    _behaviour = new @behaviour(_sprite, @manager)
    _sprite.body.setCollisionMask(@mask)
    _sprite.body.setCollisionCategory(@category)
    _sprite.createdAt =  @game.time.now
    @items.push( sprite: _sprite, behaviour: _behaviour, createdAt: @game.time.now)

  checkOutdated: (offset) ->
    @items.forEach (item, index) =>
      if item.createdAt + offset < @game.time.now
        item.sprite.destroy()
        @items.splice(index, 1)


