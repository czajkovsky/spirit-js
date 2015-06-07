class Spirit.Group
  constructor: (@game) ->
    @container = @game.add.group()
    @container.enableBody = true
    @container.physicsBodyType = Phaser.Physics.BOX2D
