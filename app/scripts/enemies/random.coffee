class Spirit.Enemies.Random
  constructor: (@game, x, y) ->
    @sprite = @game.add.sprite(0, 0, 'random-enemy')
    @initPhysics()

  initPhysics: ->
    # @game.physics.enable(@sprite, Phaser.Physics.P2JS)
    @game.physics.box2d.enable(@sprite, false)
    @sprite.body.velocity.x = @randomVelocity()
    @sprite.body.velocity.y = @randomVelocity()
    @sprite.body.linearDamping = 0
    @sprite.body.allowRotation = false
    # debugger
    # @sprite.body.kinematic = true

    # @sprite.body.gravity.y = 0;
    # @sprite.body.gravity.x = 0;
    # @sprite.body.collideWorldBounds = true
    # @sprite.body.damping = 0;
    # @sprite.body.dynamic = true;




  randomVelocity: ->
    sign = (if Math.random() > 0.5 then -1 else 1)
    base = parseInt(Math.random() * 100, 10) + 100
    sign * base
