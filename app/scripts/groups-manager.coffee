class Spirit.GroupsManager
  constructor: (@game, @progressManager) ->
    @groups = {}
    @queue = {}

  add: (key, behaviour, isColony) ->
    @groups[key] = {}
    @groups[key].lastGenerationTime = 0
    @groups[key].data = new Spirit.Group(@, @game, key, behaviour)
    @groups[key].isColony = isColony

  get: (key) ->
    @groups[key].data

  markForCreation: (key, position) ->
    @queue[key] = position

  checkPending: (key) ->
    if @queue[key]?
      @groups[key].data.create(@queue[key].x, @queue[key].y)
      delete @queue[key]

  checkOutdated: (key) ->
    @groups[key].data.checkOutdated(Spirit.GROUP_PERIODS[key])

  periodicGenerate: (key, x, y) ->
    if @game.time.now > @groups[key].lastGenerationTime + Spirit.GROUP_INTERVALS[key]
      if @groups[key].isColony then @createColony(key, x, y) else @createSingle(key, x, y)
      @groups[key].lastGenerationTime = @game.time.now + parseInt(Math.random() * Spirit.GROUP_INTERVALS[key], 10)

  createColony: (key, x, y) ->
    for i in [1..@progressManager.colonyAmount] by 1
      @groups[key].data.create(x, y + 105 * i)

  createSingle: (key, x, y) ->
    @groups[key].data.create(x, y)

