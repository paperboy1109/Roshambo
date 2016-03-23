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
        
        print("*viewWillAppear*")
        print(opponentAction)
        print(playerAction)
        
        if let playerAction = self.playerAction, opponentAction = self.opponentAction {
            
            determineWinner(playerAction, opponentAction: opponentAction)
            announceOutcome()

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("*viewDidLoad*")
        print(opponentAction)
        print(playerAction)
    }
    

    
    /**
     *    generate a random move for the opponent (computer player)
     */
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
    
    /**
     *    determine who won the game and show the appropriate image
     */
    func determineWinner(playerAction: Action, opponentAction: Action) {
        
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
            
        } else if playerAction.rawValue == "paper" {
            if opponentAction.rawValue == "rock" {
                gameOutcomeImg.image = UIImage(named: "PaperCoversRock")
            } else if opponentAction.rawValue == "paper" {
                gameOutcomeImg.image = UIImage(named: "itsATie")
            } else if opponentAction.rawValue == "scissors" {
                gameOutcomeImg.image = UIImage(named: "ScissorsCutPaper")
            } else {
                gameOutcomeImg.image = nil
            }
        } else if playerAction.rawValue == "scissors" {
            if opponentAction.rawValue == "rock" {
                gameOutcomeImg.image = UIImage(named: "RockCrushesScissors")
            } else if opponentAction.rawValue == "paper" {
                gameOutcomeImg.image = UIImage(named: "ScissorsCutPaper")
            } else if opponentAction.rawValue == "scissors" {
                gameOutcomeImg.image = UIImage(named: "itsATie")
            } else {
                gameOutcomeImg.image = nil
            }
        }
        
    }
    
    /**
     *    Show a message according to who won
     */
    func announceOutcome() {
        if gameOutcomeImg.image == UIImage(named: "itsATie") {
            gameOutcomeLbl.text = "It's a tie"
        } else if gameOutcomeImg.image == UIImage(named: "PaperCoversRock") {
            gameOutcomeLbl.text = "Paper Covers Rock"
        } else if gameOutcomeImg.image == UIImage(named: "RockCrushesScissors") {
            gameOutcomeLbl.text = "Rock Crushes Scissors"
        } else if gameOutcomeImg.image == UIImage(named: "ScissorsCutPaper") {
            gameOutcomeLbl.text = "Scissors Cut Paper"
        } else {
            gameOutcomeLbl.text = "Sorry, an error has occurred"
        }
    }
    
    
    /**
     *    dismiss this view controller
     */
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    

    
}
