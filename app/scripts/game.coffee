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
    @engine.groupsManager.add('enemy_sticky', Spirit.Behaviours.EnemySticky)
    @engine.groupsManager.add('enemy_flying', Spirit.Behaviours.EnemyFlying)

    @player = new Spirit.Player(@engine, @game)
    @game.stage.backgroundColor = '#172234'

    @game.physics.box2d.enable(@player.sprite, false)

    @player.initPhysics()
    @player.initCollisions()

    @ui.setScale()

    @game.physics.box2d.setBoundsToWorld()

  update: ->
    @player.updateRotation()

    @engine.groupsManager.periodicGenerate('cloud_inactive', @game.world.randomX, @game.world.randomY)
    @engine.groupsManager.periodicGenerate('enemy_random', @game.world.randomX, @game.world.randomY)
    @engine.groupsManager.periodicGenerate('enemy_sticky', @game.world.randomX, @game.world.randomY)
    @engine.groupsManager.periodicGenerate('enemy_flying', @game.world.randomX, @game.world.randomY)

    @engine.groupsManager.checkPending('cloud_active')
    @engine.groupsManager.checkPending('coin')

    @engine.groupsManager.checkOutdated('cloud_active')

    @engine.groupsManager.get('enemy_sticky').items.forEach (item) =>
      item.behaviour.snapToPlayer(@player.sprite.body)

    @engine.groupsManager.get('enemy_flying').items.forEach (item) =>
      item.behaviour.fly(@game.world)
