class Spirit.ProgressManager

  constructor: ->
    @coinsCollected = 0
    @score = 0
    @colonyAmount = 3
    @scoreFactor = 1

  incScore: ->
    console.log @score, @scoreFactor
    @coinsCollected += 1
    @score += @scoreFactor
    @_checkScoreFactor()

  _checkScoreFactor: ->
    @scoreFactor = Math.max(1, parseInt(Math.sqrt(@coinsCollected), 10) - 1)
