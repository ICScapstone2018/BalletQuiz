//
//  ViewController.swift
//  BalletQuiz
//
//  Created by Renz on 2018-02-28.
//  Copyright © 2018 Renz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties
    
    @IBOutlet weak var question: UITextView!
    
    @IBOutlet weak var answer0: UIButton!
    
    @IBOutlet weak var answer1: UIButton!
    
    @IBOutlet weak var answer2: UIButton!
    
    @IBOutlet weak var answer3: UIButton!
    
    @IBOutlet weak var progress: UILabel!
    
    // Actions
    
    @IBAction func submitAnswer0(_ sender: Any) {
    }
    
    @IBAction func submitAnswer1(_ sender: Any) {
    }
    
    @IBAction func submitAnswer2(_ sender: Any) {
    }
    
    @IBAction func submitAnswer3(_ sender: Any) {
    }
    
    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    
    var questions: [Question] = [
    Question(
        question: "the q",
        answers: ["hh", "nn", "jj", "nnn"],
        correctAnswer: 2),
    Question(
        question: "the q",
        answers: ["hh", "nn", "jj", "nnn"],
        correctAnswer: 2)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

