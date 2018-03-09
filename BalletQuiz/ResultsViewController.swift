//
//  ResultsViewController.swift
//  BalletQuiz
//
//  Created by Renz on 2018-02-28.
//  Copyright © 2018 Renz. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    // Properties  for the various UI elements
    
    @IBOutlet weak var finalResults: UILabel!
    
    @IBOutlet weak var finalResultsNumbers: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    // To hold the number of correct answers
    var numCorrect: UInt = 0
    // To hold the total number of questions
    var total: UInt = 0
    
    // Actions to go back to the first screen of app
    @IBAction func backButton(_ sender: Any) {
performSegue(withIdentifier: "unwindSegueToVC1", sender: self)
    }
    
     // To load the various UI elements with text
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Display the results on the screen
        finalResultsNumbers.text = "You got \(numCorrect) out of \(total) correct"
        
        var title = "to be determined"
        // Use the score (numCorrect) to display appropriate message
        if (numCorrect < 2) {
            title = "Just keep learning."
        }
        else if (numCorrect < 4) {
            title = "Good job, hope you learned something!"
        }
        else if (numCorrect < 6) {
            title = "Nice work, gold star!"
        }
        else if (numCorrect < 8) {
            title = "You're the dancing queen"
        }
        else {
            title = "You're the best!"
        }
       finalResults.text = title
   
       button.setTitle("Restart Quiz", for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
