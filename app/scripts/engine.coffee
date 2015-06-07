class Spirit.Engine

  constructor: ->
    @game = new Phaser.Game(Spirit.Helpers.size().width, Spirit.Helpers.size().height, Phaser.AUTO, '', @states())

  states: ->
   { preload: @preload, create: @create, update: @update }

  preload: ->
    @ui = new Spirit.UI(@game)

    @game._engine = {}

    @createNewEnemy = false

    @game.load.image('rocket', 'images/rocket.png')
    @game.load.image('random-enemy', 'images/random-enemy.png')
    @game.load.image('cloud-inactive', 'images/cloud-inactive.png')
    @game.load.image('cloud-active', 'images/cloud-active.png')
    @game.load.image('coin', 'images/coin.png')

    @progressManager = new Spirit.ProgressManager()

    @game.physics.startSystem(Phaser.Physics.BOX2D);
    @game.physics.box2d.friction = 0;
    @game.physics.box2d.setBoundsToWorld()
    @game.physics.box2d.restitution = 1
    @game.physics.box2d.gravity.y = @game.physics.box2d.gravity.x = 0

    @game._engine.coins = @game.add.group()
    @game._engine.clouds = @game.add.group()
    # @activeClouds = @game.add.group()
    # @inactiveClouds = @game.add.group()

    @game._engine.clouds.enableBody = true
    @game._engine.clouds.physicsBodyType = Phaser.Physics.BOX2D


  create: ->
    @player = new Spirit.Player(@game)
    @game.stage.backgroundColor = '#172234'

    @fireTime = 0

    @game.physics.box2d.enable(@player.sprite, false)
    # @game.physics.box2d.enable(@coins, false)

    @game._engine.coins.enableBody = true
    @game._engine.coins.physicsBodyType = Phaser.Physics.BOX2D

    for i in [1..10] by 1
      _sprite = @game._engine.coins.create(@game.world.randomX, @game.world.randomY, 'coin')
      _sprite.body.setCollisionMask(Spirit.COLLISIONS_MASKS.coin)
      _sprite.body.setCollisionCategory(Spirit.COLLISIONS_CATEGORIES.coin)
      _sprite.events.onDestroy.add((-> @createNewEnemy = true), @)
      # _sprite.body.sensor = true
      # _sprite.body.setCategoryContactCallback(Spirit.COLLISIONS_CATEGORIES.player, (=> console.log @game._engine.coins.create(0, 0, 'coin')), @create)

    @player.initPhysics()
    @player.initCollisions()

    # new Spirit.Colony(@game, @progressManager)
    # new Spirit.Cloud(@game)
    # new Spirit.Coin(@game)
    # new Spirit.Coin(@game)
    # new Spirit.Coin(@game)
    # @colonyCretorIntervalId = setInterval((=> new Spirit.Colony(@game, @progressManager)), 10000)
    # @colonyCretorIntervalId = setInterval((=> new Spirit.Cloud(@game)), 10000)

    @ui.setScale()

    @game.physics.box2d.setBoundsToWorld()

  update: ->
    @player.updateRotation()

    if (@createNewEnemy)
      _sprite = @game._engine.coins.create(@game.world.randomX, @game.world.randomY, 'cloud-inactive')
      @createNewEnemy = false

    # if (@game.time.now > @fireTime)
    #   _sprite = @game._engine.coins.create(@game.world.randomX, @game.world.randomY, 'cloud-inactive')
    #   # _sprite.events.onDestroy.add((-> @game._engine.coins.create(0, 0, 'coin')), @)
    #   @fireTime = @game.time.now + 500
