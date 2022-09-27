//
//  Calculator - CalculatorViewController.swift
//  Created by 미니.
//

import UIKit

class CalculatorViewController: UIViewController {
    var userInputs: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func didTappedNumberButton(_ sender: UIButton) {
        let input = sender.titleLabel?.text
        guard let input else {
            return
        }
        userInputs.append(input)
    }
    
    
    @IBAction func didTappedOperator(_ sender: UIButton) {
        let prevText: Character? = userInputs.popLast()
        let input = sender.titleLabel?.text
        
        guard let input, let prevText = prevText else {
            return
        }
        
        if Operator(rawValue: prevText) != nil {
            userInputs.append(input)
        } else {
            userInputs.append(prevText)
            userInputs.append(input)
        }
        
    }
}

