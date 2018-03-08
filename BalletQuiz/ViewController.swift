//
//  ViewController.swift
//  BalletQuiz
//
//  Created by Renz on 2018-02-28.
//  Copyright © 2018 Renz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Properties for the various UI elements
    
    @IBOutlet weak var question: UITextView!
    
    @IBOutlet weak var answer0: UIButton!
    
    @IBOutlet weak var answer1: UIButton!
    
    @IBOutlet weak var answer2: UIButton!
    
    @IBOutlet weak var answer3: UIButton!
    
    @IBOutlet weak var progress: UILabel!
    
    @IBOutlet weak var score: UILabel!
    
    // Actions to submit answers using the various UI buttons
    // Calls the checkAnswer function with the button that was pressed
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
    
    // To hold the number of correct answers as the quiz goes along
    var numCorrect = 0
    
    // Struct that will hold questions, answers, and right answer
    struct Question {
        let question: String
        let answers: [String]
        let rightAnswer: Int
    }
    // Sets up the questions and which question to start with
    var questions: [Question] = [
    Question(
        question: "Which of the following is not a method of ballet?",
        answers: ["Martha Graham", "Cecchetti", "Vaganova", "Royal Academy of Dance"],
        rightAnswer: 0),
    Question(
        question: "Which of these is not a ballet jump?",
        answers: ["Assemble", "Pas de Chat", "Grand Jete", "Arabesque"],
        rightAnswer: 3),
    Question(
        question: "Which of the following is not a material for ballet slippers?",
        answers: ["Silk", "Fleece", "Canvas", "Cotton"],
        rightAnswer: 1),
    Question(
        question: "What might signal a dancer's readiness for pointe work?",
        answers: ["Soft foot bones", "Weak ankles", "Under age 10", "Strong technique"],
        rightAnswer: 3),
    Question(
        question: "Which of the following is not a name for a member of a ballet company?",
        answers: ["Principal", "Corps de Ballet", "Grand Master", "Soloist"],
        rightAnswer: 2),
    Question(
        question: "A male ballet dancer might commonly wear?",
        answers: ["Tutu", "Tights", "Pointe shoes", "Hairpiece"],
        rightAnswer: 1),
    Question(
        question: "Which is not a modern-day classical ballet position?",
        answers: ["First", "Fifth", "Second", "Sixth"],
        rightAnswer: 3),
    Question(
        question: "Fondu is a term used in ballet, where it means?",
        answers: ["To melt", "Melted cheese", "Melted chocolate", "To unfold"],
        rightAnswer: 0)
    ]
    
    // Sets up which question to start with
    var currentQuestion : Question?
    var currentQuestionPos = 0

    // Checks if the answer was right (gives a point if so),
    // alerts the user if right or wrong, then goes onto the next question
    func checkAnswer(idx: Int) {
        if(idx == currentQuestion!.rightAnswer) {
            numCorrect += 1
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
    
    // To load the next question or results screen as appropriate
    func loadNextQuestion() {
        // Show the next question
        if(currentQuestionPos + 1 < questions.count) {
            currentQuestionPos += 1
            currentQuestion = questions[currentQuestionPos]
            setQuestion()
        // If there aren't anymore questions then show the final results screen
        } else {
            performSegue(withIdentifier: "showFinalResults", sender: nil)
        }
    }
        
    // Fill in the labels and buttons with text for the current question
    // And with the current queston the user is on and their current points
    func setQuestion() {
        question.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        
        progress.text = "\(currentQuestionPos + 1) / \(questions.count)"
        
        score.text = "Score: \(numCorrect)/\(currentQuestionPos)"
    }
 
    // To pass the total number correct (& out of how many) results to the Result screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showFinalResults") {
            let vc = segue.destination as! ResultsViewController
            vc.numCorrect = numCorrect
            vc.total = questions.count
        }
    }
    
    // To load the UI elements with text (or call functions to do so)
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestion = questions[0]
        setQuestion()
        score.text = "Score: 0/\(currentQuestionPos)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

