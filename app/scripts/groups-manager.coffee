class Spirit.GroupsManager
  constructor: (@game) ->
    @groups = {}

  add: (key) ->
    @groups[key] = {}
    @groups[key].lastGenerationTime = 0
    @groups[key].data = new Spirit.Group(@game, key)

  periodicGenerate: (key, x, y) ->
    if @game.time.now > @groups[key].lastGenerationTime + Spirit.GROUP_INTERVALS[key]
      @groups[key].data.create(x, y)
      @groups[key].lastGenerationTime = @game.time.now
