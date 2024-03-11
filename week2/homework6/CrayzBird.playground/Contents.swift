import UIKit

// --------------- Murat Albayrak ----------------

import Foundation

class Cannon {
    var theta: Double
    var speed: Double
    
    init(theta: Double, speed: Double) {
        self.theta = theta
        self.speed = speed
        range(theta, speed)
    }
    
    var x = 0.0
    var sinx = 0.0
    var range = 0.0
    
    func range(_ theta: Double, _ speed: Double) -> Double{
        x = Double(2*theta)
        let radyan = x * Double.pi / 180
        sinx = sin(radyan)
        range = speed*speed*sinx/10
        return range
    }
}

class Bottle {
    var d: Double
    var delta: Double
    var state: Int
    var r: Double
    
    
    init(d: Double, delta: Double, state: Int, r: Double) {
        self.d = d
        self.delta = delta
        self.state = state
        self.r = r
        if (d + delta >= r && d - delta <= r){
            self.state = 0
        } else {
            self.state = 1
        }
    }
    
    
    
}

class Player {
    
    var nickName: String
    var score: Int
    
    init(nickName: String, score: Int) {
        self.nickName = nickName
        self.score = score
    }
}

class Game {
    var cannon: Cannon
    var player: Player
    var bottle: Bottle
    
    init(cannon: Cannon, player: Player, bottle: Bottle) {
        self.cannon = cannon
        self.player = player
        self.bottle = bottle
    }
    
    func createNickName(_ nickName: String) {
        player.nickName = nickName
    }
    
    func enterDValue(_ d: Double) {
        bottle.d = d
    }
    
    func enterSpeedAndTheta(_ theta: Double, _ speed: Double) {
        cannon.speed = speed
        cannon.theta = theta
    }
    
    func throwFunc() {
        if (bottle.state == 0) {
            player.score += 1
        }
    }
}

let cannon = Cannon(theta: 15, speed: 20)
let bottle = Bottle(d: 19, delta: 3, state: 1, r: cannon.range)
let player = Player(nickName: "murat", score: 0)

let game = Game(cannon: cannon, player: player, bottle: bottle)



game.throwFunc()

print(player.score)





































