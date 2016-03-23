//
//  PlayGameVC.swift
//  Roshambo
//
//  Created by Daniel J Janiak on 3/22/16.
//  Copyright © 2016 Daniel J Janiak. All rights reserved.
//

import UIKit

class PlayGameVC: UIViewController {
    
    
    @IBOutlet var rockBtn: UIButton!
    @IBOutlet var paperBtn: UIButton!
    @IBOutlet var scissorsBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! GameOutcomeVC
        
        if segue.identifier == "paperTapped"{
            controller.playerAction = .PAPER
        } else if segue.identifier == "scissorsTapped" {
            controller.playerAction = .SCISSORS
        }
    }
    
    /**
     * Randomly chooses an action for the opponent (virutal player)
     */
//    func randomRPS() -> Action {
//        
//        let randomValue = Int(1 + arc4random() % 3)
//        
//        switch randomValue {
//            
//        case 1 :
//            return "rock"
//            
//        case 2 :
//            return "paper"
//            
//        case 3 :
//            return "scissors"
//            
//        default :
//            return "rock"
//            
//        }
//        
//    }
    
    
     /**
     * Player chose rock
     */
    @IBAction func rockTapped() {
        
        var controller: GameOutcomeVC
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("GameOutcomeVC") as! GameOutcomeVC
        
        controller.playerAction = .ROCK
        //controller.opponentAction.rawValue = self.randomRPS()
        
        presentViewController(controller, animated: true, completion: nil)
        
        
    }
    
    @IBAction func paperTapped() {
        
        performSegueWithIdentifier("paperTapped", sender: self)
        
    }


}

