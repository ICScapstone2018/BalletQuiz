//
//  FrontViewController.swift
//  BalletQuiz
//
//  Created by  Kerensa E Mattison on 2018-03-01.
//  Copyright © 2018 Renz. All rights reserved.
//

import UIKit

class FrontViewController: UIViewController {

    // Properties for the various UI elements
    
    @IBOutlet weak var message: UITextView!
    
    @IBOutlet weak var start: UIButton!
    
    // Actions
    
    // To call the loadGame() function
    @IBAction func startGame(_ sender: Any) {
        loadGame()
    }
    
    // So that the game can be unwound from the last View Controller
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) {
          }
    // Load the game screen View Controller
    func loadGame() {
            performSegue(withIdentifier: "showQuiz", sender: nil)
    }
    
    // Load the various UI elements with text
    override func viewDidLoad() {
        super.viewDidLoad()

        message.text = "Welcome to the ballet quiz, please play the game to learn more about ballet while showing off your prior knowledge. Just tap the button to get started, and then tap your answer to each question!"

        start.setTitle("Start Quiz", for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
