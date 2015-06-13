class Spirit.ProgressManager

  constructor: (@engine) ->
    @_setDefaults()

  incScore: ->
    @coinsCollected += 1
    @score += @scoreFactor
    @_checkScoreFactor()

  decLive: ->
    @lives -= 1
    @engine.stop() if @lives == 0

  reset: ->
    @_setDefaults()

  _setDefaults: ->
    @lives = 3
    @coinsCollected = 0
    @score = 0
    @colonyAmount = 3
    @scoreFactor = 1

  _checkScoreFactor: ->
    @scoreFactor = Math.max(1, parseInt(Math.sqrt(@coinsCollected), 10) - 1)
    @colonyAmount = 3 + parseInt(Math.sqrt(@coinsCollected / 10), 10)
