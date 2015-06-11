class Spirit.Game

  constructor: ->
    @game = new Phaser.Game(Spirit.Helpers.size().width, Spirit.Helpers.size().height, Phaser.AUTO, '', @states())

  states: ->
   { preload: @preload, create: @create, update: @update }

  preload: ->
    @ui = new Spirit.UI(@game)
    @engine = new Spirit.Engine(@game)

    @progressManager = new Spirit.ProgressManager()

    @engine.loadAssets()
    @engine.initPhysics()

  create: ->
    @engine.coins = new Spirit.Group(@game, 'coin')
    @engine.clouds = new Spirit.Group(@game, 'cloud_inactive')

    @player = new Spirit.Player(@game)
    @game.stage.backgroundColor = '#172234'

    @game.physics.box2d.enable(@player.sprite, false)

    @player.initPhysics()
    @player.initCollisions()

    @ui.setScale()

    @game.physics.box2d.setBoundsToWorld()

  update: ->
    @player.updateRotation()

    if (@game.time.now > @engine.firetime.cloud)
      _sprite = @engine.clouds.create(@game.world.randomX, @game.world.randomY)
      @engine.firetime.cloud = @game.time.now + 500

    #   # _sprite.events.onDestroy.add((-> @game._engine.coins.create(0, 0, 'coin')), @)
    #   @fireTime = @game.time.now + 500
