//
//  ViewController.swift
//  You think you know the flags
//
//  Created by Bold Lion on 27.09.18.
//  Copyright © 2018 Bold Lion. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        askQuestions()
    }

    @objc func askQuestions(action: UIAlertAction! = nil) {
        // randomize the order of countries in the array each time
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        // returns 0, 1 and 2 (1 less than the upper bound!)
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = "Which is " + countries[correctAnswer].capitalized + "'s flag?"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct!"
            score += 1
        }
        else {
            title = "Wrong!"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestions))
        present(ac, animated: true)
    }

}

