class Spirit.Group
  constructor: (@engine, @key, @behaviour) ->
    @game = @engine.game
    @container = @game.add.group()
    @container.enableBody = true
    @container.physicsBodyType = Phaser.Physics.BOX2D
    @manager = @engine.groupsManager
    @mask = Spirit.COLLISIONS_MASKS[@key]
    @category = Spirit.COLLISIONS_CATEGORIES[@key]
    @items = []

  create: (x, y) ->
    _sprite = @container.create(x, y, @key)
    _behaviour = new @behaviour(_sprite, @engine)
    _sprite.body.setCollisionMask(@mask)
    _sprite.body.setCollisionCategory(@category)
    _sprite.createdAt =  @game.time.now
    _sprite.isAnimated = false
    @items.push( sprite: _sprite, behaviour: _behaviour, createdAt: @game.time.now)

  checkOutdated: (offset) ->
    @items.forEach (item, index) =>
      if item.createdAt + offset + 500 < @game.time.now && !item.isAnimated
        item.sprite.destroy()
        @items.splice(index, 1)
      else if item.createdAt + offset - 500 < @game.time.now && !item.isAnimated
        @bounce(item)

  bounce: (item) ->
    item.isAnimated = true
    scaleOut = @game.add.tween(item.sprite.scale).to( { x: 0, y: 0 }, 500, Phaser.Easing.Bounce.Out)
    fadeOut = @game.add.tween(item.sprite).to( { alpha: 0 }, 250, Phaser.Easing.Bounce.Out)

    @game.add.tween(item.sprite.scale)
      .to({ x: 0.95, y: 0.95 }, 300, Phaser.Easing.Linear.None)
      .to({ x: 1, y: 1 }, 300, Phaser.Easing.Linear.None)
      .repeatAll(2)
      .start()
    @game.add.tween(item.sprite)
      .to( { alpha: 0.5 }, 300, Phaser.Easing.Linear.None)
      .to( { alpha: 1 }, 300, Phaser.Easing.Linear.None)
      .repeatAll(2)
      .start()
      .onComplete.add(->
        scaleOut.start()
        fadeOut.start()
        scaleOut.onComplete.add(-> item.isAnimated = false)
      )





