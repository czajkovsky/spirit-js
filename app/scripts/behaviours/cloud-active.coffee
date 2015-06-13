class Spirit.Behaviours.CloudActive extends Spirit.Behaviours.Base
  initPhysics: ->
    @sprite.body.setCircle(160)
    @sprite.body.static = true
