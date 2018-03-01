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
    
    var numCorrect = 0
    
    // Actions
    
    // Submit answers
    @IBAction func submitAnswer0(_ sender: Any) {
        checkAnswer(idx: 0)
    }
    
    @IBAction func submitAnswer1(_ sender: Any) {
        checkAnswer(idx: 1)
    }
    
    @IBAction func submitAnswer2(_ sender: Any) { 
        checkAnswer(idx: 2)
    }
    
    @IBAction func submitAnswer3(_ sender: Any) {
        checkAnswer(idx: 3)
    }
    
    // Sets up the questions and which question to start with
    struct Question {
        let question: String
        let answers: [String]
        let rightAnswer: Int
    }
    
    var questions: [Question] = [
    Question(
        question: "the q",
        answers: ["right answer", "nn", "jj", "nnn"],
        rightAnswer: 0),
    Question(
        question: "the q",
        answers: ["hh", "nn", "jj", "right answer"],
        rightAnswer: 3)
    ]
    
    var currentQuestion : Question?
    var currentQuestionPos = 0
    
    var totalCorrect = 0
    
    // Checks if the answer was right, then goes onto the next question
    func checkAnswer(idx: Int) {
        if(idx == currentQuestion!.rightAnswer) {
            numCorrect += 1
        }
        loadNextQuestion()
    }
    
    func loadNextQuestion() {
        // Show the next question
        if(currentQuestionPos + 1 < questions.count) {
            currentQuestionPos += 1
            currentQuestion = questions[currentQuestionPos]
            setQuestion()
        // If there aren't anymore questions then show the final results
        } else {
            performSegue(withIdentifier: "showFinalResults", sender: nil)
        }
    }
        
    // Fill in the labels and buttons with text for the current question
    func setQuestion() {
        question.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        progress.text = "\(currentQuestionPos + 1) / \(questions.count)"
    }   
 
    // To paass the total number correct (out of how many) results to the Result screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showFinalResults") {
            var vc = segue.destination as! ResultsViewController
            vc.numCorrect = numCorrect
            vc.total = questions.count
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestion = questions[0]
        setQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

