class Spirit.UI

  constructor: (game) ->
    @game = game
    @controls = {}

  pixelRatio: ->
    window.devicePixelRatio

  setScale: ->
    @game.scale.maxWidth = Math.round(@game.canvas.width / @pixelRatio())
    @game.scale.maxHeight = Math.round(@game.canvas.height / @pixelRatio())
    @game.scale.minWidth = Math.round(@game.canvas.width / @pixelRatio())
    @game.scale.minHeight = Math.round(@game.canvas.height / @pixelRatio())
    @game.scale.refresh()

  addText: (id, message, x, y) ->
    @controls[id] = @game.add.text(x, y, message, @_textStyle('left'))

  updateText: (id, newMessage) ->
    @controls[id].setText(newMessage)

  _textStyle: (align)->
    {
      font: "50px 'Helvetica Neue', Helvetica, Arial, sans-serif",
      fontWeight: 'bold',
      fill: "#fff",
      align: align
    }
