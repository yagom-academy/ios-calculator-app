//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainStackView: UILabel!
    @IBOutlet weak var btnDot: UIButton!
    @IBOutlet weak var btnEquality: UIButton!
    @IBOutlet weak var btnAddition: UIButton!
    @IBOutlet weak var btnSubtraction: UIButton!
    @IBOutlet weak var btnMultiplication: UIButton!
    @IBOutlet weak var btnDivision: UIButton!
 
    @IBOutlet weak var operatorLabel: UILabel!
    
    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnCE: UIButton!    
    
    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpDigitButton(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else {
            return
        }
        guard let titleLabelText = titleLabel.text else {
            return
        }
        switch sender {
        case btnDot:
            addDot(titleLabelText)
        default:
            addNumber(titleLabelText)
        }
    }
    
    @IBAction func pushOperatorButton(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else {
            return
        }
        guard let text = titleLabel.text else {
            return
        }
        let value = operatorLabel.text
        switch value {
        case "+":
            calculator.pushNumberOrOperator(Operator(type: .addition))
        case "−":
            calculator.pushNumberOrOperator(Operator(type: .subtraction))
        case "×":
            calculator.pushNumberOrOperator(Operator(type: .mulitplication))
        case "÷":
            calculator.pushNumberOrOperator(Operator(type: .division))
        default:
            do {
                let result = try calculator.makeCalculation()
                mainStackView.text = String(Double(result))
            } catch {
                
            }
        }
    }
    
    @IBAction func pushChangingUIButton(_ sender: UIButton) {
        switch sender {
        case btnAC:
            mainStackView.text = "0"
        case btnCE:
            mainStackView.text = "0"
        default:
            mainStackView.text = "0"
        }
    }
}

extension ViewController {
    func addDot(_ dot: String) {
        
    }
    
    func addNumber(_ value: String) {
    }
    
    func pushOperator(_ value: String) {
  
    }
}
