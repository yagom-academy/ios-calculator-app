//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var operandInputLabel: UILabel!
    @IBOutlet weak var operatorInputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetOperandInputLabel()
        resetOperatorInputLabel()
    }
}

extension ViewController {
    @IBAction func didTapOperandButton(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapOperatorButton(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapCalculateButton(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapClearButton(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapChangeSignButton(_ sender: UIButton) {
        
    }
}

extension ViewController {
    private func resetOperandInputLabel() {
        operandInputLabel.text = "0"
    }
    
    private func resetOperatorInputLabel() {
        operatorInputLabel.text = ""
    }
}
