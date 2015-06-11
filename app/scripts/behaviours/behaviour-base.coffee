class Spirit.Behaviours.Base
  _randomVelocity: ->
    sign = (if Math.random() > 0.5 then -1 else 1)
    base = parseInt(Math.random() * 100, 10)
    sign * base
