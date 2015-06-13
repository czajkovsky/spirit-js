window.Spirit =
  Enemies: {}
  Behaviours: {}

  COLLISIONS_MASKS:
    enemy_random: 25
    enemy_sticky: 25
    enemy_flying: 25
    coin: 17
    cloud_active: 33
    cloud_inactive: 17
    player: 39
    wall: 63

  COLLISIONS_CATEGORIES:
    enemy_random: 32
    enemy_sticky: 32
    enemy_flying: 32
    coin: 2
    cloud_active: 8
    cloud_inactive: 4
    player: 16
    wall: 1

  GROUP_INTERVALS:
    coin: 500
    enemy_random: 5000
    enemy_sticky: 7000
    enemy_flying: 9000
    cloud_inactive: 3000

  GROUP_PERIODS:
    cloud_active: 9000
    coin: 8000
