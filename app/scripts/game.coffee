class Spirit.Game

  constructor: ->
    @game = new Phaser.Game(Spirit.Helpers.size().width, Spirit.Helpers.size().height, Phaser.AUTO, '', @states())

  states: ->
   { preload: @preload, create: @create, update: @update }

  preload: ->
    @ui = new Spirit.UI(@game)
    @engine = new Spirit.Engine(@game)

    @engine.loadAssets()
    @engine.initPhysics()

  create: ->
    @engine.groupsManager.add('coin', Spirit.Behaviours.Coin)
    @engine.groupsManager.add('cloud_inactive', Spirit.Behaviours.CloudInactive)
    @engine.groupsManager.add('cloud_active', Spirit.Behaviours.CloudActive)
    @engine.groupsManager.add('enemy_random', Spirit.Behaviours.EnemyRandom)

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
    @engine.groupsManager.periodicGenerate('enemy_random', @game.world.randomX, @game.world.randomY)

    @engine.groupsManager.checkPending('cloud_active')
