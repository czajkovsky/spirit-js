class Spirit.Engine
  constructor: (@game) ->
    @groupsManager = new Spirit.GroupsManager(@game)
    @progressManager = new Spirit.ProgressManager()

  loadAssets: ->
    @game.load.image('rocket', 'images/rocket.png')
    @game.load.image('random_enemy', 'images/random-enemy.png')
    @game.load.image('cloud_inactive', 'images/cloud-inactive.png')
    @game.load.image('cloud_active', 'images/cloud-active.png')
    @game.load.image('coin', 'images/coin.png')

  initPhysics: ->
    @game.physics.startSystem(Phaser.Physics.BOX2D);
    @game.physics.box2d.friction = 0;
    @game.physics.box2d.setBoundsToWorld()
    @game.physics.box2d.restitution = 1
    @game.physics.box2d.gravity.y = @game.physics.box2d.gravity.x = 0
