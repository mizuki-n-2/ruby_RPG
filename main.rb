require './brave'
require './monster'
require './games_controller'
require './message_dialog'

include MessageDialog

braves = [
  {
    name: "テリー",
    hp: 600,
    offense: 250,
    defense: 50
  },
  {
    name: "ヨシヒコ",
    hp: 2000,
    offense: 500,
    defense: 50
  }
]

monsters = [
  {
    name: "スライムA",
    hp: 250,
    offense: 150,
    defense: 100
  },
  {
    name: "スライムB",
    hp: 500,
    offense: 100,
    defense: 300
  },
  {
    name: "スライムC",
    hp: 1000,
    offense: 50,
    defense: 200
  }
]

brave_rand = rand(2)
monster_rand = rand(3)

brave = Brave.new(braves[brave_rand])
monster = Monster.new(monsters[monster_rand])

start_message(brave: brave, monster: monster)

game = GamesController.new
game.battle(brave: brave, monster: monster)