class Spirit.Engine
  constructor: (@game, @ui) ->
    @progressManager = new Spirit.ProgressManager(@)
    @groupsManager = new Spirit.GroupsManager(@)
    @state = 'init'
    @player = null

  loadAssets: ->
    @game.load.image('rocket', 'images/rocket.png')
    @game.load.image('enemy_random', 'images/random-enemy.png')
    @game.load.image('enemy_sticky', 'images/sticky-enemy.png')
    @game.load.image('enemy_flying', 'images/flying-enemy.png')
    @game.load.image('cloud_inactive', 'images/cloud-inactive.png')
    @game.load.image('cloud_active', 'images/cloud-active.png')
    @game.load.image('coin', 'images/coin.png')
    @game.load.image('background', 'images/background.png');
    @game.load.image('coins', 'images/coins.png');
    @game.load.image('heart', 'images/heart.png');
    @game.load.image('logo', 'images/logo.png');

  initPhysics: ->
    @game.physics.startSystem(Phaser.Physics.BOX2D);
    @game.physics.box2d.friction = 0;
    @game.physics.box2d.setBoundsToWorld()
    @game.physics.box2d.restitution = 1
    @game.physics.box2d.gravity.y = @game.physics.box2d.gravity.x = 0

  handleState: ->
    return @reset() if @state == 'game-over'
    @run() if @state == 'pre'

  start: (player) ->
    @player = player
    @ui.displayLogo()
    @ui.addText('welcome', 'Click/tap on the screen to start', @game.world.centerX, @game.world.centerY + 130, 'center')
    @state = 'pre'

  run: ->
    @ui.removeLogo()
    @ui.removeText('welcome')
    @ui.updateText('score', '0')
    @ui.updateText('lives', '3')
    @state = 'playing'
    @player.protect()

  reset: ->
    @progressManager.reset()
    @ui.removeText('game-over')
    @run()

  stop: ->
    @ui.updateText('lives', '0')
    @groupsManager.reset()
    @ui.displayLogo()
    @ui.addText('game-over', 'Game over :(', @game.world.centerX, @game.world.centerY + 130, 'center')
    @state = 'game-over'

