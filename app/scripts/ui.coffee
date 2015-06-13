class Spirit.UI

  constructor: (game) ->
    @game = game
    @controls = {}
    @logo = null
    @uiControls = {}

  pixelRatio: ->
    window.devicePixelRatio

  setScale: ->
    @game.scale.maxWidth = Math.round(@game.canvas.width / @pixelRatio())
    @game.scale.maxHeight = Math.round(@game.canvas.height / @pixelRatio())
    @game.scale.minWidth = Math.round(@game.canvas.width / @pixelRatio())
    @game.scale.minHeight = Math.round(@game.canvas.height / @pixelRatio())
    @game.scale.refresh()

  addText: (id, message, x, y, align) ->
    @controls[id] = @game.add.text(x, y, message, @_textStyle(align))
    @controls[id].anchor.setTo(0.5) if align == 'center'

  updateText: (id, newMessage) ->
    @controls[id].setText(newMessage)

  displayLogo: ->
    @logo = @game.add.sprite(@game.world.centerX - 767 / 2 + 10, @game.world.centerY - 235 / 2 - 70, 'logo')

  removeLogo: ->
    @logo.destroy()

  removeText: (id) ->
    @controls[id].destroy()

  _textStyle: (align)->
    {
      font: "50px 'Helvetica Neue', Helvetica, Arial, sans-serif",
      fontWeight: 'bold',
      fill: "#fff",
      align: align
    }
