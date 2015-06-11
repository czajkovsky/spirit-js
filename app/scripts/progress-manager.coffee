class Spirit.ProgressManager

  constructor: ->
    @lives = 3
    @coinsCollected = 0
    @score = 0
    @colonyAmount = 3
    @scoreFactor = 1

  incScore: ->
    @coinsCollected += 1
    @score += @scoreFactor
    @_checkScoreFactor()

  decLive: ->
    @lives -= 1
    alert 'game over' if @lives == 0

  _checkScoreFactor: ->
    @scoreFactor = Math.max(1, parseInt(Math.sqrt(@coinsCollected), 10) - 1)
