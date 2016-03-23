//
//  GameOutcomeVC.swift
//  Roshambo
//
//  Created by Daniel J Janiak on 3/22/16.
//  Copyright © 2016 Daniel J Janiak. All rights reserved.
//

import UIKit

class GameOutcomeVC: UIViewController {

    @IBOutlet var gameOutcomeImg: UIImageView!
    
    @IBOutlet var playAgainBtn: UILabel!
    @IBOutlet var gameOutcomeLbl: UILabel!
    
    enum Action: String {
        case ROCK = "rock"
        case PAPER = "paper"
        case SCISSORS = "scissors"
    }
    
    //var playerAction: String?
    //var opponentAction: String?
    
    var playerAction: Action?
    var opponentAction: Action?
    
    override func viewWillAppear(animated: Bool) {
        
        opponentAction = self.randomRPS()
        
        print(opponentAction)
        print(playerAction)
        
        if let playerAction = self.playerAction, opponentAction = self.opponentAction {
            
            if playerAction.rawValue == "rock" {
                if opponentAction.rawValue == "rock" {
                    gameOutcomeImg.image = UIImage(named: "itsATie")
                } else if opponentAction.rawValue == "paper" {
                    gameOutcomeImg.image = UIImage(named: "PaperCoversRock")
                } else if opponentAction.rawValue == "scissors" {
                    gameOutcomeImg.image = UIImage(named: "RockCrushesScissors")
                } else {
                    gameOutcomeImg.image = nil
                }
            }

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(opponentAction)
        print(playerAction)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func randomRPS() -> Action {

        let randomValue = Int(1 + arc4random() % 3)
        print("random value is: \(randomValue)")

        switch randomValue {

        case 1 :
            return .ROCK

        case 2 :
            return .PAPER

        case 3 :
            return .SCISSORS

        default :
            return .ROCK
            
        }
        
    }

    
}
