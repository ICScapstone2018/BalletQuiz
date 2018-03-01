//
//  ResultsViewController.swift
//  BalletQuiz
//
//  Created by Renz on 2018-02-28.
//  Copyright © 2018 Renz. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    //Properties
    @IBOutlet weak var finalResults: UILabel!
    
    @IBOutlet weak var finalResultsNumbers: UILabel!
    
    var numCorrect = 0
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Display the results on the screen
        finalResultsNumbers.text = "You got \(noCorrect) out of \(total) correct"
          
        // Display a happy message
        var title = "Good job, hope you learned something!"
        finalResults.text = title
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
