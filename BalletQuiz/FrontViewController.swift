//
//  FrontViewController.swift
//  BalletQuiz
//
//  Created by  Kerensa E Mattison on 2018-03-01.
//  Copyright © 2018 Renz. All rights reserved.
//

import UIKit

class FrontViewController: UIViewController {

    // Properties
    
    @IBOutlet weak var message: UITextView!
    
    
    @IBOutlet weak var start: UIButton!
    
    // Actions
    
    @IBAction func startGame(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
