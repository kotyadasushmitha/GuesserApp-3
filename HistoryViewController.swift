//
//  SecondViewController.swift
//  GuesserApp
//
//  Created by student on 2/26/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Guesser.shared.numGuesses()
        
    }
    
    @IBOutlet weak var myTableView: UITableView!
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "history")!
        cell.textLabel?.text = "Correct Answer: " + String(Guesser.shared.guess(index: indexPath.row).correctAnswer)
        cell.detailTextLabel?.text = "# Attempts: " + String(Guesser.shared.guess(index: indexPath.row).numAttemptsRequired)
        return cell
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }


}

