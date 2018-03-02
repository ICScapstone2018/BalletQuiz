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
        question: "Which of the following is not a method of ballet?",
        answers: ["Martha Graham", "Cecchetti", "Vaganova", "Royal Academy of Dance"],
        rightAnswer: 0),
    Question(
        question: "Which of the following is not a ballet jump?",
        answers: ["Assemble", "Pas de Chat", "Grand Jete", "Arabesque"],
        rightAnswer: 3),
    Question(
        question: "Which of the following is not a material for ballet slippers?",
        answers: ["Silk", "Fleece", "Canvas", "Cotton"],
        rightAnswer: 1)
    ]
    
    var currentQuestion : Question?
    var currentQuestionPos = 0
    
    var totalCorrect = 0

    // Checks if the answer was right, then goes onto the next question
    func checkAnswer(idx: Int) {
        if(idx == currentQuestion!.rightAnswer) {
            numCorrect += 1
            //loadNextQuestion()
            let rightAnswer = UIAlertController(title: "Yes!",
                                                message: "Great job, \(currentQuestion!.answers[idx]) was the correct answer",
                preferredStyle: .alert)
            rightAnswer.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default Action"), style: .default, handler: { _ in NSLog("The \"OK\" alert occured.")
                self.loadNextQuestion()
            }))
            self.present(rightAnswer, animated: true, completion: nil)        }
        else {
            let wrongAnswer = UIAlertController(title: "Sorry",
                                                message: "Sorry, \(currentQuestion!.answers[idx]) was the wrong answer",
                                                preferredStyle: .alert)
            wrongAnswer.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default Action"), style: .default, handler: { _ in NSLog("The \"OK\" alert occured.")
                    self.loadNextQuestion()
            }))
            self.present(wrongAnswer, animated: true, completion: nil)
        }
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
            let vc = segue.destination as! ResultsViewController
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

