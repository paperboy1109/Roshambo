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

