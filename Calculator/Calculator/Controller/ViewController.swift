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
    @IBOutlet weak var btnSign: UIButton!
    
    
    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushButton(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else {
            return
        }
        guard let text = titleLabel.text else {
            return
        }
        guard let currentText = mainStackView.text else {
            return
        }
        switch sender {
        case btnDot:
            addDot(btnDot)
        case btnSign:
            if currentText == "0" {
                mainStackView.text = "0"
            } else {
                mainStackView.text = "-" + currentText
            }
            
        default:
            addNumber(text)
            mainStackView.text = currentText + text
        // addNumber() - 숫자를 레이블에 추가
//
//            calculator.pushNumberOrOperator(Operand(value: Double(text)!))
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
    func addDot(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else {
            return
        }
        guard let text = titleLabel.text else {
            return
        }
        guard let currentText = mainStackView.text else {
            return
        }
        if !currentText.contains(text){
            mainStackView.text = currentText + text
        }
    }
    
    func addNumber(_ value: String) {
        //if mainStackView.is
    }
    
    func pushOperator(_ value: String) {
        operatorLabel.text = value
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
                mainStackView.text = String(result)
            } catch {
                
            }
        }
    }
}
