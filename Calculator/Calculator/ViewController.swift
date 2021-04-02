//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberField: UITextField!
    
    @IBAction func touchUpNumber(_ sender: UIButton) {
        numberField.text?.append(sender.currentTitle!)
    }
    
    @IBAction func touchUpOperator(_ sender: Any) {
    }
    
    @IBAction func touchUpToggle(_ sender: Any) {
    }
    
    @IBAction func touchUpChangeMode(_ sender: Any) {
    }
    
    @IBAction func touchUpReset(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func getInput() {
        
    }
}
