//
//  StatisticsViewController.swift
//  GuesserApp
//
//  Created by student on 2/26/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet weak var MinLBL: UILabel!
    
    @IBOutlet weak var MaxLBL: UILabel!
    
    @IBOutlet weak var MeanLBL: UILabel!
    
    @IBOutlet weak var StdDevLBL: UILabel!
    
    @IBAction func ClearStatisticsBTN(_ sender: Any) {
    MinLBL.text = "0"
        MaxLBL.text = "0"
        MeanLBL.text = "0"
        StdDevLBL.text = "0"
        Guesser.shared.clearStatistics()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        calculation()
       
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        calculation()
    }
    
    
    func calculation(){
        
        MinLBL.text = String(Guesser.shared.minimumNumAttempts())
        MaxLBL.text = String(Guesser.shared.maximumNumAttempts())
        var increment = 0
        var standardDev = 0.0
        if Guesser.shared.numGuesses() == 0 {
            MeanLBL.text = "0"
            StdDevLBL.text = "0"
            
        }
        else{
        
        for i in 0..<Guesser.shared.numGuesses(){
            increment = increment + Guesser.shared.guess(index: i).numAttemptsRequired
        }
        let meanValue = Double(increment) / Double(Guesser.shared.numGuesses())
    MeanLBL.text = String(format: "%.2f", meanValue)
        for i in 0..<Guesser.shared.numGuesses(){
            standardDev = standardDev + pow(Double(Guesser.shared.guess(index: i).numAttemptsRequired) - meanValue, 2)
        }
        let std = sqrt(standardDev / Double(Guesser.shared.numGuesses()))
            StdDevLBL.text = String(format: "%.2f", std)
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
