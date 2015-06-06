class Spirit.UI

  constructor: (game) ->
    @game = game

  pixelRatio: ->
    window.devicePixelRatio

  setScale: ->
    @game.scale.maxWidth = Math.round(@game.canvas.width / @pixelRatio());
    @game.scale.maxHeight = Math.round(@game.canvas.height / @pixelRatio());
    @game.scale.minWidth = Math.round(@game.canvas.width / @pixelRatio());
    @game.scale.minHeight = Math.round(@game.canvas.height / @pixelRatio());
    @game.scale.refresh();
