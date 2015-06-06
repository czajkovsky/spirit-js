class Spirit.Colony

  constructor: (@game, @progressManager) ->
    @corner = parseInt(Math.random() * 100, 10) % 4 # 0: upper-left, 3: bottom-right
    @colonyType = parseInt(Math.random() * 100, 10) % 3 # 0: random, 1: stright, 2: follow
    @createEnemies()

  createEnemies: ->
    for i in [1..@progressManager.colonyAmount] by 1
      new Spirit.Enemies.Random(@game, 400 + i * 10, 400 + i * 20)

