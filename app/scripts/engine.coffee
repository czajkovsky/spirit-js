class Spirit.Engine

  constructor: ->
    @player = undefined
    @game = new Phaser.Game(Spirit.Helpers.size().width, Spirit.Helpers.size().height, Phaser.AUTO, '', @states())
    @ui = new Spirit.UI(@game)

  states: ->
   { preload: @preload, create: @create, update: @update }

  preload: ->
    @ui = new Spirit.UI(@game)
    @game.load.image('rocket', 'images/rocket.png')

  create: ->
    @player = new Spirit.Player(@game)
    @game.stage.backgroundColor = '#2c3646'
    @game.physics.enable(@player.sprite, Phaser.Physics.ARCADE)
    @player.initPhysics()

    @colonyCretorIntervalId = setInterval((=> new Spirit.Colony(@game) ), 3000)

    @ui.setScale()

  update: ->
    @player.updateRotation()



