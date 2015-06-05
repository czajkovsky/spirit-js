Spirit.gameStates =

  preload: ->
    Spirit.game.load.image('rocket', 'images/rocket.png')

  create: ->
    Spirit.player = new Spirit.Player(Spirit.game)
    Spirit.game.stage.backgroundColor = '#2c3646'
    Spirit.game.physics.enable(Spirit.player.sprite, Phaser.Physics.ARCADE)

  update: ->
    Spirit.player.updateRotation()
