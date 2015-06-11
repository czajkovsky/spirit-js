class Spirit.GroupsManager
  constructor: (@game) ->
    @groups = {}
    @queue = {}

  add: (key, isMoving) ->
    @groups[key] = {}
    @groups[key].lastGenerationTime = 0
    @groups[key].data = new Spirit.Group(@, @game, key, isMoving)

  markForCreation: (key, position) ->
    @queue[key] = position

  checkPending: (key) ->
    if @queue[key]?
      @groups[key].data.create(@queue[key].x, @queue[key].y)
      delete @queue[key]

  periodicGenerate: (key, x, y) ->
    if @game.time.now > @groups[key].lastGenerationTime + Spirit.GROUP_INTERVALS[key]
      @groups[key].data.create(x, y)
      @groups[key].lastGenerationTime = @game.time.now + parseInt(Math.random() * Spirit.GROUP_INTERVALS[key], 10)
