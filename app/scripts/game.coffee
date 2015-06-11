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
    @engine.groupsManager.add('coin', false)
    @engine.groupsManager.add('cloud_inactive', true)
    @engine.groupsManager.add('cloud_active', false)

    @player = new Spirit.Player(@engine, @game)
    @game.stage.backgroundColor = '#172234'

    @game.physics.box2d.enable(@player.sprite, false)

    @player.initPhysics()
    @player.initCollisions()

    @ui.setScale()

    @game.physics.box2d.setBoundsToWorld()

  update: ->
    @player.updateRotation()
    @engine.groupsManager.periodicGenerate('coin', @game.world.randomX, @game.world.randomY)
    @engine.groupsManager.periodicGenerate('cloud_inactive', @game.world.randomX, @game.world.randomY)

    @engine.groupsManager.checkPending('cloud_active')



    # if (@game.time.now > @engine.firetime.cloud)
    #   _sprite = @engine.clouds.create(@game.world.randomX, @game.world.randomY)
    #   @engine.firetime.cloud = @game.time.now + 500

    #   # _sprite.events.onDestroy.add((-> @game._engine.coins.create(0, 0, 'coin')), @)
    #   @fireTime = @game.time.now + 500
