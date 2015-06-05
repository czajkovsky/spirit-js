class Spirit.Player

  constructor: (@game) ->
    @sprite = @game.add.sprite(0, 0, 'rocket')

  initPhysics: ->
    @sprite.anchor.setTo(0.5, 0.5)
    @sprite.body.allowRotation = false
    @sprite.body.collideWorldBounds = true

  updateRotation: ->
    @sprite.rotation = @game.physics.arcade.moveToPointer(@sprite, 80, @game.input.activePointer, 500)


