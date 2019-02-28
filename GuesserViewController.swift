//
//  FirstViewController.swift
//  GuesserApp
//
//  Created by student on 2/26/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class GuesserViewController: UIViewController {
    
    
    @IBOutlet weak var myGuessTF: UITextField!
    
    @IBOutlet weak var guessTheLBL: UILabel!
    @IBAction func amIRightBTN(_ sender: Any) {
        if let text = Int(myGuessTF.text!){
            let result = Guesser.shared.amIRight(guess: text)
        if result == Result.correct{
            
          displayMessage()
            Guesser.shared.createNewProblem()
        }
        else{
        guessTheLBL.text = result.rawValue
    }
        }
            else{
                guessTheLBL.text = "Invalid data"
            }
        }
    
   
    @IBAction func createNewProbBTN(_ sender: Any) {
        
       myGuessTF.text = ""
        guessTheLBL.text = ""
        Guesser.shared.createNewProblem()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Guesser.shared.createNewProblem()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func displayMessage(){
        let alert = UIAlertController(title: "Well done",
                                      message: "You got it in \(Guesser.shared.numAttempts) tries",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

