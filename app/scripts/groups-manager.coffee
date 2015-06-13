class Spirit.GroupsManager
  constructor: (@engine) ->
    @game = @engine.game
    @progressManager = @engine.progressManager
    @groups = {}
    @queue = {}

  add: (key, behaviour, isColony) ->
    @groups[key] = {}
    @groups[key].lastGenerationTime = 0
    @groups[key].data = new Spirit.Group(@engine, key, behaviour)
    @groups[key].isColony = isColony
    @queue[key] = []

  get: (key) ->
    @groups[key].data

  reset: ->
    for key, group of @groups
      for itemKey, item of group.data.items
        item.sprite.destroy()
      group.data.items = []

  markForCreation: (key, position) ->
    @queue[key].push(position)

  checkPending: (key) ->
    if @queue[key].length > 0
      for position, index in @queue[key]
        @groups[key].data.create(position.x, position.y) if position?
        @queue[key].splice(index, 1)

  checkOutdated: (key) ->
    @groups[key].data.checkOutdated(Spirit.GROUP_PERIODS[key])

  periodicGenerate: (key, x, y) ->
    if @game.time.now > @groups[key].lastGenerationTime + Spirit.GROUP_INTERVALS[key]
      if @groups[key].isColony then @_createColony(key, x, y) else @_createSingle(key, x, y)
      @groups[key].lastGenerationTime = @game.time.now + parseInt(Math.random() * Spirit.GROUP_INTERVALS[key], 10)

  _createColony: (key, x, y) ->
    centerOffset = 300
    cornerX = (if x % 2 == 0 then centerOffset else @game.world.width - centerOffset)
    cornerY = (if y % 2 == 0 then centerOffset else @game.world.height - centerOffset)
    cornerY = @game.world.randomX % (@game.world.height - 400) if key == 'enemy_flying'
    for i in [1..@progressManager.colonyAmount] by 1
      newX = @groups[key].data.behaviour.offsetX(cornerX, cornerY, i)
      newY = @groups[key].data.behaviour.offsetY(cornerX, cornerY, i)
      @groups[key].data.create(newX, newY)

  _createSingle: (key, x, y) ->
    @groups[key].data.create(x, y)

