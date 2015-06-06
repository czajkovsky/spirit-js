class Spirit.Colony

  constructor: (@game) ->
    @corner = parseInt(Math.random() * 100, 10) % 4 # 0: upper-left, 3: bottom-right
    @colonyType = parseInt(Math.random() * 100, 10) % 3 # 0: random, 1: stright, 2: follow

