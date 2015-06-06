class Spirit.Player

  constructor: (@game) ->
    @sprite = @game.add.sprite(300, 300, 'rocket')

  initPhysics: ->
    @sprite.anchor.setTo(0.5, 0.5)
    @sprite.body.allowRotation = false
    @sprite.body.collideWorldBounds = true
    @sprite.body.setCircle(42)

  initCollisions: ->
    @sprite.body.setCollisionMask(Spirit.COLLISIONS_MASKS.player)
    @sprite.body.setCollisionCategory(Spirit.COLLISIONS_CATEGORIES.player)
    @sprite.body.setCategoryPresolveCallback(Spirit.COLLISIONS_CATEGORIES.enemy, @_enemyCollision, @)

  updateRotation: ->
    @sprite.body.rotation = @game.physics.arcade.moveToPointer(@sprite, 10, @game.input.activePointer, 350)

  _enemyCollision: (body1, body2, fixture1, fixture2, begin) ->
    console.log 'enemy collission'
