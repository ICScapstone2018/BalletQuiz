//
//  ResultsViewController.swift
//  BalletQuiz
//
//  Created by Renz on 2018-02-28.
//  Copyright © 2018 Renz. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    //Properties  for the various UI elements
    
    @IBOutlet weak var finalResults: UILabel!
    
    @IBOutlet weak var finalResultsNumbers: UILabel!
    
    
    @IBOutlet weak var button: UIButton!
    
    var numCorrect = 0
    var total = 0
    let randomNum = arc4random_uniform(10)
    
    //Actions
    

    
    
   
    
    
    @IBAction func backButton(_ sender: Any) {
performSegue(withIdentifier: "unwindSegueToVC1", sender: self)
        
    }
    
    //@IBAction func goBackToOne(_ sender: Any) {
        //performSegue(withIdentifier: "unwindSegueToVC1", sender: self)
   // }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Display the results on the screen
        finalResultsNumbers.text = "You got \(numCorrect) out of \(total) correct"
        
        var title = "to be determined"
        // Display a happy message
        if (randomNum < 2) {
            title = "Just keep learning."
        }
        else if (randomNum < 4) {
            title = "Good job, hope you learned something!"
        }
        else if (randomNum < 6) {
            title = "Nice work, gold star!"
        }
        else if (randomNum < 8) {
            title = "You're the dancing queen"
        }
        else {
            title = "You're the best!"
        }
     finalResults.text = title
   
       button.setTitle("Restart Quiz", for: .normal)
    }
    
    //func restartGame() {
        // Load the initial screen again
        //performSegue(withIdentifier: "sgReturnToStart", sender: nil)
  //  }
    
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
