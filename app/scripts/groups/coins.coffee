class Spirit.Groups.Coins extends Spirit.Group
  constructor: (@game) ->
    super(@game)

  create: (x, y) ->
    _sprite = @container.create(x, y, 'coin')
    _sprite.body.setCollisionMask(Spirit.COLLISIONS_MASKS.coin)
    _sprite.body.setCollisionCategory(Spirit.COLLISIONS_CATEGORIES.coin)
