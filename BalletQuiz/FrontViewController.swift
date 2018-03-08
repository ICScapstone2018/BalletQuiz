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
    
    @IBAction func startGame(_ sender: Any) {
        loadGame()
    }
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) {
          }
    
    func loadGame() {
        // Load the game screen
            performSegue(withIdentifier: "showQuiz", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        message.text = "Welcome to the ballet quiz, please play the game to learn more about ballet while showing off your prior knowledge. Just tap the button to get started, and then tap your answer to each question!"

        start.setTitle("Start Quiz", for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
