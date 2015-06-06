class Spirit.Engine

  constructor: ->
    @game = new Phaser.Game(Spirit.Helpers.size().width, Spirit.Helpers.size().height, Phaser.AUTO, '', @states())

  states: ->
   { preload: @preload, create: @create, update: @update }

  preload: ->
    @ui = new Spirit.UI(@game)
    @game.load.image('rocket', 'images/rocket.png')
    @game.load.image('random-enemy', 'images/random-enemy.png')
    @progressManager = new Spirit.ProgressManager()

  create: ->
    @player = new Spirit.Player(@game)
    @game.stage.backgroundColor = '#2c3646'

    @game.physics.startSystem(Phaser.Physics.BOX2D);
    @game.physics.box2d.friction = 0;
    @game.physics.box2d.setBoundsToWorld()
    @game.physics.box2d.restitution = 1
    @game.physics.box2d.gravity.y = @game.physics.box2d.gravity.x = 0

    @game.physics.box2d.enable(@player.sprite, false)

    @player.initPhysics()
    @player.initCollisions()

    new Spirit.Colony(@game, @progressManager)
    @colonyCretorIntervalId = setInterval((=> new Spirit.Colony(@game, @progressManager) ), 10000)

    @ui.setScale()

  update: ->
    @player.updateRotation()
