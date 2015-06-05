class Spirit.Player

  constructor: (@game) ->
    @sprite = @game.add.sprite(0, 0, 'rocket')

  initPhysics: ->
    @sprite.anchor.setTo(0.5, 0.5)
    @sprite.body.allowRotation = false

  updateRotation: ->

