class Spirit.Wall
  constructor: (@game, x, y, angle) ->
    rectangle = new Phaser.Physics.Box2D.Body(@game, null, 345, @game.world.centerY - 150, 0.5);
    rectangle.setRectangle(90, 50, 0, 0, 0);
