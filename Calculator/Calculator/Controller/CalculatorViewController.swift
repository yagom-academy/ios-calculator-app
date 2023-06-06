//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var signLabel: UILabel!
    
    var currentSegment: String = ""
    var currentSign: String = "+"
    
    override func viewDidLoad() {
        
    }
    
    private func configureLabel() {
        self.resultLabel.text = "0"
        self.signLabel.text = "+"
    }
    
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
    
    }
    
    
    @IBAction func tapDecimalPointButton(_ sender: UIButton) {
        
    }
    
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        
    }

    
    @IBAction func tapEqualButton(_ sender: UIButton) {
        
    }
    
    @IBAction func tapAllClearButton(_ sender: UIButton) {
        
    }
    
    
    @IBAction func tapClearEntryButton(_ sender: UIButton) {
        
    }
    
    @IBAction func tapSignChangeButton(_ sender: UIButton) {
        
    }
}

